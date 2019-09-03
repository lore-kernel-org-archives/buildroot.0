From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/openipmi: bump to version 2.0.27
Message-ID: <20190903133620.8910C8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c63dc23b87724635b0d90aad1a52b337f5e95d99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bundled editline has been removed; readline is a mandatory dependency
now.

Add patch fixing build with editline is not installed.

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...readline-include-in-ipmi_serial_bmc_emu.c.patch | 31 ++++++++++++++++++++++
 package/openipmi/Config.in                         |  1 +
 package/openipmi/openipmi.hash                     |  7 +++--
 package/openipmi/openipmi.mk                       |  4 +--
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch b/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch
new file mode 100644
index 0000000000..112d63854c
--- /dev/null
+++ b/package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch
@@ -0,0 +1,31 @@
+From 6a051666b50ae1df24b24312a7a56a03e343c15d Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 16 Aug 2019 09:48:21 +0300
+Subject: [PATCH] sample: fix readline include in ipmi_serial_bmc_emu.c
+
+Bundled editline has been removed. Use the readline headers instead. Fix
+the build when editline is not installed on host.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to openipmi-developer at lists.sourceforge.net (moderated)
+
+ sample/ipmi_serial_bmc_emu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sample/ipmi_serial_bmc_emu.c b/sample/ipmi_serial_bmc_emu.c
+index e0ae0197688b..1b8bb9ac201f 100644
+--- a/sample/ipmi_serial_bmc_emu.c
++++ b/sample/ipmi_serial_bmc_emu.c
+@@ -42,7 +42,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <sys/select.h>
+-#include <editline/readline.h>
++#include <readline/readline.h>
+ 
+ #define _GNU_SOURCE
+ #include <getopt.h>
+-- 
+2.23.0.rc1
+
diff --git a/package/openipmi/Config.in b/package/openipmi/Config.in
index d8c94b307c..22fb9fa7bb 100644
--- a/package/openipmi/Config.in
+++ b/package/openipmi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENIPMI
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	help
 	  IPMI allows remote monitoring and remote management of
 	  devices. OpenIPMI provides a library and command line tools
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index 37048ca2a3..756ea539f1 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,4 +1,7 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1 f37656813a826a3147ed557c32408f8daa399c28 OpenIPMI-2.0.24.tar.gz
+sha1 043738af9e1aaa6ae4f372d4af7870683e68faf8 OpenIPMI-2.0.27.tar.gz
 # Locally computed
-sha256	bca39a27071278a8b74610181ede8df51e155e5e9031bc8eaa3699d1720292b4	OpenIPMI-2.0.24.tar.gz
+sha256	f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b	OpenIPMI-2.0.27.tar.gz
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256	185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e	COPYING.BSD
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 8e91e4ed03..9590b446ef 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.24
+OPENIPMI_VERSION = 2.0.27
 OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
-OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
+OPENIPMI_DEPENDENCIES = popt ncurses readline host-pkgconf
 # Patching Makefile.am
 OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
