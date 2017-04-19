From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 19 Apr 2017 09:56:01 +0200
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
Message-ID: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v2:
 * Add two upstream bugfixes
 * Add patch to force grep to treat the words file as text
 * Add $(HOST_MAKE_ENV) when build the dict 

Changes since v1:
 * Update DEVELOPERS file
 * Use SPDX license codes
 * Use the tools from host-cracklib for generating dictionary files

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 114 +++++++++++++++++++++
 ...x-a-buffer-overflow-processing-long-words.patch |  49 +++++++++
 ...to-treat-the-input-as-text-when-formattin.patch |  30 ++++++
 package/cracklib/Config.in                         |  28 +++++
 package/cracklib/cracklib.hash                     |   3 +
 package/cracklib/cracklib.mk                       |  36 +++++++
 8 files changed, 262 insertions(+)
 create mode 100644 package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
 create mode 100644 package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
 create mode 100644 package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch
 create mode 100644 package/cracklib/Config.in
 create mode 100644 package/cracklib/cracklib.hash
 create mode 100644 package/cracklib/cracklib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123a8f9..4139a19 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1483,6 +1483,7 @@ F:	package/proxychains-ng/
 F:	package/yasm/
 
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
+F:	package/cracklib/
 F:	package/libscrypt/
 
 N:	Stephan Hoffmann <sho@relinux.de>
diff --git a/package/Config.in b/package/Config.in
index 4eaa95b..cf0d78d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1343,6 +1343,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch b/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
new file mode 100644
index 0000000..56b60b1
--- /dev/null
+++ b/package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
@@ -0,0 +1,114 @@
+From 47e5dec521ab6243c9b249dd65b93d232d90d6b1 Mon Sep 17 00:00:00 2001
+From: Jan Dittberner <jan@dittberner.info>
+Date: Thu, 25 Aug 2016 17:13:49 +0200
+Subject: [PATCH] Apply patch to fix CVE-2016-6318
+
+This patch fixes an issue with a stack-based buffer overflow whne
+parsing large GECOS field. See
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6318 and
+https://security-tracker.debian.org/tracker/CVE-2016-6318 for more
+information.
+---
+
+Status: upstream, not yet released.
+
+ NEWS          |  1 +
+ lib/fascist.c | 57 ++++++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 34 insertions(+), 24 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 26abeee..361a207 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,4 @@
++v2.9.x apply patch to fix CVE-2016-6318 Stack-based buffer overflow when parsing large GECOS field
+ v2.9.6 updates to cracklib-words to add a bunch of other dictionary lists
+        migration to github
+        patch to add some particularly bad cases to the cracklib small dictionary (Matthew Miller)
+diff --git a/lib/fascist.c b/lib/fascist.c
+index a996509..d4deb15 100644
+--- a/lib/fascist.c
++++ b/lib/fascist.c
+@@ -502,7 +502,7 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
+     char gbuffer[STRINGSIZE];
+     char tbuffer[STRINGSIZE];
+     char *uwords[STRINGSIZE];
+-    char longbuffer[STRINGSIZE * 2];
++    char longbuffer[STRINGSIZE];
+ 
+     if (gecos == NULL)
+ 	gecos = "";
+@@ -583,38 +583,47 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
+     {
+ 	for (i = 0; i < j; i++)
+ 	{
+-	    strcpy(longbuffer, uwords[i]);
+-	    strcat(longbuffer, uwords[j]);
+-
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[i]) + strlen(uwords[j]) < STRINGSIZE)
+ 	    {
+-		return _("it is derived from your password entry");
+-	    }
++		strcpy(longbuffer, uwords[i]);
++		strcat(longbuffer, uwords[j]);
+ 
+-	    strcpy(longbuffer, uwords[j]);
+-	    strcat(longbuffer, uwords[i]);
++		if (GTry(longbuffer, password))
++		{
++		    return _("it is derived from your password entry");
++		}
+ 
+-	    if (GTry(longbuffer, password))
+-	    {
+-		return _("it's derived from your password entry");
+-	    }
++		strcpy(longbuffer, uwords[j]);
++		strcat(longbuffer, uwords[i]);
+ 
+-	    longbuffer[0] = uwords[i][0];
+-	    longbuffer[1] = '\0';
+-	    strcat(longbuffer, uwords[j]);
++		if (GTry(longbuffer, password))
++		{
++		   return _("it's derived from your password entry");
++		}
++	    }
+ 
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[j]) < STRINGSIZE - 1)
+ 	    {
+-		return _("it is derivable from your password entry");
++		longbuffer[0] = uwords[i][0];
++		longbuffer[1] = '\0';
++		strcat(longbuffer, uwords[j]);
++
++		if (GTry(longbuffer, password))
++		{
++		    return _("it is derivable from your password entry");
++		}
+ 	    }
+ 
+-	    longbuffer[0] = uwords[j][0];
+-	    longbuffer[1] = '\0';
+-	    strcat(longbuffer, uwords[i]);
+-
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[i]) < STRINGSIZE - 1)
+ 	    {
+-		return _("it's derivable from your password entry");
++		longbuffer[0] = uwords[j][0];
++		longbuffer[1] = '\0';
++		strcat(longbuffer, uwords[i]);
++
++		if (GTry(longbuffer, password))
++		{
++		    return _("it's derivable from your password entry");
++		}
+ 	    }
+ 	}
+     }
+-- 
+2.9.3
+
diff --git a/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch b/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
new file mode 100644
index 0000000..93cd4a8
--- /dev/null
+++ b/package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
@@ -0,0 +1,49 @@
+From 33d7fa4585247cd2247a1ffa032ad245836c6edb Mon Sep 17 00:00:00 2001
+From: Jan Dittberner <jan@dittberner.info>
+Date: Thu, 25 Aug 2016 17:17:53 +0200
+Subject: [PATCH] Fix a buffer overflow processing long words
+
+A buffer overflow processing long words has been discovered. This commit
+applies the patch from
+https://build.opensuse.org/package/view_file/Base:System/cracklib/0004-overflow-processing-long-words.patch
+by Howard Guo.
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835386 and
+http://www.openwall.com/lists/oss-security/2016/08/23/8
+---
+
+Status: upstream, not yet released.
+
+ NEWS        | 1 +
+ lib/rules.c | 5 ++---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 361a207..f1df3b0 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,4 +1,5 @@
+ v2.9.x apply patch to fix CVE-2016-6318 Stack-based buffer overflow when parsing large GECOS field
++       fix a buffer overflow processing long words
+ v2.9.6 updates to cracklib-words to add a bunch of other dictionary lists
+        migration to github
+        patch to add some particularly bad cases to the cracklib small dictionary (Matthew Miller)
+diff --git a/lib/rules.c b/lib/rules.c
+index d193cc0..3a2aa46 100644
+--- a/lib/rules.c
++++ b/lib/rules.c
+@@ -434,9 +434,8 @@ Mangle(input, control)		/* returns a pointer to a controlled Mangle */
+ {
+     int limit;
+     register char *ptr;
+-    static char area[STRINGSIZE];
+-    char area2[STRINGSIZE];
+-    area[0] = '\0';
++    static char area[STRINGSIZE * 2] = {0};
++    char area2[STRINGSIZE * 2] = {0};
+     strcpy(area, input);
+ 
+     for (ptr = control; *ptr; ptr++)
+-- 
+2.9.3
+
diff --git a/package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch b/package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch
new file mode 100644
index 0000000..b05a69c
--- /dev/null
+++ b/package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch
@@ -0,0 +1,30 @@
+From d27062fe7a520d5791f7a56d175a5cb6a39bae61 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Tue, 18 Apr 2017 12:00:39 +0200
+Subject: [PATCH] Force grep to treat the input as text when formatting word
+ files.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ util/cracklib-format | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/cracklib-format b/util/cracklib-format
+index 1d7be5b..b1de8e8 100644
+--- a/util/cracklib-format
++++ b/util/cracklib-format
+@@ -4,7 +4,7 @@
+ # into cracklib-packer
+ #
+ gzip -cdf "$@" |
+-    grep -v '^\(#\|$\)' |
++    grep -a -v '^\(#\|$\)' |
+     tr '[A-Z]' '[a-z]' |
+     tr -cd '\012[a-z][0-9]' |
+     env LC_ALL=C sort -u
+-- 
+2.9.3
+
diff --git a/package/cracklib/Config.in b/package/cracklib/Config.in
new file mode 100644
index 0000000..4a0f43f
--- /dev/null
+++ b/package/cracklib/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_CRACKLIB
+	bool "cracklib"
+	help
+	  CrackLib tests passwords to determine whether they match
+	  certain security-oriented characteristics, with the purpose
+	  of stopping users from choosing passwords that are easy to
+	  guess. CrackLib performs several tests on passwords: it
+	  tries to generate words from a username and gecos entry and
+	  checks those words against the password; it checks for
+	  simplistic patterns in passwords; and it checks for the
+	  password in a dictionary.
+
+	  https://github.com/cracklib/cracklib
+
+if BR2_PACKAGE_CRACKLIB
+
+config BR2_PACKAGE_CRACKLIB_TOOLS
+	bool "install tools"
+	help
+	  Install cracklib command line tools for creating dicts.
+
+config BR2_PACKAGE_CRACKLIB_FULL_DICT
+	bool "full dict"
+	help
+	  Install the full cracklib dict (requires about 8Mb extra
+	  target space).
+
+endif
diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
new file mode 100644
index 0000000..3038a47
--- /dev/null
+++ b/package/cracklib/cracklib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343	cracklib-2.9.6.tar.gz
+sha256	27973245225eeb9d0090e97f3dea4197dec99b64d9d3a791a60298f3b021824c	cracklib-words-2.9.6.gz
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
new file mode 100644
index 0000000..0a1373a
--- /dev/null
+++ b/package/cracklib/cracklib.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# cracklib
+#
+################################################################################
+
+CRACKLIB_VERSION = 2.9.6
+CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
+CRACKLIB_LICENSE = LGPL-2.1
+CRACKLIB_LICENSE_FILES = COPYING.LIB
+CRACKLIB_INSTALL_STAGING = YES
+CRACKLIB_DEPENDENCIES = host-cracklib
+
+ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
+CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
+CRACKLIB_DICT_SOURCE = $(DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
+else
+CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
+endif
+
+ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
+define CRACKLIB_REMOVE_TOOLS
+	rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
+endef
+CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_REMOVE_TOOLS
+endif
+
+define CRACKLIB_BUILD_DICT
+	$(HOST_MAKE_ENV) cracklib-format $(CRACKLIB_DICT_SOURCE) | \
+		$(HOST_MAKE_ENV) cracklib-packer $(TARGET_DIR)/usr/share/cracklib/pw_dict
+	rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
+endef
+CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_BUILD_DICT
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.3
