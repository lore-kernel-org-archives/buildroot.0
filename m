From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Mar 2019 10:58:28 +1030
Subject: [Buildroot] [PATCH v2 2/4] package/linux-headers: add support for
 Linux 5.0 kernel headers
In-Reply-To: <20190321002830.21863-1-joel@jms.id.au>
References: <20190321002830.21863-1-joel@jms.id.au>
Message-ID: <20190321002830.21863-3-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets 5.0 to be the default, moving from 4.19 which was used instead
of 4.20 for the LTS branch.

We need to update linux/linux.hash as part of this commit, because
package/linux-headers/linux-headers.hash is a symlink to
linux/linux.hash.

Signed-off-by: Joel Stanley <joel@jms.id.au>
--
I kept Thomas' message about the hash as a reminder. We could drop that
text.
---
 linux/linux.hash                     |  2 ++
 package/linux-headers/Config.in.host | 13 ++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index d7ddd1c87788..5f71e377f423 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,3 +1,5 @@
+# From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256 43bfea3a6b24b4e5f63190409a199bee8cb93dbea01c52ad7f017078ebdf7c9b  linux-5.0.2.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 1cf544308195250805e0731c716691bea4c1ed29e03e6f9ae5be6dc16785a504  linux-4.20.12.tar.xz
 sha256 7ec71d90d6e96e6f741676d157ac06f30c75be4eaf1649143a3c8b7d4f919731  linux-4.19.25.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 15574689fa46..d04ccff8580b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,9 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	# We are intentionally staying at 4.19 for the next Buildroot
-	# LTS release (2019.02)
-	default BR2_KERNEL_HEADERS_4_19
+	default BR2_KERNEL_HEADERS_5_0
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +49,10 @@ config BR2_KERNEL_HEADERS_4_20
 	bool "Linux 4.20.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 
+config BR2_KERNEL_HEADERS_5_0
+	bool "Linux 5.0.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -116,6 +118,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0
+	bool "5.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20
 	bool "4.20.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
@@ -292,6 +298,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.25"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.12"	if BR2_KERNEL_HEADERS_4_20
+	default "5.0.2"		if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
