From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue,  3 Jun 2014 21:53:24 -0400
Subject: [Buildroot] [PATCH 2/2] busybox: enable noclobber option in
	install.sh
In-Reply-To: <1401846804-2026-1-git-send-email-danomimanchego123@gmail.com>
References: <1401846804-2026-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1401846804-2026-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

Note: a patch was submitted to the Busybox mailing list in April 2014
to fix the install.sh argument processing, and to add an "Enable
noclobber" kconfig setting.  However, it received no comments.

See: http://lists.busybox.net/pipermail/busybox/2014-April/080786.html

This patch is not *that* patch, because then we would need a patch
per version of BusyBox, which might be cumbersome, and perhaps violates
the policy to not maintain feature patches.  Rather, this patch simply
uses sed from our busybox.mk to change the option's default value.
---
 package/busybox/busybox.mk |    7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.7.9.5
