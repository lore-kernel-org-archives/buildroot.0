From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 16:18:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/omniorb: add optional support for
	zlib
Message-ID: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When zlib was compiled before, omniorb will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libomniZIOP4.so.2.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libomniORB4.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libomnithread.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
[...]

The build system offers no option to en-/disable libuuid support,
check acinclude.m4, line 435+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/omniorb/omniorb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index aaf3bf3..1bbde3b 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -30,6 +30,10 @@ HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 OMNIORB_CONF_OPTS += --disable-longdouble
 HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OMNIORB_DEPENDENCIES += zlib
+endif
+
 # The EmbeddedSystem define (set below in OMNIORB_ADJUST_TOOLDIR)
 # enables building of just the lib and disables building of
 # tools/apps/services.  In some cases the apps/services are still
-- 
2.7.0
