From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  5 Sep 2019 15:40:42 +0200
Subject: [Buildroot] [PATCH] package:gnuradio: move to python3
In-Reply-To: <1567690842-33954-2-git-send-email-gwenj@trabucayre.com>
References: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
 <1567690842-33954-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <1567690842-33954-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gnuradio 3.8.0.0 support both python2 and python3 but python2 is EOL, so move
explicitly to python3.
- depends on python3 to avoid issues with mako at the build time
- add full path to python3 interpreter
- by default gnuradio install python libraries in dist-packages. To force
  installation in site-packages add GR_PYTHON_DIR in CONF_OPTS
- when python support is enabled python-six is mandatory at runtime

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 7 ++++---
 package/gnuradio/gnuradio.mk | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index f07bd3d976..85728fa870 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,6 +1,6 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -11,7 +11,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
@@ -61,11 +61,12 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Enable python component
 
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 162d0c0311..9bdc7dd5fb 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -25,6 +25,7 @@ GNURADIO_DEPENDENCIES += orc
 endif
 
 GNURADIO_CONF_OPTS = \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)m \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
@@ -118,8 +119,9 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python
+GNURADIO_DEPENDENCIES += python3 python-six
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
+GNURADIO_CONF_OPTS += -DGR_PYTHON_DIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
-- 
2.21.0
