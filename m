From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 17:05:57 +0100
Subject: [Buildroot] [PATCH-NEXT v2 4/4] linux: build after linux-firmware
 if enabled for early loading support
In-Reply-To: <20210215160558.19574-1-peter@korsgaard.com>
References: <20210215160558.19574-1-peter@korsgaard.com>
Message-ID: <20210215160558.19574-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To support building in (a subset of) the linux-firmware files into the
kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
firmware files are installed before the Linux kernel is built, similar to
how it is done for intel-microcode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 248f47cdd407ba52a851d50ca29bd7fb2d0a9353)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- No changes

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
-- 
2.20.1
