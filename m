From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 23:19:49 +0200
Subject: [Buildroot] [git commit] package/freerdp: can not build on uClibc
Message-ID: <20140928212210.3E1E69D6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=937fbdaa8d45f6ed4bb7f440d680d69a65ff390a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP uses eventfd_{read,write}, which is not supported in uClibc.

Fixes:
    http://autobuild.buildroot.net/results/ad7/ad7ade4c436d21cba930f40c613870fbadec840e/
    http://autobuild.buildroot.net/results/5a3/5a30aecbb426f76a22e8285931a0a8cd59b5e70b/
    http://autobuild.buildroot.net/results/6e0/6e0de0538e95ae156f7d2ad6eede46e44be81c8e/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index c5ff769..2a876b2 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -7,8 +7,13 @@ config BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # evenft_{read,write}
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
 	  http://www.freerdp.com/
+
+comment "freerdp needs an (e)glibc or musl toolchain"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
