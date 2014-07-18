From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:32:01 +0200
Subject: [Buildroot] [git commit] libmemcached: new package
Message-ID: <20140718223552.7496F9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35c386682020880fc5306439afa508a57e57a321
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For varying reasons it doesn't play well with uClibc or musl based
toolchains so they're excluded for now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/libmemcached/Config.in       |   16 ++++++++++++++++
 package/libmemcached/libmemcached.mk |   17 +++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ef191b3..017d050 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -755,6 +755,7 @@ menu "Networking"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
 	source "package/libmbus/Config.in"
+	source "package/libmemcached/Config.in"
 	source "package/libmicrohttpd/Config.in"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
diff --git a/package/libmemcached/Config.in b/package/libmemcached/Config.in
new file mode 100644
index 0000000..e9dd2c4
--- /dev/null
+++ b/package/libmemcached/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBMEMCACHED
+	bool "libmemcached"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # posix spawn, va_list breakage
+	help
+	  libMemcached is an open source C/C++ client library and tools
+	  for the memcached server.
+	  It has been designed to be light on memory usage, thread safe,
+	  and provide full access to server side methods.
+
+	  http://libmemcached.org/libMemcached.html
+
+comment "libmemcached needs a (e)glibc toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
new file mode 100644
index 0000000..d901e70
--- /dev/null
+++ b/package/libmemcached/libmemcached.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libmemcached
+#
+################################################################################
+
+LIBMEMCACHED_MAJOR_VERSION = 1.0
+LIBMEMCACHED_VERSION = $(LIBMEMCACHED_MAJOR_VERSION).18
+LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_MAJOR_VERSION)/$(LIBMEMCACHED_VERSION)/+download
+LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBMEMCACHED_CONF_OPT = --disable-dtrace
+LIBMEMCACHED_INSTALL_STAGING = YES
+LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
+LIBMEMCACHED_LICENSE = BSD-3c
+LIBMEMCACHED_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
