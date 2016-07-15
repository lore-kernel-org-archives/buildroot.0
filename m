From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:41:34 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: needs MMU
Message-ID: <20160715144151.7D68782257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2eed71c0d02d48367ad6bb362c040e881040800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... because it uses fork().

Fixes:
    http://autobuild.buildroot.org/results/9ae/9ae5c773e62bbe84f2d0495f074d659fa3dcd55b/
    http://autobuild.buildroot.org/results/8af/8afb9f96bb827b723b859ff73cdf674ca6434e7c/
    http://autobuild.buildroot.org/results/abe/abe9be3b78f26f56035ec805a86ab33b1d145a02/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: propagate to the Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 3218205..e17330c 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
-	select BR2_PACKAGE_LIBMPDCLIENT
-	select BR2_PACKAGE_LIBUPNPP
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	select BR2_PACKAGE_LIBMPDCLIENT
+	select BR2_PACKAGE_LIBUPNPP
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
@@ -13,4 +14,5 @@ config BR2_PACKAGE_UPMPDCLI
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
