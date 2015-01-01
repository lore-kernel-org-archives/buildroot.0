From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:27:13 +0100
Subject: [Buildroot] [git commit] libsemanage: misc improvements
Message-ID: <20150101212822.A46887FA1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a963685245d4ad25b40520b251024720c3b18e11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit should have been part of the "libsemanage: new package"
commit, but due a mistake, the former commit was pushed before those
changes were squashed into it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsemanage/Config.in      |   10 +++++-----
 package/libsemanage/libsemanage.mk |   18 +++++++++---------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index e4013cd..3f4bfb7 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -16,15 +16,15 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a toolchain w/ largefile, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
-
 if BR2_PACKAGE_LIBSEMANAGE
 
 config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
-	select BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON
 	bool "python bindings"
 	help
-	  enable building python bindings
+	  Enable building python bindings
 
 endif
+
+comment "libsemanage needs a toolchain w/ largefile, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 55e5705..4813430 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -17,7 +17,7 @@ LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS),y)
 
-LIBSEMANAGE_DEPENDENCIES += python host-swig host-python
+LIBSEMANAGE_DEPENDENCIES += python host-swig
 LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
 	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
@@ -29,29 +29,29 @@ define LIBSEMANAGE_PYTHON_BUILD_CMDS
 endef
 
 define LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install-pywrap
 endef
 
 define LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install-pywrap
 endef
 
 endif # End of BR2_PACKAGE_PYTHON
 
 define LIBSEMANAGE_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and 
+	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
 	$(LIBSEMANAGE_PYTHON_BUILD_CMDS)
 endef
 
 define LIBSEMANAGE_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 	$(LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS)
 endef
 
 define LIBSEMANAGE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	$(LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS)
 endef
 
@@ -59,13 +59,13 @@ HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol \
 	host-libselinux host-ustr host-bzip2
 
 define HOST_LIBSEMANAGE_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and 
+	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE) -C $(@D) all $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
 endef
 
 define HOST_LIBSEMANAGE_INSTALL_CMDS
-	$(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
