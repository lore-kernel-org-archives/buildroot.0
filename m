From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Dec 2017 20:12:04 +0100
Subject: [Buildroot] [PATCH v2,1/1] safeclib: new package
Message-ID: <20171219191204.17680-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

safec fork with all C11 Annex K functions

This library implements the secure C11 Annex K functions on
top of most libc implementations, which are missing from them.

https://rurban.github.io/safeclib/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix build when wchar is disabled (patch already merged upstream)

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-Fix-install-when-HAVE_WCHAR-is-unset.patch | 50 ++++++++++++++++++++++
 package/safeclib/Config.in                         |  9 ++++
 package/safeclib/safeclib.hash                     |  3 ++
 package/safeclib/safeclib.mk                       | 15 +++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch
 create mode 100644 package/safeclib/Config.in
 create mode 100644 package/safeclib/safeclib.hash
 create mode 100644 package/safeclib/safeclib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 082d7e1740..a64a14e546 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -633,6 +633,7 @@ F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
 F:	package/rygel/
+F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
 
diff --git a/package/Config.in b/package/Config.in
index 6847f8965c..24cd00254f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1544,6 +1544,7 @@ menu "Security"
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
-- 
2.14.1
