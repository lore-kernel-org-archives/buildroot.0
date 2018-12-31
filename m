From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:58:00 +0100
Subject: [Buildroot] [git commit] package/pulseview: propagate
 BR2_ENABLE_LOCALE dependency of libsigrok
Message-ID: <20181231145345.A6409882E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd8c0588319506518e67966e9f3dcc8ebfe65ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 922b82bde9d554237769c21e50f6c5b4f73f41a8 ("libsigrok:
bump version to 0.5.1"), libsigrok depends on BR2_ENABLE_LOCALE, but
this dependency was not propagated to pulseview. This commit fixes
this issue.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseview/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index a42fdcd879..01e522e1c5 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on !BR2_STATIC_LIBS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5BASE_WIDGETS
@@ -25,8 +26,9 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ wchar, threads, dynamic library, C++, gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE
