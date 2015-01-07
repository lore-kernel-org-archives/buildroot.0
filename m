From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:26:34 +0100
Subject: [Buildroot] [git commit] Makefile: pass host PKG_CONFIG_PATH at
	"make menuconfig" time
Message-ID: <20150107212806.B981580169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0515fe45661b6d320f8d2071df27ce64bfce2ab1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot unexports PKG_CONFIG_PATH in the top-level Makefile for purity
reasons. But it has an unfortunate side-effect in that "make menuconfig"
will not (necessarily) be able to pick up ncurses via host pkg-config,
breaking "make menuconfig" on systems where ncurses is installed in a
non-standard location.

This patch saves the original PKG_CONFIG_PATH variable in
HOST_PKG_CONFIG_PATH and restores the original PKG_CONFIG_PATH variable
only in the sub-processes that builds the various menuconfig/nconfig/...
targets.

(PKG_CONFIG_PATH has to be placed in front of the make command so that it
propagates to sub-processes. If given as an argument, it doesn't work.)

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 9995df7..6cee027 100644
--- a/Makefile
+++ b/Makefile
@@ -264,6 +264,7 @@ export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # Make sure pkg-config doesn't look outside the buildroot tree
+HOST_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH)
 unexport PKG_CONFIG_PATH
 unexport PKG_CONFIG_SYSROOT_DIR
 unexport PKG_CONFIG_LIBDIR
@@ -692,7 +693,8 @@ export HOSTCFLAGS
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
-	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
+	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
+	    obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
 
 DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
 
