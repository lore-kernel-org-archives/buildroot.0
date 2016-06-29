From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:25 +0200
Subject: [Buildroot] [PATCH 18/24] setools: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-19-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/setools/setools.mk | 46 ----------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 87a19cf5ae79..e837cf7119f7 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -35,50 +35,4 @@ ifeq ($(BR2_sparc64):$(BR2_STATIC_LIBS),y:)
 SETOOLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
-HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
-	host-libxml2 host-bzip2 host-bison
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_SETOOLS_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
-HOST_SETOOLS_DEPENDENCIES += host-python3
-HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON3_VERSION)
-else
-HOST_SETOOLS_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-HOST_SETOOLS_DEPENDENCIES += host-python
-HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
-endif
-
-HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
-HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
-HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
-
-# Notes: Need "disable-selinux-check" so the configure does not check to see
-#        if host has selinux enabled.
-#        Host builds with python support to enable tools for offline target
-#        policy analysis
-HOST_SETOOLS_CONF_OPTS = \
-	--disable-debug \
-	--disable-gui \
-	--disable-bwidget-check \
-	--disable-selinux-check \
-	--disable-swig-java \
-	--disable-swig-python \
-	--disable-swig-tcl \
-	--with-sepol-devel="$(HOST_DIR)/usr" \
-	--with-selinux-devel="$(HOST_DIR)/usr" \
-	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
-	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
-	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)" \
-	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"
-
-HOST_SETOOLS_CONF_ENV += \
-	am_cv_pathless_PYTHON=python \
-	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
-	am_cv_python_platform=linux2 \
-	am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION) \
-	am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
-	am_cv_python_pyexecdir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
-	am_cv_python_includes=-I$(HOST_SETOOLS_PYTHON_INCLUDES)
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
