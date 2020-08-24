From: Olivier Dautricourt <olivier.dautricourt@orolia.com>
Date: Mon, 24 Aug 2020 10:04:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/gpsd: add GPSD_PYTHON config option
In-Reply-To: <20200824080449.10036-1-olivier.dautricourt@orolia.com>
References: <20200824080449.10036-1-olivier.dautricourt@orolia.com>
Message-ID: <20200824080449.10036-2-olivier.dautricourt@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The scons script will install the gps library in the target python3
directory, as well as useful tools like ubxtool.

Signed-off-by: Olivier Dautricourt <olivier.dautricourt@orolia.com>
---
 package/gpsd/Config.in | 5 +++++
 package/gpsd/gpsd.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5dd57c34b8..39054098ba 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -229,4 +229,9 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "Python library"
+	help
+	  gps Python library
+
 endif
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 62c4c611c3..d2e5d57ca8 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -23,7 +23,6 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	python=no \
 	qt=no \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
@@ -186,6 +185,12 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
+ifeq ($(BR2_PACKAGE_GPSD_PYTHON), y)
+GPSD_SCONS_OPTS += python=yes
+GPSD_SCONS_OPTS += python_libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
+else
+GPSD_SCONS_OPTS += python=no
+endif
 
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
-- 
2.25.1
