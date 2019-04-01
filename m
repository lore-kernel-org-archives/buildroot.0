From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 18:00:50 +0530
Subject: [Buildroot] [PATCH 2/3] package/linux-headers: add support for
 Linux 5.0 kernel headers
In-Reply-To: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
References: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190401123051.19455-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As package/linux-headers/linux-headers.hash is a symlink to
linux/linux.hash so update the same in this commit.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 linux/linux.hash                     | 3 +++
 package/linux-headers/Config.in.host | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/linux/linux.hash b/linux/linux.hash
index d7ddd1c877..bd6444518c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,3 +4,6 @@ sha256 7ec71d90d6e96e6f741676d157ac06f30c75be4eaf1649143a3c8b7d4f919731  linux-4
 sha256 7aa43e34e4c9e5965da29cef5ae196e06006f8c0d1d65fd755a2f197f0796a11  linux-4.14.103.tar.xz
 sha256 c09af067af62d299f5e33c279968de58c88fb7c59bd05e8f3bb460f611f60515  linux-4.9.160.tar.xz
 sha256 27da5401aa691762f3361c143f453877f499c02ea6c9c743b09538cb1af1c75d  linux-4.4.176.tar.xz
+
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256 437b141a6499159f5a7282d5eb4b2be055f8e862ccce44d7464e8759c31a2e43  linux-5.0.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 15574689fa..61b162c5c8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_4_20
 	bool "Linux 4.20.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 
+config BR2_KERNEL_HEADERS_5_0
+	bool "Linux 5.0.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -116,6 +120,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0
+	bool "5.0"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20
 	bool "4.20.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
@@ -292,6 +300,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.25"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.12"	if BR2_KERNEL_HEADERS_4_20
+	default "5.0"		if BR2_KERNEL_HEADERS_5_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
