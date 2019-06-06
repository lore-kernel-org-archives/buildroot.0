From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:53:42 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] linux: build after
 intel-microcode if enabled for early loading support
Message-ID: <20190606154047.735D37FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9828846b96631df051e85713845c1cf58303355e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

To support building in (a subset of) the intel-microcode files into the
kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
microcode files are installed before the Linux kernel is built.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f26dc16ab4d087c8c3217c6d94cdc69d98aac2cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 51fd41fa15..dd182d06b2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -64,7 +64,8 @@ LINUX_MAKE_ENV = \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES = host-kmod
+LINUX_DEPENDENCIES = host-kmod \
+	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but
