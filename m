From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:46:58 +0100
Subject: [Buildroot] [git commit] linux: handle read-only dts files
Message-ID: <20160119204703.76D8A81E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bbbc5b7446933dcb1a08a20d5e58dc527b3e4a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some fine version control systems make all files read-only. The custom DTS file
may therefore be read-only, and that permission is preserved when copying into
the Linux build directory. A subsequent rebuild tries to 'cp' again, which
fails with a "Permission denied" error unless the -f option is used.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Acked-by: Nikolay Dimitrov <picmaster@mail.bg>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 045294b..3c53a0b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -304,7 +304,7 @@ endif
 # configuration has changed.
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
+		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
