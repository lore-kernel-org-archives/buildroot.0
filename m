From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 17 Jan 2020 12:02:30 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/gnuradio: add python3 support
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200117110232.31336-4-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gnuradio 3.8.0.0 support both python2 and python3.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * don't supress python2 support (Arnout)
 * add dependency to python2 or python3 to have correct python-mako version (Arnout)
---
 package/gnuradio/Config.in   | 2 +-
 package/gnuradio/gnuradio.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 72458f0961..c8b8d62264 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -65,7 +65,7 @@ config BR2_PACKAGE_GNURADIO_FEC
 
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
-- 
2.24.1
