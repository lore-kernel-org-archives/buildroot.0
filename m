From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:49 +0200
Subject: [Buildroot] [PATCH 17/20] xinetd: add support to use RPC support
	from libtirpc
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d88a9e06effd725dd2b9e08e8a702db3709f5211.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd.mk |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a420425..05168a5 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -9,10 +9,20 @@ XINETD_SITE          = http://www.xinetd.org
 XINETD_LICENSE       = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-ifneq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),y)
-XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
+XINETD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_RPC_SUPPORT_AVAILABLE),y)
+XINETD_DEPENDENCIES += libtirpc
+XINETD_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+XINETD_LIBS += -ltirpc
+else
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
