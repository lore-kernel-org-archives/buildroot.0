From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 09:07:45 +0100
Subject: [Buildroot] [git commit] linux: handle new dtb location since
	3.8-rc1
Message-ID: <20121221081435.602459A39B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef34705087b5841809305afc97188f2eb23a270b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.dtb files are now generated in arch/$ARCH/boot/dts instead of
arch/$ARCH/boot, so extend the LINUX_INSTALL_DTB rule to look there
as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6586e68..e852f62 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -192,7 +192,10 @@ define LINUX_BUILD_DTB
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
 define LINUX_INSTALL_DTB
-	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/,$(KERNEL_DTBS)) \
+	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	cp $(addprefix \
+		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
+		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
 		$(BINARIES_DIR)/
 endef
 endif
