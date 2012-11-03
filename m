From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:59 +0100
Subject: [Buildroot] [PATCH 14/18] xinetd: add support to use RPC support
	from libtirpc
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <782d19b832389c1e512ff8c0c8b9886dc2ca33c3.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd.mk |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
