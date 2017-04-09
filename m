From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:30:25 +0200
Subject: [Buildroot] [git commit] libselinux: allow compiling python wrapper
	module for target
Message-ID: <20170409134130.34FE6826C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb77bd3dabe1fc2d0fa9ef0f8967e25eb550c9fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux currently does not compile its python wrapper module for
the target. This is needed for audit2allow to function properly, and
therefore this patch adjusts libselinux.mk to install the python
wrapper module is python or python3 are enabled.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - Remove useless empty lines, as noted by Matt Weber
 - Move code related to python bindings before builds/install
   commands, since those commands will use variables defined by the
   python bindings logic.
 - Instead of enabling the python bindings when
   BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW is set, enable the python
   bindings when python is available. We generally try to avoid
   looking at options of other packages to decide what to install.
 - Introduce LIBSELINUX_MAKE_TARGETS and
   LIBSELINUX_MAKE_INSTALL_TARGETS variable, in order to avoid
   duplicate the make/make install commands.
 - As suggested by Matt Weber, remove LIBSELINUX_PYTHONLIBDIR
   definitions, and don't pass PYLIBVER and PYTHONLIBDIR in MAKE_OPTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/libselinux.mk | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 6bf1b43..ca7836f 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -20,16 +20,41 @@ LIBSELINUX_MAKE_OPTS = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
+LIBSELINUX_MAKE_TARGETS = all
+LIBSELINUX_MAKE_INSTALL_TARGETS = install
+
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSELINUX_DEPENDENCIES += python3 host-swig
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
+LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+LIBSELINUX_DEPENDENCIES += python host-swig
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
+LIBSELINUX_MAKE_OPTS += \
+	PYINC="$(LIBSELINUX_PYINC)" \
+	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+LIBSELINUX_MAKE_TARGETS += swigify pywrap
+LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
+endif # python || python3
+
 define LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
+		$(LIBSELINUX_MAKE_TARGETS)
 endef
 
 define LIBSELINUX_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
+		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
 endef
 
 define LIBSELINUX_INSTALL_TARGET_CMDS
