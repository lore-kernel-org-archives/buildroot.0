From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 19:20:03 +0100
Subject: [Buildroot] [PATCH 2/2] efl: disallow on non-MMU systems
In-Reply-To: <1393093203-12370-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393093203-12370-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393093203-12370-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libeina library uses the madvise() system call, that isn't
available on non-MMU systems. Also, several other components of EFL
use fork(). Therefore, the easiest solution is to simply disallow the
EFL as a whole on non-MMU systems.

Fixes:

  http://autobuild.buildroot.org/results/ad9/ad90baa5e07569308a7e2b2510b67c5b2a563b44//

Thanks to Ryan Barnett for helping in the investigation!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in           | 2 ++
 package/enlightenment/Config.in | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 36afd1a..3d31a26 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,6 +1,8 @@
 menuconfig BR2_PACKAGE_EFL
 	bool "Enlightenment Foundation Libraries"
 	depends on BR2_USE_WCHAR
+	# libeina uses madvise(). To revisit when bumping EFL to 1.8
+	depends on BR2_USE_MMU
 	help
 	  Enlightenment Foundation Libraries
 
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 43efe58..f34140b 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	# libedbus -> dbus
 	# libedbus -> glib2, libevas
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# libedbus -> dbus
+	# libedbus -> dbus, efl libraries
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_avr32 # libevas
-- 
1.8.3.2
