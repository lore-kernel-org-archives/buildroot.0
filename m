From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:18:22 +0200
Subject: [Buildroot] [PATCH] fluxbox: uses fork(),
	not available on noMMU platforms
Message-ID: <1400336302-8774-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fluxbox uses the fork() system call, not available on noMMU
platforms. It's always fairly unlikely to have to use a full-blown
X.org window manager on such platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fluxbox/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index cb4d76f..ab479a9 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLUXBOX
 	bool "fluxbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	# Runtime dependency, needed by startup script
 	select BR2_PACKAGE_XAPP_XMODMAP
@@ -11,4 +12,5 @@ config BR2_PACKAGE_FLUXBOX
 	  http://fluxbox.org
 
 comment "fluxbox needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
-- 
1.9.3
