From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 13:50:06 +0100
Subject: [Buildroot] [git commit branch/next] linux: build after
 linux-firmware if enabled for early loading support
Message-ID: <20210223122839.40366802DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dacf9d78f2244694d4a20d82b66180460e75d391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

To support building in (a subset of) the linux-firmware files into the
kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
firmware files are installed before the Linux kernel is built, similar to
how it is done for intel-microcode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a212f42c28..5e4b319cf1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -78,7 +78,8 @@ LINUX_MAKE_ENV = \
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
-	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
+	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
+	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but
