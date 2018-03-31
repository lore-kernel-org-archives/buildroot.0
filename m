From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:34:55 +0200
Subject: [Buildroot] [git commit] infra/pkg-config: hide away non-critical
 commands
Message-ID: <20180331203457.BA66D81555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152f58e2092158cfd243934f577430badd619637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When updating back the (def)config file, the touch command is not very
useful by default, so hide it away.

We do not hide away the cp command, as that could confuse the user under
some circunmstances. For example, when the toolchain does not yet exist,
the uClibc buildsystem will complain multiple times about gcc not being
found, like so:

    make[2]: /home/ymorin/dev/buildroot/O/host/bin/i686-buildroot-linux-uclibc-gcc: Command not found

(Note that we can not suppress those warnings, as they are on stderr,
and we still want to see stderr in case of real errors).

So, if we were to hide the cp command, the user could be left confused,
even though we were sucessful in updating back the (def)config file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 4bd7161b1a..0da6d0ab4e 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -19,7 +19,7 @@ define kconfig-package-update-config
 	@$(if $($(PKG)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(@) when using a defconfig rule"; exit 1)
 	cp -f $($(PKG)_DIR)/$(1) $($(PKG)_KCONFIG_FILE)
-	touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
+	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
 ################################################################################
