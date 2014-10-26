From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 26 Oct 2014 14:17:26 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: pass host PKG_CONFIG_PATH at
	"make menuconfig" time
In-Reply-To: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
References: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1414329446-16587-3-git-send-email-bjorn.forsman@gmail.com>
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

With this change, I am able to run "make menuconfig" on NixOS[1].

[1]: http://nixos.org/

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 907a0fc..afabaf7 100644
--- a/Makefile
+++ b/Makefile
@@ -263,6 +263,7 @@ export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # Make sure pkg-config doesn't look outside the buildroot tree
+export HOST_PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)
 unexport PKG_CONFIG_PATH
 unexport PKG_CONFIG_SYSROOT_DIR
 unexport PKG_CONFIG_LIBDIR
@@ -691,7 +692,10 @@ export HOSTCFLAGS
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
-	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
+	(export PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH); \
+	 $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
+	         obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F) \
+	)
 
 DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
 
-- 
2.1.2
