From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:42:30 +0100
Subject: [Buildroot] [git commit] package/util-linux: add file optional
 dependency
Message-ID: <20201031223125.D1B468151F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72402616f2a50c7f888d1cc03e5673fa3c63f4d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

file is an optional dependency of more binary and is enabled by default
since version 2.36 and
https://github.com/karelzak/util-linux/commit/09070e1a658e70ec203150e4fa5f486b32771858

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
 package/util-linux/util-linux.mk                      | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index a0ec153bfb..3a3a655e62 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -83,4 +83,7 @@ UTIL_LINUX_LIBS_CONF_OPTS += --without-readline
 # No libs use audit
 UTIL_LINUX_LIBS_CONF_OPTS += --without-audit
 
+# No libs use libmagic
+UTIL_LINUX_LIBS_CONF_OPTS += --without-libmagic
+
 $(eval $(autotools-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index fae952eb77..0b29ef4d6f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -188,6 +188,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libblkid \
 	--enable-libmount \
 	--enable-libuuid \
+	--without-libmagic \
 	--without-ncurses \
 	--without-ncursesw \
 	--without-tinfo
@@ -257,6 +258,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-audit
 endif
 
+ifeq ($(BR2_PACKAGE_FILE),y)
+UTIL_LINUX_CONF_OPTS += --with-libmagic
+UTIL_LINUX_DEPENDENCIES += file
+else
+UTIL_LINUX_CONF_OPTS += --without-libmagic
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
