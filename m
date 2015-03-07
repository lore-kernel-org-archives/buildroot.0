From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 15:18:40 +0000
Subject: [Buildroot] [PATCH V3 1/2] tcl: add support for static builds
Message-ID: <1425741521-63914-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tcl fails to build statically for two reasons. The first one is because
it tries to build the tclsh binary with dynamic loading support, which
uses dlopen() and friends. This is because the '--enable-load' configure
option is 'on' by default. The second one is because it builds the
'packages' by default. These 'packages' are shared objects which are
intended to be loaded dynamically.

In order to fix this, we add '--disable-load' to the configure options
and avoid building the 'packages' when BR2_STATIC_LIBS is set.

Related upstream mailing list thread:

  http://sourceforge.net/p/tcl/mailman/message/33388034/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes V2 -> V3: nothing
Changes V1 -> V2: Remove HOST_TCL stuff

 package/tcl/tcl.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 1ebba1e..0c328ee 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -29,6 +29,18 @@ HOST_TCL_CONF_OPTS = \
 	--disable-langinfo \
 	--disable-framework
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# Do not build tclsh with dynamic loading support when building it
+# statically because it needs dlopen() and friends.
+TCL_CONF_OPTS += --disable-load
+# Also, build only the binaries and libraries and don't build the
+# 'packages' because they are shared objects which are intended to be
+# loaded dynamically.
+TCL_MAKE_OPTS = binaries libraries
+TCL_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-binaries install-libraries
+TCL_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
+endif
+
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-- 
1.7.1
