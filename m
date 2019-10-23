From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 23 Oct 2019 21:19:21 +0000
Subject: [Buildroot] [PATCH] package/dbus-python: Fix build with python 3.8
Message-ID: <20191023211924.950430-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

test/import-repeatedly.c uses an embedded python interpreter
and PYTHON_EXTRA_LIBS is used only for building this test case,
so set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
to build this test case and don't link the module with libpython3.so.

Fixes:
 - http://autobuild.buildroot.org/results/b30/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3/
 - http://autobuild.buildroot.org/results/0dd/0dd9203f859b97ee5a3b6358644c26f8ab784ed8/
   and many similar failures.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
Changes v1 -> v2:
 - Set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
   instead of appending --embed to PYTHON_LIBS
---
 package/dbus-python/dbus-python.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index eaf4e5f483..d48208f1d1 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -35,14 +35,16 @@ DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
+	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
 
 HOST_DBUS_PYTHON_DEPENDENCIES += host-python3
 
 HOST_DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`"
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`" \
+	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/usr/bin/python3-config --libs --embed`"
 endif
 
 $(eval $(autotools-package))
-- 
2.23.0
