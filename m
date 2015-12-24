From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 09:16:37 +0100
Subject: [Buildroot] [git commit] tpm-tools: new package
Message-ID: <20151224081812.E0582826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ef0ef352c1edda0a7df482e9bd84543e827cc92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - move from Libraries/Crypto to System tools in menuconfig
 - add patch to fix build with uClibc
 - use 'select' for openssl rather than a 'depends on'
 - propagate trousers dependencies
 - add <pkg>_LICENSE and <pkg>_LICENSEFILES
 - link against libiconv when needed, fixing !locale builds
 - explicitly disable pkcs11 support, since it is not handled by
   tpm-tools.mk currently.]

Signed-off-by: Al West <al.west@v-nova.com>
Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ..._nvread-include-sys-stat.h-for-open-modes.patch | 33 ++++++++++++++++++++++
 package/tpm-tools/Config.in                        | 13 +++++++++
 package/tpm-tools/tpm-tools.hash                   |  3 ++
 package/tpm-tools/tpm-tools.mk                     | 21 ++++++++++++++
 5 files changed, 71 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4621739..d08ce9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1588,6 +1588,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
 endif
+	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 endmenu
diff --git a/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch b/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
new file mode 100644
index 0000000..35fd763
--- /dev/null
+++ b/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
@@ -0,0 +1,33 @@
+From 5fedfd32a226e3ac8a6022227ec2d8fc6df26901 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 24 Dec 2015 08:57:09 +0100
+Subject: [PATCH] tpm_nvread: include <sys/stat.h> for open() modes
+
+As the manual page of open(2) indicates, the <sys/stat.h> header
+should be included. Indeed, it is this header that provides the mode_t
+macros such as S_IRUSR and S_IWUSR.
+
+While the build happens to work with glibc without this included
+header, it fails with other C libraries such as uClibc, due to the
+missing inclusion.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/tpm_mgmt/tpm_nvread.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tpm_mgmt/tpm_nvread.c b/src/tpm_mgmt/tpm_nvread.c
+index 35fe17c..92f047c 100644
+--- a/src/tpm_mgmt/tpm_nvread.c
++++ b/src/tpm_mgmt/tpm_nvread.c
+@@ -23,6 +23,7 @@
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <sys/stat.h>
+ 
+ #include "tpm_nvcommon.h"
+ #include "tpm_tspi.h"
+-- 
+2.6.4
+
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
new file mode 100644
index 0000000..d54be3e
--- /dev/null
+++ b/package/tpm-tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TPM_TOOLS
+	bool "tpm-tools"
+	select BR2_PACKAGE_TROUSERS
+	select BR2_PACKAGE_OPENSSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
+	depends on !BR2_STATIC_LIBS # trousers
+	help
+	  Tools to manage and diagnose a TPM
+
+	  http://trousers.sourceforge.net/
+
+comment "tpm-tools needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
new file mode 100644
index 0000000..8c1ff89
--- /dev/null
+++ b/package/tpm-tools/tpm-tools.hash
@@ -0,0 +1,3 @@
+# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/
+sha1 f2c799ac8dc78f3537e1dbe4ae7c6e93f37e868c tpm-tools-1.3.8.tar.gz
+md5  85a978c4e03fefd4b73cbeadde7c4d0b         tpm-tools-1.3.8.tar.gz
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
new file mode 100644
index 0000000..20df489
--- /dev/null
+++ b/package/tpm-tools/tpm-tools.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# tpm-tools
+#
+##############################################################
+
+TPM_TOOLS_VERSION = 1.3.8
+TPM_TOOLS_SOURCE = tpm-tools-$(TPM_TOOLS_VERSION).tar.gz
+TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)
+TPM_TOOLS_STRIP_COMPONENTS = 2
+TPM_TOOLS_LICENSE = Common Public License Version 1.0
+TPM_TOOLS_LICENSE_FILES = LICENSE
+TPM_TOOLS_DEPENDENCIES = trousers openssl
+
+TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+TPM_TOOLS_CONF_ENV += LIBS='-liconv'
+endif
+
+$(eval $(autotools-package))
