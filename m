From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  4 Apr 2019 20:52:28 +0200
Subject: [Buildroot] [PATCH] package/dbus-python: fix build failure due to
 wrong auto-detected extra libs
Message-ID: <20190404185228.112789-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using Python 3, during configuration, if PYTHON_EXTRA_LIBS is not
defined, ./configure will launch a python script to retrieve LIBS and
SYSLIBS variables, but this is done using host-python resulting in
obtaining libraries that are not present in target. So while trying to
link configuration test it fails complaining it can't find a
library(i.e. libintl).

Set PYTHON_EXTRA_LIBS the same as PYTHON_LIBS to be sure host libs are
not used at all.

Fixes:
http://autobuild.buildroot.net/results/4078ee9e8aa304f044dc92e9345c28341349d468/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/dbus-python/dbus-python.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d6af7454af..49f0de5455 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -25,7 +25,8 @@ DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
+	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
 endif
 
 $(eval $(autotools-package))
-- 
2.17.1
