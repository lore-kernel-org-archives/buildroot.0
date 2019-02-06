From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/gqrx: remove unneeded fftw
 dependency
Message-ID: <20190206091325.697A881387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7795cc7e645542c3218f4f6e66b7dde7cce12cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the new fftw package organization, gnuradio already selects
the appropriate fftw precision, and there is no need to propagate the
"depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE" that used to be present
in the gnuradio package.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: reorder "depends on" as suggested by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gqrx/Config.in | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 1dc40c6d24..a46409e333 100644
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
-	depends on BR2_PACKAGE_QT5
+	depends on BR2_USE_MMU # gnuradio
+	depends on !BR2_STATIC_LIBS # gnuradio
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_ANALOG
 	select BR2_PACKAGE_GNURADIO_AUDIO
 	select BR2_PACKAGE_GNURADIO_BLOCKS
