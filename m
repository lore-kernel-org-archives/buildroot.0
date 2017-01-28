From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:02:51 +1300
Subject: [Buildroot] [git commit] package: fix reverse dependencies of
	util-linux
Message-ID: <20170128080730.7E19C81E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4427fe2821f569ba6d680ba3fc7c3caa3be4abdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
dependency on BR2_USE_WCHAR, but failed to update the reverse
dependencies of util-linux.

This commit fixes all such reverse dependencies by removing dependency
on BR2_USE_WCHAR as it is not required by package itself.

Fixes: 006a328ad6be ("util-linux: fix build with ncurses")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/gummiboot/Config.in            |  4 ----
 package/bcache-tools/Config.in      |  5 ++---
 package/btrfs-progs/Config.in       |  5 ++---
 package/circus/Config.in            |  7 +++----
 package/cppzmq/Config.in            |  6 ++----
 package/cryptsetup/Config.in        |  5 ++---
 package/czmq/Config.in              |  6 ++----
 package/docker-containerd/Config.in |  5 ++---
 package/docker-engine/Config.in     |  2 --
 package/e2fsprogs/Config.in         |  5 -----
 package/filemq/Config.in            |  6 ++----
 package/gptfdisk/Config.in          |  6 +++---
 package/libcrossguid/Config.in      |  6 ++----
 package/lttng-tools/Config.in       |  5 ++---
 package/mongrel2/Config.in          |  7 +++----
 package/mtd/Config.in               |  4 ----
 package/ola/Config.in               |  7 +++----
 package/php-zmq/Config.in           |  6 ++----
 package/python-pyzmq/Config.in      |  6 ++----
 package/qpid-proton/Config.in       |  5 ++---
 package/systemd/Config.in           |  1 -
 package/xfsprogs/Config.in          |  5 ++---
 package/zeromq/Config.in            | 12 ++++++++----
 package/zmqpp/Config.in             | 13 +++++++------
 package/zyre/Config.in              |  6 ++----
 25 files changed, 55 insertions(+), 90 deletions(-)

diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
index ad49793..11dbc4f 100644
--- a/boot/gummiboot/Config.in
+++ b/boot/gummiboot/Config.in
@@ -4,7 +4,6 @@ config BR2_TARGET_GUMMIBOOT
 	select BR2_PACKAGE_GNU_EFI
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	depends on BR2_USE_WCHAR # util-linux
 	help
 	  gummiboot is a simple UEFI boot manager which executes
 	  configured EFI images. The default entry is selected by a
@@ -22,6 +21,3 @@ config BR2_TARGET_GUMMIBOOT
 	  files will be located in /loader/ inside the EFI partition.
 
 	  http://freedesktop.org/wiki/Software/gummiboot/
-
-comment "gummiboot needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
index ee5f1f2..7e6319b 100644
--- a/package/bcache-tools/Config.in
+++ b/package/bcache-tools/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BCACHE_TOOLS
 	bool "bcache tools"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux (libblkid)
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -16,6 +15,6 @@ config BR2_PACKAGE_BCACHE_TOOLS
 	  This is the user space bcache tools, required to setup the linux
 	  bcache feature of the Linux kernel.
 
-comment "bcache-tools needs udev /dev management and a toolchain w/ wchar"
+comment "bcache-tools needs udev /dev management"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index dc0fa81..ad86bab 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BTRFS_PROGS
 	bool "btrfs-progs"
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_E2FSPROGS
@@ -14,6 +13,6 @@ config BR2_PACKAGE_BTRFS_PROGS
 
 	  https://btrfs.wiki.kernel.org/index.php/Main_Page
 
-comment "btrfs-progs needs a toolchain w/ wchar, threads"
+comment "btrfs-progs needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/circus/Config.in b/package/circus/Config.in
index 94c59a4..5276513 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CIRCUS
 	bool "circus"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on BR2_USE_WCHAR # pyzmq -> zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
 	depends on !BR2_TOOLCHAIN_USES_MUSL # python-psutil
@@ -16,7 +15,7 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL || \
+comment "circus needs Python and a uClibc or glibc toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_MUSL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index 788fd0b..c984c15 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
@@ -9,6 +8,5 @@ config BR2_PACKAGE_CPPZMQ
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+comment "cppzmq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index d2bf3b4..3ca23ba 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
@@ -16,7 +15,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
+comment "cryptsetup needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 6a99336..cfa5152 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -3,14 +3,12 @@ config BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, wchar, threads"
+comment "czmq needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 99af917..2f7bf71 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # util-linux
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
@@ -16,8 +15,8 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 	  https://github.com/docker/containerd
 
-comment "docker-containerd needs a toolchain w/ threads, wchar"
+comment "docker-containerd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b99b121..1879a56 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -14,7 +14,6 @@ if BR2_PACKAGE_DOCKER_ENGINE
 config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	bool "docker daemon"
 	depends on BR2_USE_MMU # docker-containerd
