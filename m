From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 May 2019 00:17:11 +0200
Subject: [Buildroot] [PATCH 2/3] linux: build after intel-microcode if
 enabled for early loading support
In-Reply-To: <20190520221712.22564-1-peter@korsgaard.com>
References: <20190520221712.22564-1-peter@korsgaard.com>
Message-ID: <20190520221712.22564-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To support building in (a subset of) the intel-microcode files into the
kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
microcode files are installed before the Linux kernel is built.

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
-- 
2.11.0
