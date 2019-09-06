From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:41 +0200
Subject: [Buildroot] [PATCH 05/11] linux: override CC for the case CC is not
 GCC
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-6-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now we provided only CROSS_COMPILE to the kernel
buildsystem to use our GCC cross-compiler. Internally,
the buildsystem defined CC=$(CROSS_COMPILE)gcc.

Since Clang can now be used as cross-compiler, Buildroot
may define in the future TARGET_CC to use clang instead
of GCC.

In order to build the kernel with the selected compiler,
make sure to define CC=$(TARGET_CC) in LINUX_MAKE_FLAGS.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29d2f0ee69..d381c96d85 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -128,6 +128,7 @@ LINUX_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CC="$(TARGET_CC)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
 ifeq ($(BR2_REPRODUCIBLE),y)
-- 
2.21.0
