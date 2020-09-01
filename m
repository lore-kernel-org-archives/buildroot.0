From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Sep 2020 22:10:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
Message-ID: <20200901201046.2757475-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Per-package build of apparmor with apache fails on:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/apxs  -c mod_apparmor.c -L/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lapparmor

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=compile /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/bin/x86_64-linux-gcc -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2    -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1   -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../../../x86_64-buildroot-linux-musl/sysroot/usr/include  -c -o mod_apparmor.lo mod_apparmor.c && touch mod_apparmor.slo
mod_apparmor.c:28:10: fatal error: sys/apparmor.h: No such file or directory
 #include <sys/apparmor.h>
          ^~~~~~~~~~~~~~~~

The issue is that sys/appamor.h is not installed in the apache
per-package directory which is mangled by
APACHE_FIX_STAGING_APACHE_CONFIG, i.e.
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include

So help apxs to find sys/apparmor.h by passing
-I$(STAGING_DIR)/usr/include

Fixes:
 - http://autobuild.buildroot.org/results/ef1fcd57e0c09a2806bf2272bb21df6d3300b45b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apparmor/apparmor.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index f667966082..d5794b9585 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -52,7 +52,8 @@ endif
 ifeq ($(BR2_PACKAGE_APACHE),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
-APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
+APPARMOR_MAKE_OPTS += \
+	APXS="$(STAGING_DIR)/usr/bin/apxs -I$(STAGING_DIR)/usr/include"
 endif
 
 define APPARMOR_BUILD_CMDS
-- 
2.28.0
