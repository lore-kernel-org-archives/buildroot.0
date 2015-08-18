From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 13:14:48 +0200
Subject: [Buildroot] [git commit] package/mosh: fix dependencies
Message-ID: <20150818111528.61D6181D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fa58ed79b83d61f250cba65a85df096c2a6f447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosh selects protobuf, so it needs to propagate *all* its dependencies.

Fixes:
    http://autobuild.buildroot.org/results/1e7/1e7d28018252fa48ee1ccd68d0a21afb3e0f072f/
    http://autobuild.buildroot.org/results/a91/a91ea29454a6f8eefc0bf4f0eb137dd8e061f028/
    http://autobuild.buildroot.org/results/ecb/ecb67c1d1b04a79ad9fbe4a09121ec492fe1501c/
    [...]

[Thomas: add missing C++ comment.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosh/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 4ad7d61..f4c1466 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,11 +1,12 @@
-comment "mosh needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "mosh needs a toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
 
 config BR2_PACKAGE_MOSH
 	bool "mosh"
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS #protobuf
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
