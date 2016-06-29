From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:17 +0200
Subject: [Buildroot] [PATCH 10/24] libsemanage: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-11-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libsemanage/libsemanage.mk | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e4229a..3b01d510989f 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -27,36 +27,4 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
-				host-ustr host-bzip2 host-swig
-HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
-HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/" \
-	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
-else
-HOST_LIBSEMANAGE_DEPENDENCIES += host-python
-HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
-	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
-endif
-
-define HOST_LIBSEMANAGE_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
-	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
-endef
-
-define HOST_LIBSEMANAGE_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
-	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.1.0
