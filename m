From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:15 +0100
Subject: [Buildroot] [PATCH 17/21] pinenty: add missing indirect dependency
	on atomics for gtk2 support
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-18-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove redundant comment lines.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pinentry/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index ae70257..350327a 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -18,13 +18,12 @@ config BR2_PACKAGE_PINENTRY_NCURSES
 
 config BR2_PACKAGE_PINENTRY_GTK2
 	bool "pinentry-gtk2"
-	# propagate libgtk2's dependencies
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	# select libgtk2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -32,17 +31,16 @@ config BR2_PACKAGE_PINENTRY_GTK2
 
 comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT4
 	bool "pinentry-qt4"
-	# propagate qt's dependencies
 	depends on !BR2_avr32 # lacks TLS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# select qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
-- 
2.1.4
