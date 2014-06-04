From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 23:21:23 +0200
Subject: [Buildroot] [git commit] busybox: enable noclobber option in
	install.sh
Message-ID: <20140604212607.845F69CE97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=802bff9c42376078f28aa49d3eab630120940eb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We support a busybox-menuconfig target so that the BusyBox
configuration can be adjusted as needed.  However, depending
on what other packages are enabled, re-installing BusyBox
symlinks that duplicate "real" apps after the configuration
change can result in bad behaviors:

* At best, the BusyBox applet will be used after the
install, versus the desired "real" app.

* At worst, the built rootfs can become unbootable.

The BusyBox install.sh has some capability to avoid this issue
by means of a --noclobber option.  By default, this option is
disabled.  When enabled, the install.sh will not overwrite a
target file with a symlink or hardlink, be it an actual file
or a previously installed BusyBox link.

The install.sh's argument processing is somewhat broken, so this
patch simply changes the default value of the noclobber option
to on, rather than add --noclobber to the install.sh invocation.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3d87cd7..f6c0378 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -189,6 +189,12 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
+# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any
+# full-blown versions of apps installed by other packages with sym/hard links.
+define BUSYBOX_NOCLOBBER_INSTALL
+	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
+endef
+
 define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_COPY_CONFIG)
 	$(BUSYBOX_SET_MMU)
@@ -204,6 +210,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
+	$(BUSYBOX_NOCLOBBER_INSTALL)
 endef
 
 define BUSYBOX_BUILD_CMDS
