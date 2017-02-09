From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:27:36 +0100
Subject: [Buildroot] [git commit] package/mpd: affected by GCC PR
	libstdc++/64735
Message-ID: <20170209202747.600D3821EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e65c9acf60b614baaed66156cdc2cd3f3dfc03b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPD uses `exception_ptr` from libstdc++ which is not available for
architectures affected by GCC PR libstdc++/64735.

Fixes:
http://autobuild.buildroot.net/results/552/552e0c4d6482b60045a91fd398c4ffecd8877cce/
http://autobuild.buildroot.net/results/4d3/4d384950b6dba21163bdcd7721ddad133beeb72b/
http://autobuild.buildroot.net/results/842/842e992315dd78765938e6b629386a18fa9bb00c/
.. and many more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9b22f68..8a28b4f 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -5,6 +5,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -319,3 +320,6 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+comment "mpd needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
