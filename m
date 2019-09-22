From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:18 +0200
Subject: [Buildroot] [PATCH 02/30] package/policycoreutils: drop
 host-python(3) dependency for host-policycoreutils
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since SELinux 2.7, the python tools that used to be in policycoreutils
have been moved into a separate package, called "python" in upstream
SELinux, and "selinux-python" in Buildroot. Therefore, we can drop the
host-python(3) dependency from host-policycoreutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index b117aa6902..4f7176777c 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -73,22 +73,10 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	PYTHON="$(HOST_DIR)/bin/python" \
-	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
 	ARCH="$(HOSTARCH)" \
 	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
-HOST_POLICYCOREUTILS_MAKE_OPTS += \
-	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
-else
-HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
-HOST_POLICYCOREUTILS_MAKE_OPTS += \
-	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
-endif
-
 # Note: We are only building the programs required by the refpolicy build
 HOST_POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
-- 
2.21.0
