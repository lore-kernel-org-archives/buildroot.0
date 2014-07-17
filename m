From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 18:20:13 -0300
Subject: [Buildroot] [PATCH 1/3] memcached: new package
Message-ID: <1405632015-22462-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/memcached/Config.in    | 15 +++++++++++++++
 package/memcached/memcached.mk | 21 +++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/memcached/Config.in
 create mode 100644 package/memcached/memcached.mk

diff --git a/package/Config.in b/package/Config.in
index d2699b1..df1a8c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -979,6 +979,7 @@ endif
 	source "package/linux-zigbee/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
+	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/minidlna/Config.in"
 	source "package/modem-manager/Config.in"
diff --git a/package/memcached/Config.in b/package/memcached/Config.in
new file mode 100644
index 0000000..e011d08
--- /dev/null
+++ b/package/memcached/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MEMCACHED
+	bool "memcached"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Memcached is an in-memory key-value store for small chunks
+	  of arbitrary data (strings, objects) from results of database calls,
+	  API calls, or page rendering.
+
+	  http://www.memcached.org/
+
+comment "memcached needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
new file mode 100644
index 0000000..17edcb6
--- /dev/null
+++ b/package/memcached/memcached.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# memcached
+#
+################################################################################
+
+MEMCACHED_VERSION = 1.4.20
+MEMCACHED_SITE = http://www.memcached.org/files
+MEMCACHED_DEPENDENCIES = libevent
+MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+MEMCACHED_CONF_OPT = --disable-coverage --disable-docs
+MEMCACHED_LICENSE = BSD-3c
+MEMCACHED_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_ENDIAN),"BIG")
+MEMCACHED_CONF_ENV += ac_cv_c_endian=big
+else
+MEMCACHED_CONF_ENV += ac_cv_c_endian=little
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.5
