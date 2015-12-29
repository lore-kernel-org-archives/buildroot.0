From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:51:44 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: require kernel
	modules from Kconfig
Message-ID: <20151229225703.3E8FA826DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e93381aac77b7482794d0acd2b3e3563b0f40354
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/Config.in        | 1 +
 package/nvidia-driver/nvidia-driver.mk | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index b50e2c3..30763c5 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -76,6 +76,7 @@ comment "nvidia kernel module needs a kernel to be built"
 config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
 	bool "nvidia kernel module"
 	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  Build the nvidia.ko kernel module.
 
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index a021ab8..7eef73b 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -91,10 +91,6 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
 
 NVIDIA_DRIVER_DEPENDENCIES += linux
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-LINUX_NEEDS_MODULES = y
-
 # NVidia uses the legacy naming scheme for the x86 architecture, when i386
 # and x86_64 were still considered two separate architectures in the Linux
 # kernel.
