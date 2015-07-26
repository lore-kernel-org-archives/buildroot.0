From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:49:48 +0200
Subject: [Buildroot] [git commit branch/next] xinetd: use pkg-config for
	libtirpc flags
Message-ID: <20150808105642.7BE1B7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9daa5e3f5570ab4d2f075ca42bfaa82d57db61a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 92d0d53..9818512 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -17,9 +17,9 @@ XINETD_CFLAGS = $(TARGET_CFLAGS)
 #     flags (so this case 2 is implicit and not visible below)
 #  3. We don't have RPC support, pass -DNO_RPC to disable it
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-XINETD_DEPENDENCIES += libtirpc
-XINETD_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-XINETD_LIBS += -ltirpc
+XINETD_DEPENDENCIES += libtirpc host-pkgconf
+XINETD_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+XINETD_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
 XINETD_CFLAGS += -DNO_RPC
 endif
