From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:00:40 +0100
Subject: [Buildroot] [git commit] package/lxc: bump to version 3.2.1
Message-ID: <20191104205348.BA71B8E678@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63aad8a53e33e3fae4793e05662f47637e9e9bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some lxc segfaults (in 3.1.0) are fixed in this newer version.
New dependency on !UCLIBC as fexecve() is required now.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/Config.in | 6 ++++--
 package/lxc/lxc.hash  | 2 +-
 package/lxc/lxc.mk    | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index d8d8f50c8e..72b675113d 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LXC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  Linux Containers (LXC), provides the ability to group and
 	  isolate of a set of processes in a jail by virtualizing and
@@ -14,9 +15,10 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
+comment "lxc needs a glibc or musl toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAN_USES_UCLIBC
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index aad38ca57a..d5ea799776 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5	lxc-3.1.0.tar.gz
+sha256	5f903986a4b17d607eea28c0aa56bf1e76e8707747b1aa07d31680338b1cc3d4	lxc-3.2.1.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index a059fd578e..6d94c0c735 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 3.1.0
+LXC_VERSION = 3.2.1
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
