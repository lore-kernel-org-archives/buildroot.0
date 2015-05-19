From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 19 May 2015 15:59:55 +1000
Subject: [Buildroot] [PATCH v3 1/2] librtas: new package
In-Reply-To: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
Message-ID: <671713efe39467f10b56db5074d472dc45ceeec9.1432015191.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
v2:

Remove redundant INSTALL_TARGET=yes.
Add patch description and patch signed-off-by.
Rename patch with correct prefix (0001-).

 package/Config.in                                  |    1 +
 ...0001-librtas-install-librtas.so.1-symlink.patch |   31 ++++++++++++++++++++
 package/librtas/Config.in                          |    9 ++++++
 package/librtas/librtas.mk                         |   26 ++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
 create mode 100644 package/librtas/Config.in
 create mode 100644 package/librtas/librtas.mk

diff --git a/package/Config.in b/package/Config.in
index af4d2b7..51de1c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -832,6 +832,7 @@ menu "Hardware handling"
 	source "package/libphidget/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
+	source "package/librtas/Config.in"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libserialport/Config.in"
diff --git a/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch b/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
new file mode 100644
index 0000000..2150c3f
--- /dev/null
+++ b/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
@@ -0,0 +1,31 @@
+Add a line to the librtas Makefile to create librtas.so.1 when
+performing "make install".
+
+Without this patch programs linked with librtas will fail at run time:
+
+error while loading shared libraries: librtas.so.1: cannot open shared
+object file: No such file or directory
+
+A patch has been submitted upstream so it is likely that this patch
+can be dropped after the next release of librtas.
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+---
+ librtas_src/Makefile |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librtas_src/Makefile b/librtas_src/Makefile
+index 3a10222..deba29d 100644
+--- a/librtas_src/Makefile
++++ b/librtas_src/Makefile
+@@ -33,6 +33,7 @@ install:
+ 	@$(call install_lib,$(LIBRTAS),$(DESTDIR))
+ 	@$(call install_inc,$(HEADERS),$(DESTDIR))
+ 	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME)
++	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME).1
+ 
+ uninstall:
+ 	@$(call uninstall_lib,$(LIBRTAS),$(DESTDIR))
+-- 
+1.7.10.4
+
diff --git a/package/librtas/Config.in b/package/librtas/Config.in
new file mode 100644
index 0000000..bf0a705
--- /dev/null
+++ b/package/librtas/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBRTAS
+	bool "librtas"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	help
+	  The librtas package provides an interface for Run-Time Abstraction
+	  Services (RTAS) calls on PAPR platforms. The libraries allow users to
+	  examine and manipulate hardware, and parse RTAS events.
+
+	  http://librtas.sourceforge.net/
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
new file mode 100644
index 0000000..b081a91
--- /dev/null
+++ b/package/librtas/librtas.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# librtas
+#
+################################################################################
+
+LIBRTAS_VERSION = 1.3.13
+LIBRTAS_SITE = http://downloads.sourceforge.net/project/librtas
+LIBRTAS_LICENSE = Common Public License Version 1.0
+LIBRTAS_LICENSE_FILES = COPYRIGHT
+LIBRTAS_INSTALL_STAGING = YES
+
+define LIBRTAS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+endef
+
+define LIBRTAS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBRTAS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.10.4
