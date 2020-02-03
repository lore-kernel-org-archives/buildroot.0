From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:33 +0100
Subject: [Buildroot] [git commit] package/gnuradio: add python3 support
Message-ID: <20200203223239.EB8D88143E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f063a1a51b751f9d67d40d6fc981e9b3c5f4c59e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnuradio 3.8.0.0 support both python2 and python3.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in   | 4 +---
 package/gnuradio/gnuradio.mk | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 72458f0961..6d438bcd6f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,6 +1,5 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -14,7 +13,6 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
@@ -65,7 +63,7 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index a1dbb78e6e..41d4619f72 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -13,6 +13,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
 	host-python-mako \
 	host-python-six \
 	host-swig \
@@ -107,7 +108,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python
+GNURADIO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
