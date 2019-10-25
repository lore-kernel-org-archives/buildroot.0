From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 18:16:13 +0200
Subject: [Buildroot] [git commit] package/dbus-python: fix build with python
 3.8
Message-ID: <20191025160946.4E805868DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3559447e4a1f7916ca6ee8b592d49dc1011784ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

test/import-repeatedly.c uses an embedded python interpreter
and PYTHON_EXTRA_LIBS is used only for building this test case,
so set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
to build this test case and don't link the module with libpython3.so.

Fixes:
 - http://autobuild.buildroot.org/results/b30/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3/
 - http://autobuild.buildroot.org/results/0dd/0dd9203f859b97ee5a3b6358644c26f8ab784ed8/
   and many similar failures.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
