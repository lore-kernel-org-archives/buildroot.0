From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  1 Mar 2015 22:06:53 +0100
Subject: [Buildroot] [PATCH v3 2/2] logrotate: use pkg-config for the opt
	library
In-Reply-To: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425244013-2509-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without using the pkg-config the dependencies are not included for a
static linking so it fails to build.
These failures are fixed by linking the libintl library that is a
dependency of the opt library.

This commit to be useful requires the previous commit 'popt: add to the
"popt.pc" file the libintl library'.

Fixes:
http://autobuild.buildroot.net/results/159bf5730414ca7f73dcdae95090177355193636
http://autobuild.buildroot.net/results/ebe6ab7fc0f2cff98de06b3dc374730da9e9e4f2

Minimal defconfig to reproduce the build failure:
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LOGROTATE=y

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/logrotate/logrotate.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index dc26d85..c1bca48 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -9,10 +9,12 @@ LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 
-LOGROTATE_DEPENDENCIES = popt
+LOGROTATE_DEPENDENCIES = popt host-pkgconf
 
 define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" \
+		LOADLIBES="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)" \
+		-C $(@D)
 endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
-- 
2.3.1
