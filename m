From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:07:00 +0100
Subject: [Buildroot] [PATCH 2/3] package/linux-headers: add support for
 Linux 4.20 kernel headers
In-Reply-To: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
References: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231160701.12086-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to update linux/linux.hash as part of this commit, because
package/linux-headers/linux-headers.hash is a symlink to
linux/linux.hash.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                     |  1 +
 package/linux-headers/Config.in.host | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 693605d3ec..adc133495c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 ad0823183522e743972382df0aa08fb5ae3077f662b125f1e599b0b2aaa12438  linux-4.20.tar.xz
 sha256 84d7aa436e10690b53165b9d59ec20548e6a4ce3324b135c5019fb0f7dd2a2d2  linux-4.19.7.tar.xz
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1d66759ac9..3c43bc8536 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_19
+	default BR2_KERNEL_HEADERS_4_20
 	help
 	  Select the kernel version to get headers from.
 
@@ -64,6 +64,10 @@ config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
+config BR2_KERNEL_HEADERS_4_20
+	bool "Linux 4.20.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -129,6 +133,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20
+	bool "4.20.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19
 	bool "4.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -304,6 +312,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default "4.19.7"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20"		if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
