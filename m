From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:53 +0200
Subject: [Buildroot] [PATCH 19/50] package/busybox: invert dependency with
 pciutils
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <2b14db69dfbf81fc068b02e05a8df25a28232759.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   | 1 +
 package/pciutils/pciutils.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 981c7b0e03..99baf91a83 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
 	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
 	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslogd) \
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2dd5771f21..30d429e75a 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -46,11 +46,6 @@ else
 PCIUTILS_MAKE_OPTS += SHARED=yes
 endif
 
-# Build after busybox since it's got a lightweight lspci
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-PCIUTILS_DEPENDENCIES += busybox
-endif
-
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
-- 
2.14.1
