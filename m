From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:04 -0000
Subject: [Buildroot] [git commit branch/next] librtas: new package
Message-ID: <20150808105630.CCA827FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10e10f128d87d125be0d10ad089b98a42156612c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - make the package depend on glibc, since it needs execinfo.h
  - use TARGET_CONFIGURE_OPTS instead of defining manually CC and LD
  - add hash file
  - remove useless empty newline.
  Thanks to Romain Naour for the review!]

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...0001-librtas-install-librtas.so.1-symlink.patch |   31 ++++++++++++++++++++
 package/librtas/Config.in                          |   13 ++++++++
 package/librtas/librtas.hash                       |    2 +
 package/librtas/librtas.mk                         |   25 ++++++++++++++++
 5 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ffa0aec..c5769d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -845,6 +845,7 @@ menu "Hardware handling"
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
index 0000000..e437fa1
--- /dev/null
+++ b/package/librtas/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBRTAS
+	bool "librtas"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The librtas package provides an interface for Run-Time Abstraction
+	  Services (RTAS) calls on PAPR platforms. The libraries allow users to
+	  examine and manipulate hardware, and parse RTAS events.
+
+	  http://librtas.sourceforge.net/
+
+comment "librtas needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
new file mode 100644
index 0000000..c81b583
--- /dev/null
+++ b/package/librtas/librtas.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d5f2951b0934ffbd82bebf26acfa103cc21d89f4c90c7c41472acf7b4ec6d907 librtas-1.3.13.tar.gz
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
new file mode 100644
index 0000000..6e1ebd1
--- /dev/null
+++ b/package/librtas/librtas.mk
@@ -0,0 +1,25 @@
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
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
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
+$(eval $(generic-package))
