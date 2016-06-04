From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:48 +0200
Subject: [Buildroot] [PATCH 2/8 v3] core: name the package before its help
	text
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <0467732046e4d2f86bc8bf29df9d9e1bf2ce9585.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all our internal packages provide actions that are prefixed
with their own names. This makes it obvious what package the action
refer to.

However, the help commands are really free-form. This means that
packages (and especially packages from a br2-external tree) may provide
completely arbitrary help text.

As such, all that text can get pretty easily mixed up, and it will be
very difficult to read.

Prefix each package-specific help text with the name of the package it
refers to. This generate a "make help" that looks like:

    [...]
    Package-specific:
      <pkg>                  - Build and install <pkg> and all its dependencies
      <pkg>-source           - Only download the source files for <pkg>
      <pkg>-extract          - Extract <pkg> sources
      <pkg>-patch            - Apply patches to <pkg>
      <pkg>-depends          - Build <pkg>'s dependencies
      <pkg>-configure        - Build <pkg> up to the configure step
      <pkg>-build            - Build <pkg> up to the build step
      <pkg>-graph-depends    - Generate a graph of <pkg>'s dependencies
      <pkg>-dirclean         - Remove <pkg> build directory
      <pkg>-reconfigure      - Restart the build from the configure step
      <pkg>-rebuild          - Restart the build from the build step

    busybox:
      busybox-menuconfig     - Run BusyBox menuconfig
      busybox-nconfig        - Run BusyBox nconfig

    barebox:
      barebox-menuconfig     - Run barebox menuconfig
      barebox-savedefconfig  - Run barebox savedefconfig

    linux:
      linux-menuconfig       - Run Linux kernel menuconfig
      linux-savedefconfig    - Run Linux kernel savedefconfig
      linux-update-defconfig - Save the Linux configuration to the path specified
                               by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE

    Documentation:
      manual                 - build manual in all formats
      manual-html            - build manual in HTML
      [...]

(Note: busybox, barebox, linux help will be converted in followup
commits, they are represented here as an example of what this patch
does look like.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d77b539..65f5a65 100644
--- a/Makefile
+++ b/Makefile
@@ -937,7 +937,10 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
-	$(foreach p,$(HELP_PACKAGES),$($(p)_HELP_CMDS)$(sep))
+	$(foreach p,$(HELP_PACKAGES), \
+		@echo $(sep) \
+		@echo '$($(p)_NAME):' $(sep) \
+		$($(p)_HELP_CMDS)$(sep))
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
-- 
2.7.4
