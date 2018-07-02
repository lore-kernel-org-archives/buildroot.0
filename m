From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:06 +0200
Subject: [Buildroot] [PATCH 32/50] package/busybox: invert dependency with
 ifplugd
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <86acc1434b877f54e4556a51243c7eeba9854e8f.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/ifplugd/ifplugd.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c6834f44a3..b4c6c8f0fa 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
 	$(if $(BR2_PACKAGE_IFUPDOWN),ifupdown) \
 	$(if $(BR2_PACKAGE_IPROUTE2),iproute2) \
 	$(if $(BR2_PACKAGE_IPUTILS),iputils) \
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index b569320963..c7874b49e5 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -15,11 +15,6 @@ IFPLUGD_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
 IFPLUGD_CONF_OPTS = --disable-lynx --with-initdir=/etc/init.d/
 IFPLUGD_DEPENDENCIES = libdaemon
 
-# Prefer big ifplugd
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-IFPLUGD_DEPENDENCIES += busybox
-endif
-
 define IFPLUGD_INSTALL_FIXUP
 	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
-- 
2.14.1
