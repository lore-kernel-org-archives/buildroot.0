From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:18 +0100
Subject: [Buildroot] [git commit] xinetd: add support to use RPC support
	from libtirpc
Message-ID: <20121106072428.BEE0B99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2b8a97603687add5dd7a39b0dac75400769af50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xinetd/xinetd.mk |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a420425..cb48145 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -9,10 +9,25 @@ XINETD_SITE          = http://www.xinetd.org
 XINETD_LICENSE       = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-ifneq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),y)
-XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
+XINETD_CFLAGS = $(TARGET_CFLAGS)
+
+# Three cases here:
+#  1. We have libtirpc, use it by passing special flags
+#  2. We have native RPC support, use it, no need to pass special
+#     flags (so this case 2 is implicit and not visible below)
+#  3. We don't have RPC support, pass -DNO_RPC to disable it
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+XINETD_DEPENDENCIES += libtirpc
+XINETD_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+XINETD_LIBS += -ltirpc
+else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
+XINETD_CFLAGS += -DNO_RPC
 endif
 
+XINETD_CONF_ENV += \
+	CFLAGS="$(XINETD_CFLAGS)" \
+	LIBS="$(XINETD_LIBS)"
+
 XINETD_MAKE_OPT = AR="$(TARGET_AR)"
 
 $(eval $(autotools-package))
