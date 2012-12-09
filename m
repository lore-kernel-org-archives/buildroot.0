From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:22 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_49/51=5D_package/dtc=3A_new_packag?=
	=?utf-8?q?e?=
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-50-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dtc is the Device Tree Compiler, and manipulates device trees.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Although Arnout suggested to move it out of the libraries sub-menu,
I kept it there, as by default, only the library is installed, like
it is done for, eg., libcurl.
---
 package/Config.in                          |    1 +
 package/dtc/Config.in                      |    9 +++++++
 package/dtc/dtc-extra_cflags.patch         |   27 ++++++++++++++++++++++
 package/dtc/dtc-separate-lib-install.patch |   28 +++++++++++++++++++++++
 package/dtc/dtc.mk                         |   34 ++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 package/dtc/Config.in
 create mode 100644 package/dtc/dtc-extra_cflags.patch
 create mode 100644 package/dtc/dtc-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.mk

diff --git a/package/Config.in b/package/Config.in
index dd4cbda..1a70ab9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -412,6 +412,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
+source "package/dtc/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
new file mode 100644
index 0000000..96225e3
--- /dev/null
+++ b/package/dtc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DTC
+	bool "dtc"
+	help
+	  The Device Tree Compiler, dtc, takes as input a device-tree in
+	  a given format and outputs a device-tree in another format.
+	  
+	  Note that only the library is installed for now.
+	  
+	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
new file mode 100644
index 0000000..9d1882b
--- /dev/null
+++ b/package/dtc/dtc-extra_cflags.patch
@@ -0,0 +1,27 @@
+Makefile: append the CFLAGS to existing ones
+
+Allow the user to pass custom CFLAGS (eg. optimisation flags).
+
+Do not use EXTRA_CFLAGS, append to existing CFLAGS with +=  (Arnout)
+
+Cc: Arnout Vandecappelle <arnout@mind.be>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch not sent upstream.
+
+Although not specific to buildroot, I am not sure this is the best
+way to handle user-supplied CFLAGS.
+
+diff -durN dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile
+--- dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile	2012-10-22 22:02:47.541240846 +0200
++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
+@@ -18,7 +18,7 @@
+ CPPFLAGS = -I libfdt -I .
+ WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
+-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
++CFLAGS += -g -Os -fPIC -Werror $(WARNINGS)
+ 
+ BISON = bison
+ LEX = flex
diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/dtc-separate-lib-install.patch
new file mode 100644
index 0000000..c86d587
--- /dev/null
+++ b/package/dtc/dtc-separate-lib-install.patch
@@ -0,0 +1,28 @@
+Makefile: add a rule to only install libfdt
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch not sent upstream.
+
+It's really specific to buildroot, and is probably not
+good (aka generic) enough to be pushed upstream.
+
+diff --git a/Makefile b/Makefile
+index 1169e6c..39e7190 100644
+--- a/Makefile
++++ b/Makefile
+@@ -160,10 +160,12 @@ endif
+ # intermediate target and building them again "for real"
+ .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
+ 
+-install: all $(SCRIPTS)
++install: all $(SCRIPTS) libfdt_install
+ 	@$(VECHO) INSTALL
+ 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
++
++libfdt_install: libfdt
+ 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+ 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
new file mode 100644
index 0000000..a0e1e35
--- /dev/null
+++ b/package/dtc/dtc.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# dtc
+#
+#############################################################
+
+DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
+DTC_SITE            = git://git.jdl.com/software/dtc.git
+DTC_LICENSE         = GPLv2+/BSD-2c
+DTC_LICENSE_FILES   = README.license GPL
+# Note: the dual-license only applies to the library.
+#       The DT compiler (dtc) is GPLv2+, but we do not install it.
+DTC_INSTALL_STAGING = YES
+
+define DTC_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS)    \
+	CFLAGS="$(TARGET_CFLAGS)"   \
+	$(MAKE) -C $(@D) PREFIX=/usr libfdt
+endef
+
+#?libfdt_install is our own install rule added by our patch
+define DTC_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
+endef
+
+define DTC_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
+endef
+
+define DTC_CLEAN_CMDS
+	$(MAKE) -C $(@D) libfdt_clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
