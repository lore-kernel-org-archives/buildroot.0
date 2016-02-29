From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 29 Feb 2016 19:22:50 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
	GNU_TARGET_NAME-pkg-config
Message-ID: <1456770170-6326-1-git-send-email-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Lots of packages start to call pkg-config "properly" and run into
 failures like this:

*
* System Logging Utilities
*
syslogd (SYSLOGD) [N/y/?] n
klogd (KLOGD) [N/y/?] n
logger (LOGGER) [Y/n/?] y
make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
make[1]: Leaving directory '.../output/build/busybox-1.24.1'

 By setting a symlink to the expected target we might even solve some
 real problems.
---
 package/pkgconf/pkgconf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c8b0cba..a183a1c 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -22,6 +22,7 @@ define HOST_PKGCONF_INSTALL_WRAPPER
 	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
 		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
 		$(HOST_DIR)/usr/bin/pkg-config
+	ln -sf $(HOST_DIR)/usr/bin/pkg-config $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
-- 
2.4.10
