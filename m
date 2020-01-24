From: Jochen Baltes <jochen.baltes@gmail.com>
Date: Fri, 24 Jan 2020 15:16:24 +0000
Subject: [Buildroot] [PATCH 1/1] package/altera-stapl: new package
Message-ID: <20200124151624.16728-1-jochen.baltes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alteras Jam STAPL Bytecode Player with 64-bit support.
This is a user-space port of the altera-stapl driver from the linux kernel.
The source released by Altera wasn't 64-bit compatible.
Additionally, the linux version is much cleaner and old cruft was removed.

Signed-off-by: Jochen Baltes <jochen.baltes@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...strlcpy-function-with-weak-attribute.patch | 28 +++++++++++++++
 ...ix-type-missmatch-warning-in-fprintf.patch | 34 +++++++++++++++++++
 package/altera-stapl/Config.in                |  8 +++++
 package/altera-stapl/altera-stapl.hash        |  2 ++
 package/altera-stapl/altera-stapl.mk          | 21 ++++++++++++
 7 files changed, 97 insertions(+)
 create mode 100644 package/altera-stapl/0001-declare-strlcpy-function-with-weak-attribute.patch
 create mode 100644 package/altera-stapl/0002-fix-type-missmatch-warning-in-fprintf.patch
 create mode 100644 package/altera-stapl/Config.in
 create mode 100644 package/altera-stapl/altera-stapl.hash
 create mode 100644 package/altera-stapl/altera-stapl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1eb052652..f1d443a9cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1237,6 +1237,9 @@ N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
 F:	configs/snps_aarch64_vdk_defconfig
 
+N:	Jochen Baltes <jochen.baltes@gmail.com>
+F:	package/altera-stapl
+
 N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/c-capnproto/
 F:	package/capnproto/
diff --git a/package/Config.in b/package/Config.in
index 4c94914680..84bf3463ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -410,6 +410,7 @@ endmenu
 	source "package/acpid/Config.in"
 	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
+	source "package/altera-stapl/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/amd-catalyst/Config.in"
 	source "package/avrdude/Config.in"
diff --git a/package/altera-stapl/0001-declare-strlcpy-function-with-weak-attribute.patch b/package/altera-stapl/0001-declare-strlcpy-function-with-weak-attribute.patch
new file mode 100644
index 0000000000..63e3a764c8
--- /dev/null
+++ b/package/altera-stapl/0001-declare-strlcpy-function-with-weak-attribute.patch
@@ -0,0 +1,28 @@
+From c11d4395cc56023edbde179ed770221b1b15b7be Mon Sep 17 00:00:00 2001
+From: Jochen Baltes <jochen.baltes@gmail.com>
+Date: Fri, 24 Jan 2020 12:49:28 +0000
+Subject: [PATCH 1/2] declare strlcpy function with weak attribute
+
+This allow compiling with libc library which has strlcpy already
+declared.
+
+Signed-off-by: Jochen Baltes <jochen.baltes@gmail.com>
+---
+ altera.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/altera.c b/altera.c
+index c13225c..116dcc2 100644
+--- a/altera.c
++++ b/altera.c
+@@ -216,6 +216,7 @@ static inline void put_unaligned_le32(uint32_t val, uint8_t *p)
+ 	*p++ = val >> 24;
+ }
+ 
++__attribute__ ((weak))
+ size_t strlcpy(char *dest, const char *src, size_t size)
+ {
+ 	size_t ret = strlen(src);
+-- 
+2.20.1
+
diff --git a/package/altera-stapl/0002-fix-type-missmatch-warning-in-fprintf.patch b/package/altera-stapl/0002-fix-type-missmatch-warning-in-fprintf.patch
new file mode 100644
index 0000000000..ffe3e89daf
--- /dev/null
+++ b/package/altera-stapl/0002-fix-type-missmatch-warning-in-fprintf.patch
@@ -0,0 +1,34 @@
+From 09afe2b487df327e13b2d8c08f84e8428df76b8f Mon Sep 17 00:00:00 2001
+From: Jochen Baltes <jochen.baltes@gmail.com>
+Date: Fri, 24 Jan 2020 12:44:54 +0000
+Subject: [PATCH 2/2] fix type missmatch warning in fprintf
+
+Signed-off-by: Jochen Baltes <jochen.baltes@gmail.com>
+---
+ altera.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/altera.c b/altera.c
+index 116dcc2..ac47e01 100644
+--- a/altera.c
++++ b/altera.c
+@@ -23,6 +23,7 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
++#include <inttypes.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -445,7 +446,7 @@ int altera_execute(uint8_t *p, int32_t program_size, char *action,
+ 						? get_unaligned_be16(&p[offset + 1])
+ 						: get_unaligned_be32(&p[offset + 1]);
+ 			name = &p[str_table + name_id];
+-			fprintf(stderr, "Variable #%d (%s) attrs=%x value=%08lx var_size=%d orig_value=%08x\n",
++			fprintf(stderr, "Variable #%d (%s) attrs=%x value=%" PRIxPTR " var_size=%d orig_value=%08x\n",
+ 					i, name, attrs[i], vars[i], var_size[i], value);
+ 		}
+ 	}
+-- 
+2.20.1
+
diff --git a/package/altera-stapl/Config.in b/package/altera-stapl/Config.in
new file mode 100644
index 0000000000..ff7d23f841
--- /dev/null
+++ b/package/altera-stapl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ALTERA_STAPL
+	bool "altera-stapl"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 # libgpiod
+	select BR2_PACKAGE_LIBGPIOD
+	help
+	  Altera Jam STAPL Bytecode Player.
+
+	  https://github.com/kontron/altera-stapl
diff --git a/package/altera-stapl/altera-stapl.hash b/package/altera-stapl/altera-stapl.hash
new file mode 100644
index 0000000000..9ea977924e
--- /dev/null
+++ b/package/altera-stapl/altera-stapl.hash
@@ -0,0 +1,2 @@
+sha256	22c7c9dadfb0d09a6fd3b5497cc22f7ebf7a0969d20dc37e71c8035bb5642036  altera-stapl-0.3.2.tar.gz
+sha256	d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/altera-stapl/altera-stapl.mk b/package/altera-stapl/altera-stapl.mk
new file mode 100644
index 0000000000..149a243604
--- /dev/null
+++ b/package/altera-stapl/altera-stapl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# altera-stapl
+#
+################################################################################
+
+ALTERA_STAPL_VERSION = 0.3.2
+ALTERA_STAPL_SITE = $(call github,kontron,altera-stapl,$(ALTERA_STAPL_VERSION))
+ALTERA_STAPL_LICENSE = GPLv2+
+ALTERA_STAPL_LICENSE_FILES = COPYING
+ALTERA_STAPL_DEPENDENCIES = libgpiod
+
+define ALTERA_STAPL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define ALTERA_STAPL_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
