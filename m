From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 15 Jan 2016 11:24:57 +0100
Subject: [Buildroot] [PATCH] util-linux: enable Python bindings for libmount
Message-ID: <1452853497-29131-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/util-linux/util-linux.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 58ace1d..a80e287 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -23,8 +23,7 @@ UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
 	$(if $(BR2_TOOLCHAIN_USES_UCLIBC),ac_cv_header_sys_timex_h=no)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown \
-	--without-python
+	--disable-makeinstall-chown
 
 # system depends on util-linux so we enable systemd support
 # (which needs systemd to be installed)
@@ -136,6 +135,19 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
 UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
 
+# Install libmount Python bindings
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+UTIL_LINUX_CONF_OPTS += \
+	--enable-pylibmount \
+	--with-python
+else
+UTIL_LINUX_CONF_OPTS += \
+	--disable-pylibmount \
+	--without-python
+endif
+endif
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
-- 
2.1.4
