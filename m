From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:25:25 +0200
Subject: [Buildroot] [git commit] package/linux: trash stderr in
	LINUX_VERSION_PROBED
Message-ID: <20150722152531.A3CDE7FEC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95dc64c294614c1d9bebb0931301b30abaaca26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux buildsystem tries to run the compiler even just for
'kernelrelease' (which we store in LINUX_VERSION_PROBED) and we
sometimes need to use it before the toolchain is available; thus
we get spurious errors on stderr.

Consign stderr to oblivion when computing the 'kernelrelease'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
