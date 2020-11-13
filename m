From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2020 22:20:23 +0100
Subject: [Buildroot] [git commit branch/next] package/linux-backports: fix
 kernel version check
Message-ID: <20201117203829.2B97D7FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=464bb73b92cacdafd19515d7474a53d8401940dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f "infra/pkg-kconfig:
do not rely on package's .config as a timestamp" broke the kernel
version check of this linux-backports package (it was no longer
executed). Since linux-4.19, the kernel's build system internally
touches its .config file, so it can no longer be used as a stamp file.
The stamp file defined in KCONFIG_STAMP_DOTCONFIG variable of
pkg-kconfig infra need to be used instead.

This commit fixes the kernel version check.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-backports/linux-backports.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 030d7a2864..1827ee18b7 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -85,21 +85,24 @@ $(eval $(kconfig-package))
 # not have been parsed yet, so the Linux build dir LINUX_DIR is not yet
 # known. Thus, we use a "secondary expansion" so the rule is re-evaluated
 # after all Makefiles are parsed, and thus at that time we will have the
-# LINUX_DIR variable set to the proper value.
+# LINUX_DIR variable set to the proper value. Moreover, since linux-4.19,
+# the kernel's build system internally touches its .config file, so we
+# can't use it as a stamp file. We use the LINUX_KCONFIG_STAMP_DOTCONFIG
+# instead.
 #
 # Furthermore, we want to check the kernel version, since linux-backports
 # only supports kernels >= 3.0. To avoid overriding linux-backports'
-# .config rule defined in the kconfig-package infra, we use an
-# intermediate stamp-file.
+# KCONFIG_STAMP_DOTCONFIG rule defined in the kconfig-package infra, we
+# use an intermediate stamp-file.
 #
 # Finally, it must also come after the call to kconfig-package, so we get
 # LINUX_BACKPORTS_DIR properly defined (because the target part of the
 # rule is not re-evaluated).
 #
-$(LINUX_BACKPORTS_DIR)/.config: $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version
+$(LINUX_BACKPORTS_DIR)/$(LINUX_BACKPORTS_KCONFIG_STAMP_DOTCONFIG): $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version
 
 .SECONDEXPANSION:
-$(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/.config
+$(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/$$(LINUX_KCONFIG_STAMP_DOTCONFIG)
 	$(Q)LINUX_VERSION_PROBED=$(LINUX_VERSION_PROBED); \
 	if [ $${LINUX_VERSION_PROBED%%.*} -lt 3 ]; then \
 		printf "Linux version '%s' is too old for linux-backports (needs 3.0 or later)\n" \
