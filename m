From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Mar 2017 21:44:45 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] mpd: fix build for ARC
Message-ID: <20170302204501.5E671822BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5015443f1f7b508439512a91c22d7fd83decccd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

mpd package fails for both internal and external ARC toolchain as check
for pthread support fails. Such checks fails because _REENTRANT flag is
not defined in gcc even when -pthread is passed.

So we add patch to gcc that defines _REENTRANT  on ARC when -pthread is
passed.

Also it disables mpd package for external ARC toolchain as it fails due
to the same issue.

This patch should be reverted as soon as the patch for GCC becomes a
part of ARC toolchain.

Fixes:
  http://autobuild.buildroot.net/results/7d7/7d70b62ad996830fbeca46dffcc7a1dc030e575d//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4d3556662deba0014d9368a84344a59b5e167fac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-define-_REENTRANT-when-pthread-is-passed.patch | 34 ++++++++++++++++++++++
 package/mpd/Config.in                              |  3 ++
 2 files changed, 37 insertions(+)

diff --git a/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch b/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
new file mode 100644
index 0000000..ee9add5
--- /dev/null
+++ b/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
@@ -0,0 +1,34 @@
+From 4c6367c99461fdd7bd5613483f2582d7f08fba87 Mon Sep 17 00:00:00 2001
+From: Vlad Zakharov <vzakhar@synopsys.com>
+Date: Tue, 28 Feb 2017 17:41:11 +0300
+Subject: [PATCH] arc: define _REENTRANT when -pthread is passed
+
+The compiler is supposed to have the builtin defined _REENTRANT defined
+when -pthread is passed, which wasn't done on the ARC architecture.
+
+When _REENTRANT is not passed, the C library will not use reentrant
+functions, and the latest version of ax_pthread.m4 from the
+autoconf-archive will no longer detect that thread support is
+available (see https://savannah.gnu.org/patch/?8186).
+
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gcc/config/arc/arc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
+index 611ef54..fdd4b5d 100644
+--- a/gcc/config/arc/arc.h
++++ b/gcc/config/arc/arc.h
+@@ -93,6 +93,7 @@ along with GCC; see the file COPYING3.  If not see
+ %{mdsp-packa:-D__Xdsp_packa} %{mcrc:-D__Xcrc} %{mdvbf:-D__Xdvbf} \
+ %{mtelephony:-D__Xtelephony} %{mxy:-D__Xxy} %{mmul64: -D__Xmult32} \
+ %{mlock:-D__Xlock} %{mswape:-D__Xswape} %{mrtsc:-D__Xrtsc} \
++%{pthread:-D_REENTRANT} \
+ %{mcpu=nps400:-D__NPS400__}"
+
+ #define CC1_SPEC "\
+--
+2.7.4
+
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8eabbbc..0c73548 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -8,6 +8,8 @@ menuconfig BR2_PACKAGE_MPD
 	# 0.19.x could be built with GCC 4.6, but for simplicity we require
 	# the same toolchain dependencies for all versions.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	# ARC toolchain issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -339,3 +341,4 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
