From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 25 Oct 2020 23:24:57 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/gpsd: enable python support and
 modules
In-Reply-To: <20201025202457.1009025-1-geomatsi@gmail.com>
References: <20201025202457.1009025-1-geomatsi@gmail.com>
Message-ID: <20201025202457.1009025-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option that enables gpsd python support including modules, tools,
and gpsfake test harness. If python is enabled then install python
modules unconditionally. Note that gpsd python modules run compatibly
under Python 2 and 3.x for x >= 2. So enable gpsd python support when
any Python version is enabled in board configuration. If no Python is
enabled, but gpsd Python support is requested, then select Python 3.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/gpsd/Config.in | 10 ++++++++++
 package/gpsd/gpsd.mk   | 13 ++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5dd57c34b8..e63c3d66b9 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -79,6 +79,16 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "build Python support and modules"
+	depends on BR2_USE_WCHAR # python
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Python libraries and tools for the gpsd service daemon including gpsfake test harness.
+
+comment "GPSD python support not available with toolchain w/o wide characters support"
+	depends on !BR2_USE_WCHAR
+
 comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 62c4c611c3..c51d4768d4 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -23,7 +23,6 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	python=no \
 	qt=no \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
@@ -186,6 +185,18 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+	GPSD_SCONS_OPTS += \
+		python=yes \
+		python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+	GPSD_SCONS_OPTS += \
+		python=yes \
+		python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+else
+	GPSD_SCONS_OPTS = \
+		python=no
+endif
 
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
-- 
2.29.1
