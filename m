From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 21:56:26 +0100
Subject: [Buildroot] [git commit] libnl: simplify makefile by using
	--{enable, disable}-cli
Message-ID: <20131104211055.4C2539BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=250af24dbd8c6902c0b92c95daa5b8cced947806
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libnl configure script has a --{enable,disable}-cli options that
allows to enable or disable the compilation of the libnl tools. Use
this option instead of compiling everything and then removing the
installed programs.

Note that we also get rid of the uninstall command, which is planned
to be globally removed in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libnl/libnl.mk |   19 ++++---------------
 1 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 5c884d7..3b56bc8 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -10,22 +10,11 @@ LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex
-LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
-	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
-	qdisc-list
 
-define LIBNL_UNINSTALL_TARGET_CMDS
-	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
-	rm -rf $(TARGET_DIR)/usr/lib/libnl
-endef
-
-define LIBNL_REMOVE_TOOLS
-	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
-	rm -rf $(TARGET_DIR)/usr/sbin/genl-ctrl-list
-endef
-
-ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
-LIBNL_POST_INSTALL_TARGET_HOOKS += LIBNL_REMOVE_TOOLS
+ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
+LIBNL_CONF_OPT += --enable-cli
+else
+LIBNL_CONF_OPT += --disable-cli
 endif
 
 $(eval $(autotools-package))
