From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 21:49:35 +0200
Subject: [Buildroot] [git commit] Revert "util-linux: bump to version 2.30"
Message-ID: <20170619194847.8225281D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a050ad9b378fd5e402985f0caafe5b1b332ad7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 088292cfc16359b966882f66b6e94dbc2c9813cb to prevent
breaking the build while we search for the root cause of the problem.

Fixes:
  http://autobuild.buildroot.net/results/7b0b1d8ba0015308724a9677f890e6e63f77e0ad
  http://autobuild.buildroot.net/results/11476388b8b774dc5ca7c9ceb34ea9ad1a4314b9
  http://autobuild.buildroot.net/results/9730d0c4a4001314351a0a116164ba854272db4d
  http://autobuild.buildroot.net/results/4d1440360bddfd0ddbbdddf6077bca0e796f2949
  http://autobuild.buildroot.net/results/f3089d8b8727a526eeb553964711e0066287422e
  http://autobuild.buildroot.net/results/ace6aaad6bee0f4bed44126fea57a090ff2541f9
  http://autobuild.buildroot.net/results/ff460fff5da05d38776eb04e8ada947290248f42
  http://autobuild.buildroot.net/results/a4979169d78938e0cc06e6a69eaac0ab13dc3084
  http://autobuild.buildroot.net/results/84e8c23ecb77a99f9bb70fca9de4a5062414037d
  http://autobuild.buildroot.net/results/d3433ef125b5cfbf8a4b8824c256dbd0ea34b6bb
  http://autobuild.buildroot.net/results/92bc3ae63709dae8cdb8860bd997f72c92ede442
  http://autobuild.buildroot.net/results/d9122512b0d0802c19184eccb5056bf985f74e5b
  http://autobuild.buildroot.net/results/dad980abe5dc72df436b21270797b32435b55392
  http://autobuild.buildroot.net/results/7def156b29011b90a20579b4bad436a7acde498c
  http://autobuild.buildroot.net/results/0bb97b8edc5cea657992cdb083ce9ae79c969f03
  http://autobuild.buildroot.net/results/8f76af2caf7dd08919a20cc1fd848c920512e988
  http://autobuild.buildroot.net/results/3a8ecda0ce63dd67a73d66fbd238072ddb079900
  http://autobuild.buildroot.net/results/8d43e6f00be41fde7163868c5fbc3235097629ed
  http://autobuild.buildroot.net/results/5049aab863707aae09bde540d98ea8063c017e7e
  http://autobuild.buildroot.net/results/e227393a29590b298112dfd8efa4aebe2ffa9294
  http://autobuild.buildroot.net/results/8ad4455dcdfcd991dff728910bdbcfa57f5774a4
  http://autobuild.buildroot.net/results/27947db73e4875df1dbeee35a6ea8ad6a31af0b5
  http://autobuild.buildroot.net/results/5a9cc647e648a61e3c24f929987df356abcdc104
  http://autobuild.buildroot.net/results/eb01bb21f6c942cf8cf067450f016fd3893cc7cd
  http://autobuild.buildroot.net/results/6f7e3f6b4acc93ce695c07199cf6bf643db4386e

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-sys-use-lm-for-scriptreplay-if-necessary.patch | 30 ++++++++++++++++++++++
 package/util-linux/Config.in                       | 24 +++++------------
 package/util-linux/util-linux.hash                 |  4 +--
 package/util-linux/util-linux.mk                   |  9 ++++---
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch b/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
new file mode 100644
index 0000000..cbf1a81
--- /dev/null
+++ b/package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
@@ -0,0 +1,30 @@
+From 02283be90292b2f57183aa930c4d69375f1d905d Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 18 Jan 2017 13:17:21 +0100
+Subject: [PATCH] build-sys: use -lm for scriptreplay if necessary
+
+Reported-by: Bert van Hall <bert.vanhall@avionic-design.de>
+Addresses: https://github.com/karelzak/util-linux/pull/397
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit feda4342df1ced25df3d200ed23469e740196c86)
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ term-utils/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/Makemodule.am b/term-utils/Makemodule.am
+index 1b7c5fc..ad1bb1f 100644
+--- a/term-utils/Makemodule.am
++++ b/term-utils/Makemodule.am
+@@ -21,7 +21,7 @@ if BUILD_SCRIPTREPLAY
+ usrbin_exec_PROGRAMS += scriptreplay
+ dist_man_MANS += term-utils/scriptreplay.1
+ scriptreplay_SOURCES = term-utils/scriptreplay.c
+-scriptreplay_LDADD = $(LDADD) libcommon.la
++scriptreplay_LDADD = $(LDADD) libcommon.la $(MATH_LIBS)
+ endif # BUILD_SCRIPTREPLAY
+ 
+ 
+-- 
+2.7.4
+
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 6ba239e..86db372 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -55,12 +55,12 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  Install the basic set of util-linux binaries.
 
 	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
-	  column, ctrlaltdel, dmesg, fdisk, fincore, findfs, findmnt,
-	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
-	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
-	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
-	  rtcwake, script, scriptreplay, setarch, setsid, sfdisk,
-	  swaplabel, swapoff, swapon, uuidgen, whereis, wipefs
+	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
+	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
+	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
+	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
+	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
+	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
 
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
@@ -95,11 +95,6 @@ comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic l
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
-config BR2_PACKAGE_UTIL_LINUX_CHMEM
-	bool "chmem"
-	help
-	  Sets a particular size or range of memory online or offline
-
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
@@ -199,13 +194,6 @@ config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	help
 	  Display information about known users in the system
 
-config BR2_PACKAGE_UTIL_LINUX_LSMEM
-	bool "lsmem"
-	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
-	help
-	  List the ranges of available memory with their online status
-
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 02b82f6..71b4982 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.30/sha256sums.asc
-sha256 c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d  util-linux-2.30.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.29/sha256sums.asc
+sha256 accea4d678209f97f634f40a93b7e9fcad5915d1f4749f6c47bee6bf110fe8e3  util-linux-2.29.2.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e78a406..325d0fe 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.30
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MAJOR = 2.29
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
+# 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
+UTIL_LINUX_AUTORECONF = YES
+
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
@@ -101,7 +104,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CHMEM),--enable-chmem,--disable-chmem) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
@@ -122,7 +124,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
