From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 12 May 2015 14:12:08 +1000
Subject: [Buildroot] [PATCH v2 2/2] powerpc-utils: optionally use librtas
In-Reply-To: <cover.1431403924.git.sam.bobroff@au1.ibm.com>
References: <cover.1431403924.git.sam.bobroff@au1.ibm.com>
Message-ID: <4a40d63bb8a0fdf9a3dc8811a62dc7872fcddd87.1431403924.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that librtas is available, optionally use it with powerpc-utils to
enable it's RTAS dependant functionality.  It is used by default, as
most distros do, but made optional because it adds several new programs
and significantly increases the size of the installed package.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
v2:

Make librtas support in powerpc-utils optional due to size concerns.

 package/powerpc-utils/Config.in        |   18 ++++++++++++++++++
 package/powerpc-utils/powerpc-utils.mk |    5 +++++
 2 files changed, 23 insertions(+)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index eded41e..8b3e3d1 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -6,3 +6,21 @@ config BR2_PACKAGE_POWERPC_UTILS
 	  System utilities for PowerPC machines.
 
 	  http://sourceforge.net/projects/powerpc-utils/
+
+if BR2_PACKAGE_POWERPC_UTILS
+
+config BR2_PACKAGE_POWERPC_UTILS_RTAS
+	bool "RTAS support"
+	select BR2_PACKAGE_LIBRTAS
+	default y
+	help
+	  Enable support for functions that require RTAS.
+
+	  This adds a dependency on librtas and provides the following
+	  additional features at the cost of increasing the installed package
+	  size from about 0.5MB to about 2MB:
+	  ppc64_cpu --run-mode, uesensor, set_poweron_time, drmgr, lsslot,
+	  activate_firmware, rtas_ibm_get_vpd, serv_config,
+	  rtas_event_decode, sys_ident.
+
+endif
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 3b30458..486ed20 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -7,10 +7,15 @@
 POWERPC_UTILS_VERSION = 1.2.24
 POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
 POWERPC_UTILS_DEPENDENCIES = zlib
+ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
+POWERPC_UTILS_DEPENDENCIES += librtas
+endif
 POWERPC_UTILS_LICENSE = Common Public License Version 1.0
 POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
 
+ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),)
 POWERPC_UTILS_CONF_OPTS = --without-librtas
+endif
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
-- 
1.7.10.4
