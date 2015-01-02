From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat,  3 Jan 2015 00:58:47 +0100
Subject: [Buildroot] [PATCH v3 1/2] Makefile: pass host PKG_CONFIG_PATH at
	"make menuconfig" time
In-Reply-To: <1420243128-7708-1-git-send-email-bjorn.forsman@gmail.com>
References: <1420243128-7708-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1420243128-7708-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e0b4f2..0112853 100644
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
 
-- 
2.1.3
