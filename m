From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 16:33:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mutt: add
 security fixes from Ubuntu for CVE-2021-3181
Message-ID: <20210130151919.9BDCF81620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d85b9b06def8b3dc15088ca453415bac9250dc1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2021-3181: rfc822.c in Mutt through 2.0.4 allows remote attackers to
  cause a denial of service (mailbox unavailability) by sending email
  messages with sequences of semicolon characters in RFC822 address fields
  (aka terminators of empty groups).  A small email message from the
  attacker can cause large memory consumption, and the victim may then be
  unable to see email messages from other persons.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c1413cd94c9bc953613b8d2578202240c234f34c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/0005-CVE-2021-3181-1.patch | 40 +++++++++++++++++++++++++
 package/mutt/0006-CVE-2021-3181-2.patch | 53 +++++++++++++++++++++++++++++++++
 package/mutt/0007-CVE-2021-3181-3.patch | 30 +++++++++++++++++++
 package/mutt/mutt.mk                    |  5 ++++
 4 files changed, 128 insertions(+)

diff --git a/package/mutt/0005-CVE-2021-3181-1.patch b/package/mutt/0005-CVE-2021-3181-1.patch
new file mode 100644
index 0000000000..cbb12cf2f2
--- /dev/null
+++ b/package/mutt/0005-CVE-2021-3181-1.patch
@@ -0,0 +1,40 @@
+From 4a2becbdb4422aaffe3ce314991b9d670b7adf17 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Sun, 17 Jan 2021 10:40:37 -0800
+Subject: [PATCH] Fix memory leak parsing group addresses without a display
+ name.
+
+When there was a group address terminator with no previous
+addresses (including the group display-name), an address would be
+allocated but not attached to the address list.
+
+Change this to only allocate when last exists.
+
+It would be more correct to not allocate at all unless we are inside a
+group list, but I will address that in a separate commit to master.
+
+[Retrieved from:
+https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-1.patch?h=import/1.14.6-1ubuntu0.2]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ rfc822.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+Index: mutt-1.14.6/rfc822.c
+===================================================================
+--- mutt-1.14.6.orig/rfc822.c
++++ mutt-1.14.6/rfc822.c
+@@ -491,11 +491,10 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
+ #endif
+ 
+       /* add group terminator */
+-      cur = rfc822_new_address ();
+       if (last)
+       {
+-	last->next = cur;
+-	last = cur;
++	last->next = rfc822_new_address ();
++	last = last->next;
+       }
+ 
+       phraselen = 0;
diff --git a/package/mutt/0006-CVE-2021-3181-2.patch b/package/mutt/0006-CVE-2021-3181-2.patch
new file mode 100644
index 0000000000..c3184a40ed
--- /dev/null
+++ b/package/mutt/0006-CVE-2021-3181-2.patch
@@ -0,0 +1,53 @@
+From 939b02b33ae29bc0d642570c1dcfd4b339037d19 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Sun, 17 Jan 2021 10:53:19 -0800
+Subject: [PATCH] Don't allocate a group terminator unless we are in a
+ group-list.
+
+This will reduce memory allocation for garbage/spam address lists.
+
+It also makes no sense to store a terminator when there wasn't a
+display-name indicating the start of a group.
+
+[Retrieved from:
+https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-2.patch?h=import/1.14.6-1ubuntu0.2]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ rfc822.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Index: mutt-1.14.6/rfc822.c
+===================================================================
+--- mutt-1.14.6.orig/rfc822.c
++++ mutt-1.14.6/rfc822.c
+@@ -378,7 +378,7 @@ add_addrspec (ADDRESS **top, ADDRESS **l
+ 
+ ADDRESS *rfc822_parse_adrlist (ADDRESS *top, const char *s)
+ {
+-  int ws_pending, nl;
++  int ws_pending, nl, in_group = 0;
+ #ifdef EXACT_ADDRESS
+   const char *begin;
+ #endif
+@@ -455,6 +455,7 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
+       terminate_buffer (phrase, phraselen);
+       cur->mailbox = safe_strdup (phrase);
+       cur->group = 1;
++      in_group = 1;
+ 
+       if (last)
+ 	last->next = cur;
+@@ -491,11 +492,12 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
+ #endif
+ 
+       /* add group terminator */
+-      if (last)
++      if (last && in_group)
+       {
+ 	last->next = rfc822_new_address ();
+ 	last = last->next;
+       }
++      in_group = 0;
+ 
+       phraselen = 0;
+       commentlen = 0;
diff --git a/package/mutt/0007-CVE-2021-3181-3.patch b/package/mutt/0007-CVE-2021-3181-3.patch
new file mode 100644
index 0000000000..42d0cbaef5
--- /dev/null
+++ b/package/mutt/0007-CVE-2021-3181-3.patch
@@ -0,0 +1,30 @@
+From d4305208955c5cdd9fe96dfa61e7c1e14e176a14 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Sun, 17 Jan 2021 11:05:36 -0800
+Subject: [PATCH] Add group terminator if it is left off.
+
+If there is no terminating ";" add one to the list, to make the text
+re-rendering correct.
+
+[Retrieved from:
+https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-3.patch?h=import/1.14.6-1ubuntu0.2]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ rfc822.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: mutt-1.14.6/rfc822.c
+===================================================================
+--- mutt-1.14.6.orig/rfc822.c
++++ mutt-1.14.6/rfc822.c
+@@ -560,6 +560,10 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
+     last->val = mutt_substrdup (begin, s - nl < begin ? begin : s - nl);
+ #endif
+ 
++  /* add group terminator, if it was left off */
++  if (last && in_group)
++    last->next = rfc822_new_address ();
++
+   return top;
+ }
+ 
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index e11cb471eb..5ac2ce258c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -19,6 +19,11 @@ MUTT_IGNORE_CVES += CVE-2020-14093
 # 0004-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
 MUTT_IGNORE_CVES += CVE-2020-28896
 
+# 0002-CVE-2021-3181-1.patch
+# 0003-CVE-2021-3181-2.patch
+# 0004-CVE-2021-3181-3.patch
+MUTT_IGNORE_CVES += CVE-2021-3181
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
