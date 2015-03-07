From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:21 +0100
Subject: [Buildroot] [PATCH 4/5] ti-utils: simplify static linking case by
	using pkg-config
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425728422-14113-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of hardcoding the dependencies of libnl, use pkg-config to
discover them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-utils/ti-utils.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

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
-- 
2.1.0
