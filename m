From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] powerpc-utils: optionally use
	librtas
Message-ID: <20150808105630.D701280414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80a34ce7f1a2ab1128140c497322a2d894dd7af0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that librtas is available, optionally use it with powerpc-utils to
enable it's RTAS dependant functionality.  It is used by default, as
most distros do, but made optional because it adds several new programs
and significantly increases the size of the installed package.

[Thomas: propagate the glibc dependency from the librtas package, as
suggested by Romain Naour.]

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powerpc-utils/Config.in        |   22 ++++++++++++++++++++++
 package/powerpc-utils/powerpc-utils.mk |    8 +++++++-
 2 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index eded41e..8e02e76 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -6,3 +6,25 @@ config BR2_PACKAGE_POWERPC_UTILS
 	  System utilities for PowerPC machines.
 
 	  http://sourceforge.net/projects/powerpc-utils/
+
+if BR2_PACKAGE_POWERPC_UTILS
+
+config BR2_PACKAGE_POWERPC_UTILS_RTAS
+	bool "RTAS support"
+	select BR2_PACKAGE_LIBRTAS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	default y
+	help
+	  Enable support for functions that require RTAS.
+
+	  This adds a dependency on librtas and provides the following
+	  additional features at the cost of increasing the installed
+	  package size from about 0.5MB to about 2MB:
+	  ppc64_cpu --run-mode, uesensor, set_poweron_time, drmgr,
+	  lsslot, activate_firmware, rtas_ibm_get_vpd, serv_config,
+	  rtas_event_decode, sys_ident.
+
+comment "RTAS support needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+endif
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 3b30458..ae4d662 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -10,8 +10,14 @@ POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_LICENSE = Common Public License Version 1.0
 POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
 
-POWERPC_UTILS_CONF_OPTS = --without-librtas
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
+ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
+POWERPC_UTILS_DEPENDENCIES += librtas
+POWERPC_UTILS_CONF_OPTS = --with-librtas
+else
+POWERPC_UTILS_CONF_OPTS = --without-librtas
+endif
+
 $(eval $(autotools-package))
