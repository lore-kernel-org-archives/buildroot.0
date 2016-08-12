From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Aug 2016 18:14:31 +0300
Subject: [Buildroot] [PATCH] spidev_test: fix musl build
Message-ID: <0f104daf6f7285467a6909f88c7b4b38f42a0c7d.1471014871.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

spidev.h needs _IOC_SIZEBITS. Add linux/ioctl.h for that to fix build under
musl.

The patch suggested upstream (https://patchwork.kernel.org/patch/9276909/)
does not apply to the spidev_test.c version we currently use. A backported
patch would break once we bump spidev_test.c. A bump+patch solution would
break if/when upstream accepts this patch. That's why this commit uses the
unusual sed patching to keep compatibility with current and future
spidev_test.c versions.

Fixes:
http://autobuild.buildroot.net/results/128/1284a36c70ff8a1412e2128266c6654b2aa5b2da/
http://autobuild.buildroot.net/results/0ad/0adea6121b238adf0e64d455a7573b1a31c38264/
http://autobuild.buildroot.net/results/21b/21b92651ce456f3819eef315cecd92ff70b9e98f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/spidev_test/spidev_test.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 646372f2f5d7..52441bb3da14 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -16,6 +16,15 @@ SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.gi
 SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
 SPIDEV_TEST_LICENSE = GPLv2
 
+# musl libc requires linux/ioctl.h for _IOC_SIZEBITS. Do a sed patch to keep
+# compatibility with different spidev_test.c versions that we support.
+define SPIDEV_ADD_LINUX_IOCTL
+	$(SED) 's~^#include <sys/ioctl.h>~#include <sys/ioctl.h>\n#include <linux/ioctl.h>~' \
+		$(@D)/spidev_test.c
+endef
+
+SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_ADD_LINUX_IOCTL
+
 define SPIDEV_TEST_EXTRACT_CMDS
 	cp $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
 endef
-- 
2.8.1
