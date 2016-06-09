From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:28:11 +0200
Subject: [Buildroot] [git commit] openmpi: new package
Message-ID: <20160609202842.2ABA4820E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3935440e956f2adc89fbe4977ffdcb3c518e60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas:
 - disable the tracing mechanism using --disable-vt, since it was
   causing the build failure. Avoids the need for a patch.
 - remove the option to pass arbitrary config options.
 - specify the license as being BSD-3c instead of just BSD.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/openmpi/Config.in    | 16 ++++++++++++++++
 package/openmpi/openmpi.hash |  3 +++
 package/openmpi/openmpi.mk   | 20 ++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bc114aa..f9afbc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1194,6 +1194,7 @@ menu "Networking"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
+	source "package/openmpi/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
new file mode 100644
index 0000000..9638040
--- /dev/null
+++ b/package/openmpi/Config.in
@@ -0,0 +1,16 @@
+comment "openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_OPENMPI
+	bool "openmpi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  A High Performance Message Passing Library.
+
+	  https://www.open-mpi.org/
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
new file mode 100644
index 0000000..92152a2
--- /dev/null
+++ b/package/openmpi/openmpi.hash
@@ -0,0 +1,3 @@
+# From: https://www.open-mpi.org/software/ompi/v1.10/
+md5 b2f43d9635d2d52826e5ef9feb97fd4c  openmpi-1.10.2.tar.bz2
+sha1 03934fc0a2dd0d0d2d0459d714a976eabca938fb  openmpi-1.10.2.tar.bz2
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
new file mode 100644
index 0000000..8871eaf
--- /dev/null
+++ b/package/openmpi/openmpi.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# openmpi
+#
+################################################################################
+
+OPENMPI_VERSION_MAJOR = 1.10
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).2
+OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
+OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
+OPENMPI_LICENSE = BSD-3c
+OPENMPI_LICENSE_FILES = LICENSE
+OPENMPI_INSTALL_STAGING = YES
+OPENMPI_CONF_OPTS = --disable-vt
+
+# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
+# hidden symbol to our toolchain infrastructure
+OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
+
+$(eval $(autotools-package))
