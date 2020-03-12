From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 13:10:01 -0700
Subject: [Buildroot] [PATCH v2 1/3] package/libtextstyle: new package
Message-ID: <20200312201004.3848419-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This library provides an easy way to add styling to programs that produce
output to a console or terminal emulator window.

libtextstyle is for you if your application produces text that is more readable
when it is accompanied with styling information, such as color, font attributes
(weight, posture), or underlining.

Newer versions of gettext-gnu require this package.

Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7

            br-arm-full [1/6]: OK
 br-arm-cortex-a9-glibc [2/6]: OK
  br-arm-cortex-m4-full [3/6]: OK
         br-x86-64-musl [4/6]: OK
     br-arm-full-static [5/6]: OK
           sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/libtextstyle/Config.in         | 14 +++++++++++++
 package/libtextstyle/libtextstyle.hash |  6 ++++++
 package/libtextstyle/libtextstyle.mk   | 28 ++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/libtextstyle/Config.in
 create mode 100644 package/libtextstyle/libtextstyle.hash
 create mode 100644 package/libtextstyle/libtextstyle.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 10768a19ee..4c846da222 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -47,6 +47,7 @@ F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
+F:	package/libtextstyle/
 F:	package/libwebsockets/
 F:	package/mender-grubenv/
 F:	package/nginx-naxsi/
diff --git a/package/Config.in b/package/Config.in
index 146fc1bbc3..236373f303 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1889,6 +1889,7 @@ menu "Text and terminal handling"
 	source "package/libiconv/Config.in"
 	source "package/libunistring/Config.in"
 	source "package/linenoise/Config.in"
+	source "package/libtextstyle/Config.in"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
 	source "package/oniguruma/Config.in"
diff --git a/package/libtextstyle/Config.in b/package/libtextstyle/Config.in
new file mode 100644
index 0000000000..6858be5bf6
--- /dev/null
+++ b/package/libtextstyle/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBTEXTSTYLE
+	bool "libtextstyle"
+	depends on BR2_USE_WCHAR
+	help
+	  This library provides an easy way to add styling to
+	  programs that produce output to a console or terminal
+	  emulator window.
+
+	  libtextstyle is for you if your application produces text
+	  that is more readable when it is accompanied with styling
+	  information, such as color, font attributes
+	  (weight, posture), or underlining.
+
+	  http://www.gnu.org/software/gettext/
diff --git a/package/libtextstyle/libtextstyle.hash b/package/libtextstyle/libtextstyle.hash
new file mode 100644
index 0000000000..5c5aee85bf
--- /dev/null
+++ b/package/libtextstyle/libtextstyle.hash
@@ -0,0 +1,6 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
+sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+
+# Locally calculated
+sha256  53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/libtextstyle/libtextstyle.mk b/package/libtextstyle/libtextstyle.mk
new file mode 100644
index 0000000000..e5b5706085
--- /dev/null
+++ b/package/libtextstyle/libtextstyle.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libtextstyle
+#
+################################################################################
+
+LIBTEXTSTYLE_VERSION = 0.20.1
+LIBTEXTSTYLE_SITE = $(BR2_GNU_MIRROR)/gettext
+LIBTEXTSTYLE_SOURCE = gettext-$(LIBTEXTSTYLE_VERSION).tar.xz
+LIBTEXTSTYLE_INSTALL_STAGING = YES
+LIBTEXTSTYLE_LICENSE = GPL-3.0+
+LIBTEXTSTYLE_LICENSE_FILES = COPYING
+LIBTEXTSTYLE_SUBDIR = libtextstyle
+HOST_LIBTEXTSTYLE_SUBDIR = libtextstyle
+
+# gettext-tools require libtextstyle.m4
+define LIBTEXTSTYLE_INSTALL_M4
+	$(INSTALL) -D -m 0755 $(@D)/libtextstyle/m4/libtextstyle.m4 $(ACLOCAL_DIR)/libtextstyle.m4
+endef
+LIBTEXTSTYLE_POST_INSTALL_STAGING_HOOKS += LIBTEXTSTYLE_INSTALL_M4
+
+define HOST_LIBTEXTSTYLE_INSTALL_M4
+	$(INSTALL) -D -m 0755 $(@D)/libtextstyle/m4/libtextstyle.m4 $(ACLOCAL_HOST_DIR)/libtextstyle.m4
+endef
+HOST_LIBTEXTSTYLE_POST_INSTALL_HOOKS += HOST_LIBTEXTSTYLE_INSTALL_M4
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.24.1
