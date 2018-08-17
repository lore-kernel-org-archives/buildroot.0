From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:52:00 +0200
Subject: [Buildroot] [git commit] linux: replace shell for loop with make
 foreach loop
Message-ID: <20180817145447.CE31B8D4C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b53b177a638eff051caf017d3f4b92cbb52223b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit replaces the loop copying out-of-tree DTS into the kernel
tree by a make foreach loop instead of a shell for loop. This allows
to error out if one of the DTS file cannot be copied (for example if
it doesn't exist).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11673..e0d437427d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -389,9 +389,9 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-	@for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)); do \
-		cp -f $${dts} $(LINUX_ARCH_PATH)/boot/dts/ ; \
-	done
+	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
+		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+	)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
