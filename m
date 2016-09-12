From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:57:53 +0200
Subject: [Buildroot] [git commit] linux-headers: allow specifying 4.8 as
	kernel header version
Message-ID: <20160912210013.3FAA08212A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3ac2bc616803b40efad1e620ffe09eb7f7d1565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though 4.8 is not released yet, some people may want to build a
system using the 4.8-rc kernel, and point to the kernel sources as the
kernel headers to use for the toolchain.

In order to make this possible, this commit adds support for specifying
4.8 as the kernel headers version, in both the internal and external
toolchain logic.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
[Thomas: remove support for 4.8 headers selection, and rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host   | 4 ++++
 toolchain/toolchain-common.in          | 5 +++++
 toolchain/toolchain-external/Config.in | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7fea748..cbfaa26 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -106,6 +106,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 03fa880..b682e4d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -222,10 +222,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	default "4.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	default "4.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	default "4.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 63b7712..c3822ed 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -794,6 +794,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
