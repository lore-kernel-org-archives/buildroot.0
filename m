From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  3 Apr 2017 21:06:11 -0500
Subject: [Buildroot] [PATCH 1/1] libselinux: query for python site-packages
	dir directly
Message-ID: <1491271571-21770-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the bump to version 2.6, the following commit needs
to be taken into consideration for overloading paths.
https://github.com/SELinuxProject/selinux/commit/8162f10e670da963eb65ccf1e7de69ea85aba30d

The PYLIBVER is no longer used and the PYTHONLIBDIR is
renamed to PYSITEDIR with slightly different pathing.

More details can be found in the issue ticket which was
marked as a non-issue after analysis that a Buildroot fix
was the resolution.
https://github.com/SELinuxProject/selinux/issues/51

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libselinux/libselinux.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 44120c4..6bf1b43 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -46,12 +46,10 @@ HOST_LIBSELINUX_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
-HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 HOST_LIBSELINUX_DEPENDENCIES += host-python
-HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
@@ -60,8 +58,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
-	PYTHONLIBDIR="$(HOST_LIBSELINUX_PYTHONLIBDIR)" \
-	PYLIBVER="$(HOST_LIBSELINUX_PYLIBVER)" \
+	PYSITEDIR="$(HOST_DIR)/usr/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
 	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
 
 define HOST_LIBSELINUX_BUILD_CMDS
-- 
1.9.1
