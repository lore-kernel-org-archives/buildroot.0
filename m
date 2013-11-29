From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 19:41:58 +0100
Subject: [Buildroot] [git commit] hostapd: fix static build failure
Message-ID: <20131129184634.BA0FE9BE68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f62a1d887aee642593b3f9507d6f3ebcd82219d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl-3 uses threads and this isn't accounted for in hostapd (or
libnl-3*.pc files for that matter - hostapd doesn't use pkg-config
anyway).
Since linking order matters for static scenarios also throw in -lnl-3
into LIBS first since it gets appended to in hostapd makefiles to add
libnl-3.

Fixes:
http://autobuild.buildroot.net/results/d4a/d4a9f44effeb08eda6c4b32764274ae81d185d5e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4d31df5..0fbd8bc 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -10,13 +10,14 @@ HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
 HOSTAPD_LICENSE = GPLv2/BSD-3c
 HOSTAPD_LICENSE_FILES = README
 
-# libnl needs -lm (for rint) if linking statically
+# libnl-3 needs -lm (for rint) and -lpthread if linking statically
+# And library order matters hence stick -lnl-3 first since it's appended
+# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-HOSTAPD_LDFLAGS += -lm
+HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
 define HOSTAPD_LIBNL_CONFIG
@@ -93,7 +94,7 @@ endef
 
 define HOSTAPD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) CFLAGS="$(HOSTAPD_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(HOSTAPD_LIBS)" \
 		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(HOSTAPD_SUBDIR)
 endef
 
