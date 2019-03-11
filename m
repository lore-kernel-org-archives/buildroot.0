From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Mar 2019 19:42:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/cracklib: bump to version 2.9.7
Message-ID: <20190311184235.25436-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Remove first two patches (already in version)
 - Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 106 ---------------------
 ...o-treat-the-input-as-text-when-formattin.patch} |   0
 ...x-a-buffer-overflow-processing-long-words.patch |  40 --------
 package/cracklib/cracklib.hash                     |   5 +-
 package/cracklib/cracklib.mk                       |   4 +-
 5 files changed, 5 insertions(+), 150 deletions(-)
 delete mode 100644 package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
 rename package/cracklib/{0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch => 0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch} (100%)
 delete mode 100644 package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch

diff --git a/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch b/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
deleted file mode 100644
index 6180c4ba55..0000000000
--- a/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 47e5dec521ab6243c9b249dd65b93d232d90d6b1 Mon Sep 17 00:00:00 2001
-From: Jan Dittberner <jan@dittberner.info>
-Date: Thu, 25 Aug 2016 17:13:49 +0200
-Subject: [PATCH] Apply patch to fix CVE-2016-6318
-
-This patch fixes an issue with a stack-based buffer overflow whne
-parsing large GECOS field. See
-https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6318 and
-https://security-tracker.debian.org/tracker/CVE-2016-6318 for more
-information.
-
-Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
----
-
-Status: upstream, not yet released.
-
- lib/fascist.c | 57 ++++++++++++++++++++++++++++++++-----------------------
- 2 files changed, 34 insertions(+), 24 deletions(-)
-
-diff --git a/lib/fascist.c b/lib/fascist.c
-index a996509..d4deb15 100644
---- a/lib/fascist.c
-+++ b/lib/fascist.c
-@@ -502,7 +502,7 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
-     char gbuffer[STRINGSIZE];
-     char tbuffer[STRINGSIZE];
-     char *uwords[STRINGSIZE];
--    char longbuffer[STRINGSIZE * 2];
-+    char longbuffer[STRINGSIZE];
- 
-     if (gecos == NULL)
- 	gecos = "";
-@@ -583,38 +583,47 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
-     {
- 	for (i = 0; i < j; i++)
- 	{
--	    strcpy(longbuffer, uwords[i]);
--	    strcat(longbuffer, uwords[j]);
--
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[i]) + strlen(uwords[j]) < STRINGSIZE)
- 	    {
--		return _("it is derived from your password entry");
--	    }
-+		strcpy(longbuffer, uwords[i]);
-+		strcat(longbuffer, uwords[j]);
- 
--	    strcpy(longbuffer, uwords[j]);
--	    strcat(longbuffer, uwords[i]);
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it is derived from your password entry");
-+		}
- 
--	    if (GTry(longbuffer, password))
--	    {
--		return _("it's derived from your password entry");
--	    }
-+		strcpy(longbuffer, uwords[j]);
-+		strcat(longbuffer, uwords[i]);
- 
--	    longbuffer[0] = uwords[i][0];
--	    longbuffer[1] = '\0';
--	    strcat(longbuffer, uwords[j]);
-+		if (GTry(longbuffer, password))
-+		{
-+		   return _("it's derived from your password entry");
-+		}
-+	    }
- 
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[j]) < STRINGSIZE - 1)
- 	    {
--		return _("it is derivable from your password entry");
-+		longbuffer[0] = uwords[i][0];
-+		longbuffer[1] = '\0';
-+		strcat(longbuffer, uwords[j]);
-+
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it is derivable from your password entry");
-+		}
- 	    }
- 
--	    longbuffer[0] = uwords[j][0];
--	    longbuffer[1] = '\0';
--	    strcat(longbuffer, uwords[i]);
--
--	    if (GTry(longbuffer, password))
-+	    if (strlen(uwords[i]) < STRINGSIZE - 1)
- 	    {
--		return _("it's derivable from your password entry");
-+		longbuffer[0] = uwords[j][0];
-+		longbuffer[1] = '\0';
-+		strcat(longbuffer, uwords[i]);
-+
-+		if (GTry(longbuffer, password))
-+		{
-+		    return _("it's derivable from your password entry");
-+		}
- 	    }
- 	}
-     }
--- 
-2.9.3
-
diff --git a/package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch b/package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch
similarity index 100%
rename from package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch
rename to package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch
diff --git a/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch b/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
deleted file mode 100644
index 63525cc73d..0000000000
--- a/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 33d7fa4585247cd2247a1ffa032ad245836c6edb Mon Sep 17 00:00:00 2001
-From: Jan Dittberner <jan@dittberner.info>
-Date: Thu, 25 Aug 2016 17:17:53 +0200
-Subject: [PATCH] Fix a buffer overflow processing long words
-
-A buffer overflow processing long words has been discovered. This commit
-applies the patch from
-https://build.opensuse.org/package/view_file/Base:System/cracklib/0004-overflow-processing-long-words.patch
-by Howard Guo.
-
-See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835386 and
-http://www.openwall.com/lists/oss-security/2016/08/23/8
-
-Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
----
-
-Status: upstream, not yet released.
-
- lib/rules.c | 5 ++---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/rules.c b/lib/rules.c
-index d193cc0..3a2aa46 100644
---- a/lib/rules.c
-+++ b/lib/rules.c
-@@ -434,9 +434,8 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
- {
-     int limit;
-     register char *ptr;
--    static char area[STRINGSIZE];
--    char area2[STRINGSIZE];
--    area[0] = '\0';
-+    static char area[STRINGSIZE * 2] = {0};
-+    char area2[STRINGSIZE * 2] = {0};
-     strcpy(area, input);
- 
-     for (ptr = control; *ptr; ptr++)
--- 
-2.9.3
-
diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index 3038a47a36..9bc8e3d28a 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343	cracklib-2.9.6.tar.gz
-sha256	27973245225eeb9d0090e97f3dea4197dec99b64d9d3a791a60298f3b021824c	cracklib-words-2.9.6.gz
+sha256	8b6fd202f3f1d8fa395d3b7a5d821227cfd8bb4a9a584a7ae30cf62cea6287dd	cracklib-2.9.7.tar.gz
+sha256	7f0c45faf84a2494f15d1e2720394aca4a379163a70c4acad948186c0047d389	cracklib-words-2.9.7.gz
+sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index aeee60d1e7..b9e3dc0d75 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.6
-CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
+CRACKLIB_VERSION = 2.9.7
+CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
 CRACKLIB_INSTALL_STAGING = YES
-- 
2.14.1
