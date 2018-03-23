From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:23:57 +0100
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.79
Message-ID: <20180323152955.9873D80FB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8dec6271a1c99a57be1a016b14ceb8965a30a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...for-wildcard-NSEC-records.-CVE-2017-15107.patch | 212 ---------------------
 ...validation-errors-introduced-in-4fe6744a2.patch |  29 ---
 package/dnsmasq/dnsmasq.hash                       |   4 +-
 package/dnsmasq/dnsmasq.mk                         |   2 +-
 4 files changed, 3 insertions(+), 244 deletions(-)

diff --git a/package/dnsmasq/0001-DNSSEC-fix-for-wildcard-NSEC-records.-CVE-2017-15107.patch b/package/dnsmasq/0001-DNSSEC-fix-for-wildcard-NSEC-records.-CVE-2017-15107.patch
deleted file mode 100644
index 7b834e80e2..0000000000
--- a/package/dnsmasq/0001-DNSSEC-fix-for-wildcard-NSEC-records.-CVE-2017-15107.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 4fe6744a220eddd3f1749b40cac3dfc510787de6 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Fri, 19 Jan 2018 12:26:08 +0000
-Subject: [PATCH] DNSSEC fix for wildcard NSEC records. CVE-2017-15107 applies.
-
-It's OK for NSEC records to be expanded from wildcards,
-but in that case, the proof of non-existence is only valid
-starting at the wildcard name, *.<domain> NOT the name expanded
-from the wildcard. Without this check it's possible for an
-attacker to craft an NSEC which wrongly proves non-existence
-in a domain which includes a wildcard for NSEC.
-
-[baruch: drop the CHANGELOG hunk]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: upstream commit 4fe6744a220e
-
- CHANGELOG    |  12 +++++-
- src/dnssec.c | 117 ++++++++++++++++++++++++++++++++++++++++++++++++++++-------
- 2 files changed, 114 insertions(+), 15 deletions(-)
-
-diff --git a/src/dnssec.c b/src/dnssec.c
-index eb6c11cbe00f..a54a0b4f14cf 100644
---- a/src/dnssec.c
-+++ b/src/dnssec.c
-@@ -103,15 +103,17 @@ static void from_wire(char *name)
- static int count_labels(char *name)
- {
-   int i;
--
-+  char *p;
-+  
-   if (*name == 0)
-     return 0;
- 
--  for (i = 0; *name; name++)
--    if (*name == '.')
-+  for (p = name, i = 0; *p; p++)
-+    if (*p == '.')
-       i++;
- 
--  return i+1;
-+  /* Don't count empty first label. */
-+  return *name == '.' ? i : i+1;
- }
- 
- /* Implement RFC1982 wrapped compare for 32-bit numbers */
-@@ -1094,8 +1096,8 @@ static int hostname_cmp(const char *a, const char *b)
-     }
- }
- 
--static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsigned char **nsecs, int nsec_count,
--				    char *workspace1, char *workspace2, char *name, int type, int *nons)
-+static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsigned char **nsecs, unsigned char **labels, int nsec_count,
-+				    char *workspace1_in, char *workspace2, char *name, int type, int *nons)
- {
-   int i, rc, rdlen;
-   unsigned char *p, *psave;
-@@ -1108,6 +1110,9 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
-   /* Find NSEC record that proves name doesn't exist */
-   for (i = 0; i < nsec_count; i++)
-     {
-+      char *workspace1 = workspace1_in;
-+      int sig_labels, name_labels;
-+
-       p = nsecs[i];
-       if (!extract_name(header, plen, &p, workspace1, 1, 10))
- 	return 0;
-@@ -1116,7 +1121,27 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
-       psave = p;
-       if (!extract_name(header, plen, &p, workspace2, 1, 10))
- 	return 0;
--      
-+
-+      /* If NSEC comes from wildcard expansion, use original wildcard
-+	 as name for computation. */
-+      sig_labels = *labels[i];
-+      name_labels = count_labels(workspace1);
-+
-+      if (sig_labels < name_labels)
-+	{
-+	  int k;
-+	  for (k = name_labels - sig_labels; k != 0; k--)
-+	    {
-+	      while (*workspace1 != '.' && *workspace1 != 0)
-+		workspace1++;
-+	      if (k != 1 && *workspace1 == '.')
-+		workspace1++;
-+	    }
-+	  
-+	  workspace1--;
-+	  *workspace1 = '*';
-+	}
-+	  
-       rc = hostname_cmp(workspace1, name);
-       
-       if (rc == 0)
-@@ -1514,24 +1539,26 @@ static int prove_non_existence_nsec3(struct dns_header *header, size_t plen, uns
- 
- static int prove_non_existence(struct dns_header *header, size_t plen, char *keyname, char *name, int qtype, int qclass, char *wildname, int *nons)
- {
--  static unsigned char **nsecset = NULL;
--  static int nsecset_sz = 0;
-+  static unsigned char **nsecset = NULL, **rrsig_labels = NULL;
-+  static int nsecset_sz = 0, rrsig_labels_sz = 0;
-   
-   int type_found = 0;
--  unsigned char *p = skip_questions(header, plen);
-+  unsigned char *auth_start, *p = skip_questions(header, plen);
-   int type, class, rdlen, i, nsecs_found;
-   
-   /* Move to NS section */
-   if (!p || !(p = skip_section(p, ntohs(header->ancount), header, plen)))
-     return 0;
-+
-+  auth_start = p;
-   
-   for (nsecs_found = 0, i = ntohs(header->nscount); i != 0; i--)
-     {
-       unsigned char *pstart = p;
-       
--      if (!(p = skip_name(p, header, plen, 10)))
-+      if (!extract_name(header, plen, &p, daemon->workspacename, 1, 10))
- 	return 0;
--      
-+	  
-       GETSHORT(type, p); 
-       GETSHORT(class, p);
-       p += 4; /* TTL */
-@@ -1548,7 +1575,69 @@ static int prove_non_existence(struct dns_header *header, size_t plen, char *key
- 	  if (!expand_workspace(&nsecset, &nsecset_sz, nsecs_found))
- 	    return 0; 
- 	  
--	  nsecset[nsecs_found++] = pstart;
-+	  if (type == T_NSEC)
-+	    {
-+	      /* If we're looking for NSECs, find the corresponding SIGs, to 
-+		 extract the labels value, which we need in case the NSECs
-+		 are the result of wildcard expansion.
-+		 Note that the NSEC may not have been validated yet
-+		 so if there are multiple SIGs, make sure the label value
-+		 is the same in all, to avoid be duped by a rogue one.
-+		 If there are no SIGs, that's an error */
-+	      unsigned char *p1 = auth_start;
-+	      int res, j, rdlen1, type1, class1;
-+	      
-+	      if (!expand_workspace(&rrsig_labels, &rrsig_labels_sz, nsecs_found))
-+		return 0;
-+	      
-+	      rrsig_labels[nsecs_found] = NULL;
-+	      
-+	      for (j = ntohs(header->nscount); j != 0; j--)
-+		{
-+		  if (!(res = extract_name(header, plen, &p1, daemon->workspacename, 0, 10)))
-+		    return 0;
-+
-+		   GETSHORT(type1, p1); 
-+		   GETSHORT(class1, p1);
-+		   p1 += 4; /* TTL */
-+		   GETSHORT(rdlen1, p1);
-+
-+		   if (!CHECK_LEN(header, p1, plen, rdlen1))
-+		     return 0;
-+		   
-+		   if (res == 1 && class1 == qclass && type1 == T_RRSIG)
-+		     {
-+		       int type_covered;
-+		       unsigned char *psav = p1;
-+		       
-+		       if (rdlen < 18)
-+			 return 0; /* bad packet */
-+
-+		       GETSHORT(type_covered, p1);
-+
-+		       if (type_covered == T_NSEC)
-+			 {
-+			   p1++; /* algo */
-+			   
-+			   /* labels field must be the same in every SIG we find. */
-+			   if (!rrsig_labels[nsecs_found])
-+			     rrsig_labels[nsecs_found] = p1;
-+			   else if (*rrsig_labels[nsecs_found] != *p1) /* algo */
-+			     return 0;
-+			   }
-+		       p1 = psav;
-+		     }
-+		   
-+		   if (!ADD_RDLEN(header, p1, plen, rdlen1))
-+		     return 0;
-+		}
-+
-+	      /* Must have found@least one sig. */
-+	      if (!rrsig_labels[nsecs_found])
-+		return 0;
-+	    }
-+
-+	  nsecset[nsecs_found++] = pstart;   
- 	}
-       
-       if (!ADD_RDLEN(header, p, plen, rdlen))
-@@ -1556,7 +1645,7 @@ static int prove_non_existence(struct dns_header *header, size_t plen, char *key
-     }
-   
-   if (type_found == T_NSEC)
--    return prove_non_existence_nsec(header, plen, nsecset, nsecs_found, daemon->workspacename, keyname, name, qtype, nons);
-+    return prove_non_existence_nsec(header, plen, nsecset, rrsig_labels, nsecs_found, daemon->workspacename, keyname, name, qtype, nons);
-   else if (type_found == T_NSEC3)
-     return prove_non_existence_nsec3(header, plen, nsecset, nsecs_found, daemon->workspacename, keyname, name, qtype, wildname, nons);
-   else
--- 
-2.15.1
-
diff --git a/package/dnsmasq/0002-Fix-DNSSEC-validation-errors-introduced-in-4fe6744a2.patch b/package/dnsmasq/0002-Fix-DNSSEC-validation-errors-introduced-in-4fe6744a2.patch
deleted file mode 100644
index ef28b90c58..0000000000
--- a/package/dnsmasq/0002-Fix-DNSSEC-validation-errors-introduced-in-4fe6744a2.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cd7df612b14ec1bf831a966ccaf076be0dae7404 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Sat, 20 Jan 2018 00:10:55 +0000
-Subject: [PATCH] Fix DNSSEC validation errors introduced in
- 4fe6744a220eddd3f1749b40cac3dfc510787de6
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: upstream commit cd7df612b14ec
-
- src/dnssec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dnssec.c b/src/dnssec.c
-index a54a0b4f14cf..c47e33569f96 100644
---- a/src/dnssec.c
-+++ b/src/dnssec.c
-@@ -1610,7 +1610,7 @@ static int prove_non_existence(struct dns_header *header, size_t plen, char *key
- 		       int type_covered;
- 		       unsigned char *psav = p1;
- 		       
--		       if (rdlen < 18)
-+		       if (rdlen1 < 18)
- 			 return 0; /* bad packet */
- 
- 		       GETSHORT(type_covered, p1);
--- 
-2.15.1
-
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 28e2e658e2..322f8df5cc 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.78.tar.xz.asc
-sha256	89949f438c74b0c7543f06689c319484bd126cc4b1f8c745c742ab397681252b	dnsmasq-2.78.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.79.tar.xz.asc
+sha256	78ad74f5ca14fd85a8bac93f764cd9d60b27579e90eabd3687ca7b030e67861f	dnsmasq-2.79.tar.xz
 # Locally calculated
 sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9f96030eb6..f519835828 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.78
+DNSMASQ_VERSION = 2.79
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
