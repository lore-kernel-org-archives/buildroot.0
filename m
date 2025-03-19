Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E8AC35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6C54094C;
	Wed, 19 Mar 2025 20:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLP6tzuVpiQX; Wed, 19 Mar 2025 20:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F44B408AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F44B408AE;
	Wed, 19 Mar 2025 20:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5219916E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D7C40103
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tyoHVzKpLwC for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFC5F40114
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC5F40114
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B741D8815C; Wed, 19 Mar 2025 20:13:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Mar 2025 20:53:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d65c10c20add58f17cf1d7b6de8e7903b0aa9ddc
X-Git-Newrev: 25af5a3b3aa3480ee10158e55c280d675430442a
X-Patchwork-Hint: ignore
Message-Id: <20250319201336.B741D8815C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update version to 0.24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=25af5a3b3aa3480ee10158e55c280d675430442a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Require C++20, drop dependency on boost, require new minimum versions for
tools and libraries:

package        mpd-0.24 buildroot
  gcc          12       12.4.0
  meson         1.0      1.7.0
  alsa-lib      1.1      1.2.13
  ffmpeg        4.0      6.1.2
  libfmt        9       11.0.2
  libmpdclient  2.15     2.22
  libnfs        4.0      5.0.3
  libsoxr       0.1.2    0.1.3

The GenParseName tool compiled and run on the build machine now needs
host-gcc 10, because the parsed structure uses constexpr (P1143R2). [1][2]

Due to the introduction of openat2 system calls (available since Linux
kernel 5.6), MPD now has a minimum kernel header requirement. [3][4]

Release note: https://musicpd.org/news/2025/03/mpd-0-24-released/
Change log: https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS

$ utils/check-package package/mpd/*
919 lines processed
0 warnings generated

$ gcc --version
gcc (Ubuntu 10.5.0-4ubuntu2) 10.5.0

$ mkdir ~/output
$ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
$ utils/test-pkg -a -c ~/output/mpd.config -d ~/output -p mpd
                             arm-aarch64 [ 1/40]: SKIPPED
                   bootlin-aarch64-glibc [ 2/40]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: SKIPPED
                      bootlin-armv7-musl [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                bootlin-mipsel32r6-glibc [11/40]: SKIPPED
                   bootlin-mipsel-uclibc [12/40]: SKIPPED
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [14/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [15/40]: SKIPPED
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: SKIPPED
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                   bootlin-sparc64-glibc [21/40]: SKIPPED
                    bootlin-sparc-uclibc [22/40]: SKIPPED
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: SKIPPED
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: SKIPPED
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: SKIPPED
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: SKIPPED
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                         sourcery-mips64 [39/40]: SKIPPED
                           sourcery-mips [40/40]: SKIPPED
40 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

[1] https://github.com/MusicPlayerDaemon/MPD/blob/master/src/tag/Names.cxx#L9
[2] https://gcc.gnu.org/projects/cxx-status.html#cxx20
[3] https://github.com/MusicPlayerDaemon/MPD/commit/dda85e0
[4] https://man7.org/linux/man-pages/man2/openat2.2.html

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...event-meson.build-add-atomic-dependency-for-spar.patch |  6 +++++-
 package/mpd/Config.in                                     | 15 ++++++++-------
 package/mpd/mpd.hash                                      |  2 +-
 package/mpd/mpd.mk                                        |  6 +++---
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
index 28a82da30a..9ebf7d09d9 100644
--- a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
+++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
@@ -13,6 +13,10 @@ Upstream: not sent (the same kind of patch for ncmpc was
 refused: https://github.com/MusicPlayerDaemon/ncmpc/pull/45)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Andreas: adapt upstream formatting]
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+---
+Rebase for mpd-0.24
+
 Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 ---
  src/event/meson.build | 4 ++++
@@ -22,7 +26,7 @@ diff --git a/src/event/meson.build b/src/event/meson.build
 index bc13bbcd2..88370c03a 100644
 --- a/src/event/meson.build
 +++ b/src/event/meson.build
-@@ -47,9 +47,13 @@ event = declare_dependency(
+@@ -46,9 +46,13 @@
    ],
  )
  
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 03ceaa1e00..6bf745b30b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,13 +1,13 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
+	depends on BR2_USE_WCHAR # libfmt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
-	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
-	select BR2_PACKAGE_BOOST
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12 # C++20 recommended
+	depends on BR2_HOST_GCC_AT_LEAST_10 # C++20 constinit P4311R2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 # openat2.h
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -433,10 +433,11 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
+comment "mpd needs a toolchain w/ C++, threads, wchar, host-gcc 10, gcc 12, headers 5.6"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		!BR2_HOST_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_12 || \
+		!BR2_THOST_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index ce6d63addf..a8d2b31b3e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a86f4fe811695743b08db82a9f1a840b8918bb4f46b06f48aa1d8d1b5386dff2  mpd-0.23.17.tar.xz
+sha256  1c828a290816d540fb2dec90f78044b55ff5ef8b49dd47a639ac34e3e5226bc5  mpd-0.24.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b0935d5184..0f5c07ae71 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).17
+MPD_VERSION_MAJOR = 0.24
+MPD_VERSION = $(MPD_VERSION_MAJOR)
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
-MPD_DEPENDENCIES = host-pkgconf boost fmt
+MPD_DEPENDENCIES = host-pkgconf fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 # these refer to the FreeBSD PPP daemon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
