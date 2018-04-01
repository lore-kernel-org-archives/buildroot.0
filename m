From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Apr 2018 13:29:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: fix dynamic build for
 mod_lua
Message-ID: <20180401112900.922-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/liblua.so: undefined reference to `dlopen'
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/liblua.so: undefined reference to `dlclose'
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/liblua.so: undefined reference to `dlerror'
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'

detected by autobuilder:
http://autobuild.buildroot.net/results/cc1/cc13f4cef9cf6f18615d58f1d83b233812f19fa0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3b39be4a40..6632d0b6ce 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -61,6 +61,10 @@ APACHE_CONF_OPTS += \
 	--enable-lua \
 	--with-lua=$(STAGING_DIR)/usr
 APACHE_DEPENDENCIES += lua
+# liblua uses dlopen when dynamically linked
+ifneq ($(BR2_STATIC_LIBS),y)
+APACHE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -ldl"
+endif
 else
 APACHE_CONF_OPTS += --disable-lua
 endif
-- 
2.14.2
