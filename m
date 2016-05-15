From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:22:20 +0200
Subject: [Buildroot] [git commit] gmrender-resurrect: disable on musl
	configurations
Message-ID: <20160515192224.4B3B3818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e1174c2689a73707c64c55d88d2e5dcd8379bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gmrender-resurrect uses <error.h>, which isn't available on musl
configuration, so let's disable this package in such situations.

Fixes:

  http://autobuild.buildroot.net/results/96a280a8115cd01d64670e4caf2471d3ee4581d9/
  (and numerous similar build failures)

Cc: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmrender-resurrect/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index db655ad..1a46225 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2, libupnp
 	depends on BR2_USE_MMU # gstreamer1
+	# uses <error.h>
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
 	select BR2_PACKAGE_LIBUPNP
@@ -11,6 +13,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 
 	  https://github.com/hzeller/gmrender-resurrect
 
-comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
+comment "gmrender-resurrect needs an (e)glibc or uClibc toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_MUSL
