From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 23:56:13 +0100
Subject: [Buildroot] [git commit] package/ima-evm-utils: new package
Message-ID: <20191029225732.8900A8D6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8229196d41dbe0d7988b4f533a45e2b73efc160e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/ima-evm-utils/Config.in          | 15 +++++++++++++++
 package/ima-evm-utils/ima-evm-utils.hash |  3 +++
 package/ima-evm-utils/ima-evm-utils.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f6b768e0d..cdd44be37c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1892,6 +1892,7 @@ N:	Petr Kulhavy <brain@jikos.cz>
 F:	package/linuxptp/
 
 N:	Petr Vorel <petr.vorel@gmail.com>
+F:	package/ima-evm-utils/
 F:	package/iproute2/
 F:	package/iputils/
 F:	package/linux-backports/
diff --git a/package/Config.in b/package/Config.in
index ae1c5013b6..dc5ec56d6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2170,6 +2170,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/ima-evm-utils/Config.in"
 	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
new file mode 100644
index 0000000000..851e2456bc
--- /dev/null
+++ b/package/ima-evm-utils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IMA_EVM_UTILS
+	bool "ima-evm-utils"
+	depends on BR2_USE_MMU # keyutils
+	depends on !BR2_STATIC_LIBS # keyutils
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_KEYUTILS
+	help
+	  Linux Integrity Measurement Architecture (IMA)
+	  Extended Verification Module (EVM) tools.
+
+	  https://sourceforge.net/p/linux-ima/wiki/Home/
+
+comment "ima-evm-utils needs dynamic library support"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
new file mode 100644
index 0000000000..24be627d20
--- /dev/null
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 ad8471b58c4df29abd51c80d74b1501cfe3289b60d32d1b318618a8fd26c0c0a  ima-evm-utils-1.2.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
new file mode 100644
index 0000000000..b944eda13c
--- /dev/null
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# ima-evm-utils
+#
+################################################################################
+
+IMA_EVM_UTILS_VERSION = 1.2.1
+IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
+IMA_EVM_UTILS_LICENSE = GPL-2.0
+IMA_EVM_UTILS_LICENSE_FILES = COPYING
+IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl
+
+# Tarball doesn't contain configure
+IMA_EVM_UTILS_AUTORECONF = YES
+
+# Build and install in the src subdirectory. This avoids building the
+# documentation, which requires asciidoc and xsltproc. Note that configure still
+# needs to be run from the top dir, so _SUBDIR can't be used.
+
+define IMA_EVM_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src all
+endef
+
+define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
+endef
+
+define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
+endef
+
+$(eval $(autotools-package))
