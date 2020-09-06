From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 09:55:31 +0200
Subject: [Buildroot] [git commit] package/apparmor: fix per-package build
 with apache
Message-ID: <20200906075831.1F335825FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c836e54203b16015c9c52cbe007adc92d293a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Per-package build of apparmor with apache fails on:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/apxs  -c mod_apparmor.c -L/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lapparmor

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=compile /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/bin/x86_64-linux-gcc -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2    -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1   -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../../../x86_64-buildroot-lin
 ux-musl/sysroot/usr/include  -c -o mod_apparmor.lo mod_apparmor.c && touch mod_apparmor.slo
mod_apparmor.c:28:10: fatal error: sys/apparmor.h: No such file or directory
 #include <sys/apparmor.h>
          ^~~~~~~~~~~~~~~~

The issue is that sys/appamor.h is not installed in the apache
per-package directory which is mangled by
APACHE_FIX_STAGING_APACHE_CONFIG, i.e.
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include

So implement the same workaround made on apache to replace those wrong
apache paths by apparmor paths in apxs binary and its configuration file
(i.e. config_vars.mk) as suggested by Thomas Petazzoni and Yann E. Morin
during review of the first iteration of this patch

Fixes:
 - http://autobuild.buildroot.org/results/ef1fcd57e0c09a2806bf2272bb21df6d3300b45b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/apparmor.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index f667966082..51820999eb 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -53,6 +53,15 @@ ifeq ($(BR2_PACKAGE_APACHE),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
 APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define APPARMOR_FIXUP_APXS
+	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
+		$(STAGING_DIR)/usr/bin/apxs \
+		$(STAGING_DIR)/usr/build/config_vars.mk
+endef
+APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
+endif
 endif
 
 define APPARMOR_BUILD_CMDS
