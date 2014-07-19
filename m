From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 16:29:57 +0200
Subject: [Buildroot] [git commit] collectd: disallow for static-only builds
Message-ID: <20140719143139.542809D22E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9960b957a63e8fdd197d9cef6ea55b1b05c40ec3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

collectd doesn't really support static-only builds: each plugin
defines a module_register() function, and plugins are supposed to be
dynamically loaded.

Also, passing -lm in LIBS makes more sense than LDFLAGS, as it is
passed at the end of the build command line.

Fixes:

  http://autobuild.buildroot.org/results/047/047dc20aba46885679b6d21cdd2d77fc252374b6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in   |    5 +++--
 package/collectd/collectd.mk |   10 +---------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a2e7877..fbb4282 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_COLLECTD
 	depends on BR2_USE_MMU
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  collectd is a daemon which collects system performance
 	  statistics periodically and provides mechanisms to store
@@ -442,6 +443,6 @@ endmenu
 
 endif
 
-comment "collectd needs a toolchain w/ IPv6, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+comment "collectd needs a toolchain w/ IPv6, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 84e17cd..9040406 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -21,15 +21,7 @@ COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
 		tokyotyrant uuid varnish vserver write_mongodb write_redis \
 		xmms zfs_arc
 
-COLLECTD_LDFLAGS = $(TARGET_LDFLAGS) -lm
-
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-# collectd-tg indirectly needs pthread but doesn't link with -pthread,
-# causing static linker errors
-COLLECTD_LDFLAGS += -lpthread
-endif
-
-COLLECTD_CONF_ENV += LDFLAGS="$(COLLECTD_LDFLAGS)"
+COLLECTD_CONF_ENV += LIBS="-lm"
 
 COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	--localstatedir=/var --with-perl-bindings=no \
