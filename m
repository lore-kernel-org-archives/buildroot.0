From: Olivier Dautricourt <olivier.dautricourt@orolia.com>
Date: Mon, 24 Aug 2020 12:17:02 +0200
Subject: [Buildroot] [V2] package/gpsd: install gps Python library
Message-ID: <20200824101702.46380-1-olivier.dautricourt@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The scons script will install the gps library in the target python3
directory, as well as useful tools like ubxtool.
No build time python dependency is required to build the library:
the *.py files are copied directly in the site-packages directory.

Signed-off-by: Olivier Dautricourt <olivier.dautricourt@orolia.com>
---
 package/gpsd/gpsd.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 62c4c611c3..26a8229d0d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -23,7 +23,6 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	python=no \
 	qt=no \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
@@ -72,6 +71,14 @@ GPSD_SCONS_OPTS += dbus_export=yes
 GPSD_DEPENDENCIES += dbus-glib
 endif
 
+# If python3 is enabled, install the gps python library
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GPSD_SCONS_OPTS += python=yes
+GPSD_SCONS_OPTS += python_libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
+else
+GPSD_SCONS_OPTS += python=no
+endif
+
 # Protocol support
 ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
 GPSD_SCONS_OPTS += ashtech=no
-- 
2.25.1
