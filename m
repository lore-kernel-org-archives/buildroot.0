From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:09:21 +0100
Subject: [Buildroot] [git commit] ti-utils: simplify static linking case by
	using pkg-config
Message-ID: <20150315170932.F0A5B7FA73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1826371d1fa3e49e8fa659b3037b05911f749749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of hardcoding the dependencies of libnl, use pkg-config to
discover them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-utils/ti-utils.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 7ee7afa..3141219 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -6,14 +6,17 @@
 
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
-TI_UTILS_DEPENDENCIES = libnl
+TI_UTILS_DEPENDENCIES = libnl host-pkgconf
 TI_UTILS_LICENSE = BSD-3c
 TI_UTILS_LICENSE_FILES = COPYING
 
+TI_UTILS_CFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0)
+TI_UTILS_LIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0)
+
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
-		LIBS="-lnl-3 -lnl-genl-3 -lpthread -lm" -C $(@D) all
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(TI_UTILS_CFLAGS)" \
+		LIBS="$(TI_UTILS_LIBS)" -C $(@D) all
 endef
 
 define TI_UTILS_INSTALL_TARGET_CMDS
