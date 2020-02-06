From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2020 11:49:02 +0100
Subject: [Buildroot] [git commit] package/linux-headers: license files
 hashes only valid for latest version
Message-ID: <20200206111838.88AC58D3F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2009e9f757fe759c74406f1025967b7b8e77f0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we did for the linux kernel, change linux-headers to only check the
license hashes for the latest known version as the content of COPYING has
changed between versions.

To simplify the test, we introduce an intermediate, blind option that get
selected when the latest kernel sources are used.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host   | 6 ++++++
 package/linux-headers/linux-headers.mk | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9f46a1052b..094fb9e10e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -25,6 +25,7 @@ choice
 config BR2_KERNEL_HEADERS_AS_KERNEL
 	bool "Same as kernel being built"
 	depends on BR2_LINUX_KERNEL
+	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
 config BR2_KERNEL_HEADERS_4_4
 	bool "Linux 4.4.x kernel headers"
@@ -52,6 +53,7 @@ config BR2_KERNEL_HEADERS_4_19
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
@@ -83,6 +85,10 @@ config BR2_KERNEL_HEADERS_CUSTOM_GIT
 
 endchoice
 
+# Select this for the latest kernel headers version (for license hashes)
+config BR2_KERNEL_HEADERS_LATEST
+	bool
+
 config BR2_DEFAULT_KERNEL_VERSION
 	string "linux version"
 	depends on BR2_KERNEL_HEADERS_VERSION
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 676c8c44ea..2b7879c62f 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -91,7 +91,12 @@ endif
 LINUX_HEADERS_DL_SUBDIR = linux
 
 LINUX_HEADERS_LICENSE = GPL-2.0
-LINUX_HEADERS_LICENSE_FILES = COPYING
+ifeq ($(BR2_KERNEL_HEADERS_LATEST),y)
+LINUX_HEADERS_LICENSE_FILES = \
+	COPYING \
+	LICENSES/preferred/GPL-2.0 \
+	LICENSES/exceptions/Linux-syscall-note
+endif
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
