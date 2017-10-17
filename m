From: Maksim Salau <msalau@iotecha.com>
Date: Tue, 17 Oct 2017 12:54:14 +0300
Subject: [Buildroot] [PATCH] pppd: Add an option to not to overwrite
	/etc/resolv.conf
Message-ID: <1508234054-22360-1-git-send-email-msalau@iotecha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default pppd built by buildroot writes the list of nameservers to
/etc/resolv.conf instead of /etc/ppp/resolv.conf
This is not the default behavior of pppd and breaks name resolution
if several network interfaces are used. The change makes this optional
and enabled by default, to be backward compatible and to add a possibility
to turn this behavior off, if required.

Signed-off-by: Maksim Salau <msalau@iotecha.com>
---
 package/pppd/Config.in | 7 +++++++
 package/pppd/pppd.mk   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 8c56421..9f77429 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -23,6 +23,13 @@ config BR2_PACKAGE_PPPD_RADIUS
 	help
 	  Install RADIUS support for pppd
 
+config BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF
+	bool "overwrite /etc/resolv.conf"
+	default y
+	help
+	  Overwrite /etc/resolv.conf instead of maintaining the separate list
+	  of nameservers in /etc/ppp/resolv.conf
+
 endif
 
 comment "pppd needs a uClibc or glibc toolchain w/ dynamic library"
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 6139c5b..6b86a4d 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -41,7 +41,9 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
 define PPPD_SET_RESOLV_CONF
 	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
 endef
+ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
 PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
+endif
 
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
-- 
2.7.4
