From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:31:11 +0200
Subject: [Buildroot] [git commit] package/busybox: check for config file
Message-ID: <20150714083403.0E440819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ff5f63e48237cf569aaba6be35e179bf8556a19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a check (before we call kconfig-package) that ensures the user has
set a kconfig-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index aab7f5d..d8c8bad 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -223,4 +223,12 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),)
+$(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_CONFIG setting)
+endif
+endif
+
 $(eval $(kconfig-package))
