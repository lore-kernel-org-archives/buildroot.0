From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Jun 2018 16:43:15 +0200
Subject: [Buildroot] [PATCH 1/1] librtas: bump to version 2.0.1
Message-ID: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github
- Move to autotools infrastructure
- Remove patch (not needed anymore)
- Since version 1.4 (January 2016), license is now LGPL-2.1+
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-librtas-install-librtas.so.1-symlink.patch | 31 ----------------------
 package/librtas/librtas.hash                       |  3 ++-
 package/librtas/librtas.mk                         | 24 +++++------------
 3 files changed, 9 insertions(+), 49 deletions(-)
 delete mode 100644 package/librtas/0001-librtas-install-librtas.so.1-symlink.patch

diff --git a/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch b/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
deleted file mode 100644
index 2150c3f508..0000000000
--- a/package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Add a line to the librtas Makefile to create librtas.so.1 when
-performing "make install".
-
-Without this patch programs linked with librtas will fail at run time:
-
-error while loading shared libraries: librtas.so.1: cannot open shared
-object file: No such file or directory
-
-A patch has been submitted upstream so it is likely that this patch
-can be dropped after the next release of librtas.
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- librtas_src/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librtas_src/Makefile b/librtas_src/Makefile
-index 3a10222..deba29d 100644
---- a/librtas_src/Makefile
-+++ b/librtas_src/Makefile
-@@ -33,6 +33,7 @@ install:
- 	@$(call install_lib,$(LIBRTAS),$(DESTDIR))
- 	@$(call install_inc,$(HEADERS),$(DESTDIR))
- 	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME)
-+	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME).1
- 
- uninstall:
- 	@$(call uninstall_lib,$(LIBRTAS),$(DESTDIR))
--- 
-1.7.10.4
-
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index c81b583147..0f3d902226 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d5f2951b0934ffbd82bebf26acfa103cc21d89f4c90c7c41472acf7b4ec6d907 librtas-1.3.13.tar.gz
+sha256 a79fd9cdb2f03e7401027fb80a07f14e29b86cc2d363126d527b211fea85d025 librtas-v2.0.1.tar.gz
+sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index 46c4cb4bb7..f89394a6af 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,22 +4,12 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 1.3.13
-LIBRTAS_SITE = http://downloads.sourceforge.net/project/librtas
-LIBRTAS_LICENSE = Common Public License Version 1.0
-LIBRTAS_LICENSE_FILES = COPYRIGHT
+LIBRTAS_VERSION = v2.0.1
+LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,$(LIBRTAS_VERSION))
+LIBRTAS_LICENSE = LGPL-2.1+
+LIBRTAS_LICENSE_FILES = COPYING.LESSER
 LIBRTAS_INSTALL_STAGING = YES
+# From git
+LIBRTAS_AUTORECONF = YES
 
-define LIBRTAS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-define LIBRTAS_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
-endef
-
-define LIBRTAS_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.14.1
