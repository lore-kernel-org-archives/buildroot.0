From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 11 Apr 2017 14:48:03 -0700
Subject: [Buildroot] [PATCH] package/xen: Update to version 4.8.1
Message-ID: <20170411214803.5948-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Xen to version 4.8.1 and update the patches to allow Xen
hypervisor and Xen tools to build.

The patches applied were re-aranged a little bit. Patches 2, 3 and 4
have been accepted by upstream Xen and won't be required in future
releases.

Patch 1 (previously patch 2) is still required and was moved to patch 1
to better reflect it's status.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 ------------------
 ...k-fix-build-with-CFLAGS-from-environment.patch} |  0
 ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 30 +++++++++++++++++++++
 ...003-tools-blktap2-Fix-missing-header-file.patch | 31 ++++++++++++++++++++++
 ...ools-libxl-Disable-strict-Werror-checking.patch | 26 ------------------
 ...p2-remove-unused-inclusion-of-sys-sysctl..patch | 31 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  3 ++-
 8 files changed, 95 insertions(+), 54 deletions(-)
 delete mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
 rename package/xen/{0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch => 0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch} (100%)
 create mode 100644 package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
 create mode 100644 package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
 delete mode 100644 package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
 create mode 100644 package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch

diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
deleted file mode 100644
index ca772dd..0000000
--- a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Tue, 13 Sep 2016 10:48:31 -0700
-Subject: [PATCH] Remove hardcoded strict -Werror checking
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- Config.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Config.mk b/Config.mk
-index bd991c6..e7ac662 100644
---- a/Config.mk
-+++ b/Config.mk
-@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
- SHELL     ?= /bin/sh
- 
- # Tools to run on system hosting the build
--HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
-+HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
- HOSTCFLAGS += -fno-strict-aliasing
- 
- DISTDIR     ?= $(XEN_ROOT)/dist
--- 
-2.7.4
-
diff --git a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
similarity index 100%
rename from package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
rename to package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
diff --git a/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch b/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
new file mode 100644
index 0000000..533a688
--- /dev/null
+++ b/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
@@ -0,0 +1,30 @@
+From 341c75bf4661aa0b5411d5dcc6334ab22e0bb158 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:46:58 -0800
+Subject: [PATCH] tools/blktap2/vhd: Remove unused struct stat stats
+
+The unsued variable 'struct stat stats' causes build errors in some
+situations. As it isn't used just remove it.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/blktap2/vhd/lib/libvhd-journal.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/vhd/lib/libvhd-journal.c b/tools/blktap2/vhd/lib/libvhd-journal.c
+index 26e26e7..862890f 100644
+--- a/tools/blktap2/vhd/lib/libvhd-journal.c
++++ b/tools/blktap2/vhd/lib/libvhd-journal.c
+@@ -1260,7 +1260,6 @@ vhd_journal_create(vhd_journal_t *j, const char *file, const char *jfile)
+ 	int i, err;
+ 	size_t size;
+ 	off_t off;
+-	struct stat stats;
+ 
+ 	memset(j, 0, sizeof(vhd_journal_t));
+ 	j->jfd = -1;
+-- 
+2.7.4
+
diff --git a/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch b/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
new file mode 100644
index 0000000..5d6f0cb
--- /dev/null
+++ b/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
@@ -0,0 +1,31 @@
+From 1226317351b4154ed6460b778f2490614f47b9d4 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:46:59 -0800
+Subject: [PATCH] tools/blktap2: Fix missing header file
+
+To avoid build errors relating to missing declarations of ssize_t add
+the appropriate header file to atomic.h.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/blktap2/include/atomicio.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/blktap2/include/atomicio.h b/tools/blktap2/include/atomicio.h
+index 7eccf20..5a1120e 100644
+--- a/tools/blktap2/include/atomicio.h
++++ b/tools/blktap2/include/atomicio.h
+@@ -25,6 +25,8 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include <sys/types.h>
++
+ /*
+  * Ensure all of data on socket comes through. f==read || f==vwrite
+  */
+-- 
+2.7.4
+
diff --git a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
deleted file mode 100644
index 80c0b32..0000000
--- a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19f1e70041044fde1542109a0525424cc6d5d053 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Wed, 7 Dec 2016 11:35:10 -0800
-Subject: [PATCH] tools/libxl: Disable strict Werror checking
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- tools/libxl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
-index defeb40..239faf3 100644
---- a/tools/libxl/Makefile
-+++ b/tools/libxl/Makefile
-@@ -11,7 +11,7 @@ MINOR = 0
- XLUMAJOR = 4.7
- XLUMINOR = 0
- 
--CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
-+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
- 	-Wno-declaration-after-statement -Wformat-nonliteral
- CFLAGS += -I. -fPIC
- 
--- 
-2.7.4
-
diff --git a/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch b/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
new file mode 100644
index 0000000..2d82be4
--- /dev/null
+++ b/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
@@ -0,0 +1,31 @@
+From 74858c9eaf335658b4c19cb4a848bb721065c233 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 20 Dec 2016 11:47:00 -0800
+Subject: [PATCH] tools/blktap2: remove unused inclusion of sys/sysctl.l
+
+That header file is not used. Removing it would avoid build error with
+musl libc, which doesn't have that header file.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
+[ wei: rewrote commit message ]
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/blktap2/drivers/block-remus.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/drivers/block-remus.c b/tools/blktap2/drivers/block-remus.c
+index 079588d..7401800 100644
+--- a/tools/blktap2/drivers/block-remus.c
++++ b/tools/blktap2/drivers/block-remus.c
+@@ -54,7 +54,6 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c3df243..813040b 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e87f4b0575e78657ee23d31470a15ecf1ce8c3a92a771cda46bbcd4d0d671ffe xen-4.7.1.tar.gz
+sha256 1d69153b94561429293015f66463ee17c26404d1c014e646ecbcca6078581395 xen-4.8.1.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 2e388fc..89c09f8 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.7.1
+XEN_VERSION = 4.8.1
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
@@ -23,6 +23,7 @@ XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
+	HOST_EXTRACFLAGS="-Wno-error" \
 	$(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
-- 
2.9.3
