From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:17:14 +0200
Subject: [Buildroot] [PATCH 4/4] gmrender-resurrect: disable on musl
	configurations
In-Reply-To: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463235434-31134-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gmrender-resurrect uses <error.h>, which isn't available on musl
configuration, so let's disable this package in such situations.

Fixes:

  http://autobuild.buildroot.net/results/96a280a8115cd01d64670e4caf2471d3ee4581d9/
  (and numerous similar build failures)

Cc: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
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
-- 
2.7.4
