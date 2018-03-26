From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Mar 2018 14:00:06 +0200
Subject: [Buildroot] [PATCH] busybox: disable PAM in the config if linux-pam
 is not selected
Message-ID: <20180326120006.24104-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there is only logic to enable PAM when linux-pam is selected.
However, busybox will fail to build with PAM enabled if the linux-pam
package has not been built before. So we should forcibly disable PAM in
busybox in that case.

Normally this is not an issue since our default busybox config doesn't
have PAM enabled. However, if you enable linux-pam, then save the
busybox config to a custom configuration file, then disable linux-pam
again, and then do a "make clean; make", the build will fail. A more
practical situation where this can occur is when the same custom
busybox config is used in a Buildroot config with and without
linux-pam.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Resend, patchwork missed the first send.
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bc0c661754..7009f6a675 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -248,6 +248,10 @@ define BUSYBOX_LINUX_PAM
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
 endef
 BUSYBOX_DEPENDENCIES += linux-pam
+else
+define BUSYBOX_LINUX_PAM
+	$(call KCONFIG_DISABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
+endef
 endif
 
 # Telnet support
-- 
2.16.2
