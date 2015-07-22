From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 16:58:53 +0200
Subject: [Buildroot] [PATCH 2/4 v8] package/linux: trash stderr in
	LINUX_VERSION_PROBED
In-Reply-To: <cover.1437576751.git.yann.morin.1998@free.fr>
References: <cover.1437576751.git.yann.morin.1998@free.fr>
Message-ID: <ef00287ced2818f4a7079f5809ada2de0d6e6cfb.1437576751.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux buildsystem tries to run the compiler even just for
'kernelrelease' (which we store in LINUX_VERSION_PROBED) and we
sometimes need to use it before the toolchain is available; thus
we get spurious errors on stderr.

Consign stderr to oblivion when computing the 'kernelrelease'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 375a9e1..d91dbb2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -76,7 +76,7 @@ LINUX_MAKE_ENV = \
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease`
+LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
-- 
1.9.1
