From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:18:12 +0200
Subject: [Buildroot] [git commit] libselinux: adjust build of Python bindings
Message-ID: <20170413201821.33E3E826E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c160a3ca4c9677f67f85acb33634421673836c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to work-around dependency issues, the Python bindings should be
built though a separate make invocation from the rest of the
library. This avoids build issues like this:

selinux_restorecon.lo: file not recognized: File truncated
[...]
collect2: error: ld returned 1 exit status
make[2]: *** [libselinux.so.1] Error 1

Fixes:

  http://autobuild.buildroot.net/results/967b74d0ae5b4b83ea2729217b005a3e1e4514d0/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/libselinux.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index ca7836f..b6c5809 100644
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
+# dependencies are broken and result in file truncation errors at link
+# time if the Python bindings are built through the same make
+# invocation as the rest of the library.
+define LIBSELINUX_BUILD_PYTHON_BINDINGS
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
+	$(LIBSELINUX_BUILD_PYTHON_BINDINGS)
 endef
 
 define LIBSELINUX_INSTALL_STAGING_CMDS
