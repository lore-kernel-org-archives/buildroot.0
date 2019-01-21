From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:51:03 +0100
Subject: [Buildroot] [PATCH v4 09/17] package/gqrx: remove unneeded fftw
 dependency
In-Reply-To: <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks to the new fftw package organization, gnuradio already selects
the appropriate fftw precision, and there is no need to propagate the
"depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE" that used to be present
in the gnuradio package.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
 * use select instead of depends on for GNURadio and propagates
   dependencies.(yann)
---
 package/gqrx/Config.in | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 1dc40c6d24..b55b5740ad 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,22 +1,25 @@
-comment "gqrx needs a toolchain w/ C++, threads, wchar"
+comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_USE_MMU # gnuradio
+	depends on !BR2_PACKAGE_PYTHON3 # gnuradio
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
 
-comment "gqrx needs qt5, gnuradio, fftw's single precision"
-	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
-		!BR2_PACKAGE_QT5
+comment "gqrx needs qt5"
+	depends on !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
-	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
-	depends on BR2_PACKAGE_GNURADIO
 	depends on BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on !BR2_STATIC_LIBS # gnuradio
+	depends on BR2_USE_MMU # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_ANALOG
 	select BR2_PACKAGE_GNURADIO_AUDIO
 	select BR2_PACKAGE_GNURADIO_BLOCKS
-- 
2.19.2
