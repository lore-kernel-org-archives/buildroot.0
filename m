From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 21:29:54 +0100
Subject: [Buildroot] [git commit] safeclib: new package
Message-ID: <20180203215454.D94FF88307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a67cb08d19e6c123737f7401e87103ecca046ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

safec fork with all C11 Annex K functions

This library implements the secure C11 Annex K functions on
top of most libc implementations, which are missing from them.

https://rurban.github.io/safeclib/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-Fix-install-when-HAVE_WCHAR-is-unset.patch | 50 ++++++++++++++++++++++
 package/safeclib/Config.in                         |  9 ++++
 package/safeclib/safeclib.hash                     |  3 ++
 package/safeclib/safeclib.mk                       | 15 +++++++
 6 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9048d45b16..93b631269e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -637,6 +637,7 @@ F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
 F:	package/rygel/
+F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
 
diff --git a/package/Config.in b/package/Config.in
index 9a6b199f40..84b5ba4ce7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1555,6 +1555,7 @@ menu "Security"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
+	source "package/safeclib/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch b/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch
new file mode 100644
index 0000000000..c34002d24e
--- /dev/null
+++ b/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch
@@ -0,0 +1,50 @@
+From 5991f0d4b86c02a3d7739509b96815ccfa734be7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 18 Dec 2017 17:17:54 +0100
+Subject: [PATCH] Fix install when HAVE_WCHAR is unset
+
+Don't build WCSNORM_xxx man pages if HAVE_WHCAR is not set otherwise
+installation will fail as the wcsnorm_mode enum is not defined in
+safe_str_lib.h when SAFECLIB_DISABLE_WCHAR is set
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ Makefile.am | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 31398d1..b7e65a5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -142,12 +142,6 @@ dist_man_MANS += \
+ 	doc/man/man3/SAFE_STR_PASSWORD_MIN_LENGTH.3	\
+ 	doc/man/man3/STRTOK_DELIM_MAX_LEN.3	\
+ 	doc/man/man3/TMP_MAX_S.3	\
+-	doc/man/man3/WCSNORM_FCC.3	\
+-	doc/man/man3/WCSNORM_FCD.3	\
+-	doc/man/man3/WCSNORM_NFC.3	\
+-	doc/man/man3/WCSNORM_NFD.3	\
+-	doc/man/man3/WCSNORM_NFKC.3	\
+-	doc/man/man3/WCSNORM_NFKD.3	\
+ 	doc/man/man3/abort_handler_s.3	\
+ 	doc/man/man3/abort_handler_s.c.3	\
+ 	doc/man/man3/asctime_s.3	\
+@@ -461,6 +455,15 @@ dist_man_MANS += \
+ 	doc/man/man3/wprintf_s.c.3	\
+ 	doc/man/man3/wscanf_s.3	\
+ 	doc/man/man3/wscanf_s.c.3
++if ENABLE_WCHAR
++dist_man_MANS += \
++	doc/man/man3/WCSNORM_FCC.3      \
++	doc/man/man3/WCSNORM_FCD.3      \
++	doc/man/man3/WCSNORM_NFC.3      \
++	doc/man/man3/WCSNORM_NFD.3      \
++	doc/man/man3/WCSNORM_NFKC.3     \
++	doc/man/man3/WCSNORM_NFKD.3
++endif
+ CLEANFILES += Doxyfile doc/footer README.md
+ 
+ # avoid parallel doxygen
+-- 
+2.7.4
+
diff --git a/package/safeclib/Config.in b/package/safeclib/Config.in
new file mode 100644
index 0000000000..5117c49da7
--- /dev/null
+++ b/package/safeclib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SAFECLIB
+	bool "safeclib"
+	help
+	  safec fork with all C11 Annex K functions
+
+	  This library implements the secure C11 Annex K functions on
+	  top of most libc implementations, which are missing from them.
+
+	  https://rurban.github.io/safeclib/
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
new file mode 100644
index 0000000000..95a862eef0
--- /dev/null
+++ b/package/safeclib/safeclib.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	9c09c6e9fc95207c7d45944f8b669f2454056bef2bbaef70c94ba3f81be1cbb2	safeclib-v09102017.tar.gz
+sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
new file mode 100644
index 0000000000..65c6621e0a
--- /dev/null
+++ b/package/safeclib/safeclib.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# safeclib
+#
+################################################################################
+
+SAFECLIB_VERSION = v09102017
+SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
+SAFECLIB_LICENSE = MIT 
+SAFECLIB_LICENSE_FILES = COPYING
+SAFECLIB_INSTALL_STAGING = YES
+# From git
+SAFECLIB_AUTORECONF = YES
+
+$(eval $(autotools-package))