-	depends on BR2_USE_WCHAR # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
@@ -30,7 +29,6 @@ if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
-	depends on BR2_USE_WCHAR # btrfs-progs
 	depends on BR2_USE_MMU # btrfs-progs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
 	select BR2_PACKAGE_BTRFS_PROGS
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 4db11e1..d1914a9 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -100,7 +99,3 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 	default y
 
 endif
-
-comment "e2fsprogs needs a toolchain w/ wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index 4460f87..e06a267 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_FILEMQ
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
 	help
@@ -12,7 +11,6 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq needs a toolchain w/ C++, wchar, threads"
+comment "filemq needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index befdf77..22dc401 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,10 +1,9 @@
-comment "gptfdisk needs a toolchain w/ wchar, C++"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+comment "gptfdisk needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GPTFDISK
 	bool "gptfdisk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_GPTFDISK_GDISK if \
@@ -38,6 +37,7 @@ config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
+	depends on BR2_USE_WCHAR # ncurses wchar
 	depends on !(BR2_bfin && BR2_BINFMT_FLAT) # ncurses wchar support
 	help
 	  Install the ncurses-based GUID partition table (GPT)
diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
index 61ca781..49060bc 100644
--- a/package/libcrossguid/Config.in
+++ b/package/libcrossguid/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBCROSSGUID
 	bool "libcrossguid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -10,6 +9,5 @@ config BR2_PACKAGE_LIBCROSSGUID
 
 	  https://github.com/graeme-hill/crossguid
 
-comment "libcrossguid needs a toolchain w/ C++, wchar, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "libcrossguid needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index dd72cc6..187e424 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	select BR2_PACKAGE_LIBURCU
@@ -28,6 +27,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ threads, wchar, dynamic library"
+comment "lttng-tools needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index bc9b79b..796bae6 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -7,10 +7,10 @@ config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_sparc || BR2_x86_64)
 
-comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library"
+comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
@@ -18,7 +18,6 @@ config BR2_PACKAGE_MONGREL2
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on BR2_USE_WCHAR # zeromq -> util-linux
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	help
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 8be5eff..2e6cdbb 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -62,10 +62,6 @@ config BR2_PACKAGE_MTD_MKFSUBIFS
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_WCHAR # util-linux
-
-comment "mkfs.ubifs needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 2f1d33e..90a92fd 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,6 +1,6 @@
-comment "ola needs a toolchain w/ C++, threads, wchar, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "ola needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_OLA
@@ -10,7 +10,6 @@ menuconfig BR2_PACKAGE_OLA
 	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	help
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index c258272..058f93d 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -1,12 +1,10 @@
-comment "php-zmq needs a toolchain w/ C++, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR \
-		&& BR2_TOOLCHAIN_HAS_THREADS)
+comment "php-zmq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_PHP_ZMQ
 	bool "php-zmq"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZEROMQ
 	help
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index af4467f..8f33a63 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYZMQ
 	bool "python-pyzmq"
-	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
@@ -9,7 +8,6 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 
 	  http://zeromq.org/bindings:python
 
-comment "python-pyzmq needs a toolchain w/ C++, wchar, threads"
+comment "python-pyzmq needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index f8aaf39..47cddeb 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QPID_PROTON
 	bool "qpid-proton"
 	depends on !BR2_STATIC_LIBS # build a shared library
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -14,5 +13,5 @@ config BR2_PACKAGE_QPID_PROTON
 
 	  https://qpid.apache.org/proton/
 
-comment "qpid-proton needs a toolchain w/ dynamic library, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+comment "qpid-proton needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1aedb7b..aaed7dc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
-	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index a82663f..ccb3214 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,11 +1,10 @@
-comment "xfsprogs needs a glibc or uClibc toolchain w/ wchar"
+comment "xfsprogs needs a glibc or uClibc toolchain"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index d5c9dea..53cbbb8 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,11 +1,9 @@
-comment "zeromq needs a toolchain w/ C++, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+comment "zeromq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -38,10 +36,16 @@ config BR2_PACKAGE_ZEROMQ_NORM
 	  Add support for NACK-Oriented Reliable Multicast (RFC 5740)
 	  protocol.
 
+comment "PGM/EPGM support needs a toolchain w/ wchar"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 67e89b3..04a6d24 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_ZMQPP
 	# c++1x support
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
@@ -14,9 +13,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 if BR2_PACKAGE_ZMQPP
 
@@ -24,13 +23,15 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
 	  Build and install the zmqpp client, a command line tool that can be
 	  used to listen or send to zeromq sockets.
 
-comment "zmqpp client needs a toolchain w/ dynamic library, threads"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
 
 endif
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index a6aef60..21a0884 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ZYRE
 	bool "zyre"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
 	select BR2_PACKAGE_CZMQ
@@ -12,7 +11,6 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre needs a toolchain w/ C++, wchar, threads"
+comment "zyre needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
