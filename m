From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 12 Apr 2017 23:16:12 -0500
Subject: [Buildroot] [PATCH 1/3] libselinux: target python interface
	generation
Message-ID: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed a consistancy issue between toolchain revisions.
Moves the swig and pywrap step seperate from the overall
build "all".

Resolves:
http://autobuild.buildroot.net/results/967/967b74d0ae5b4b83ea2729217b005a3e1e4514d0/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libselinux/libselinux.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index ca7836f..7e92de6 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -20,7 +20,6 @@ LIBSELINUX_MAKE_OPTS = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
-LIBSELINUX_MAKE_TARGETS = all
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
 
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
@@ -39,16 +38,23 @@ LIBSELINUX_MAKE_OPTS += \
 	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
 	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
 
-LIBSELINUX_MAKE_TARGETS += swigify pywrap
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
+
+# dependencies are broken and result in file
+# truncation errors at library link if the
+# make targets are added to the existing BUILD_CMD
+define LIBSELINUX_BUILD_PYTHON_INTERFACE_
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) swigify pywrap
+endef
 endif # python || python3
 
 define LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
-		$(LIBSELINUX_MAKE_TARGETS)
+		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+	$(LIBSELINUX_BUILD_PYTHON_INTERFACE)
 endef
 
 define LIBSELINUX_INSTALL_STAGING_CMDS
-- 
1.9.1
