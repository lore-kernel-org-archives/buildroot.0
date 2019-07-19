From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Jul 2019 23:10:03 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/dropwatch: bump to version 1.5.1
Message-ID: <20190719211003.3678-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site, see
  http://git.infradead.org/users/nhorman/dropwatch.git/blob/975fd7331d19a32f6d0f20781dfb19f2d14c3c31:/README
- Switch to autotools (and so drop second patch on Makefile: if there is
  some errors raised by -Werror, we'll fix them)
- Update first patch by upstream commit
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Replace first patch with upstream commit

 package/dropwatch/0001-binutils-2.23.1.patch | 104 +++++++------------
 package/dropwatch/0002-remove-werror.patch   |  31 ------
 package/dropwatch/Config.in                  |   2 +-
 package/dropwatch/dropwatch.hash             |   3 +-
 package/dropwatch/dropwatch.mk               |  26 ++---
 5 files changed, 49 insertions(+), 117 deletions(-)
 delete mode 100644 package/dropwatch/0002-remove-werror.patch

diff --git a/package/dropwatch/0001-binutils-2.23.1.patch b/package/dropwatch/0001-binutils-2.23.1.patch
index f9f090c055..86b1822bc0 100644
--- a/package/dropwatch/0001-binutils-2.23.1.patch
+++ b/package/dropwatch/0001-binutils-2.23.1.patch
@@ -1,92 +1,60 @@
-From c89cc908ba7f9f41aba4f61f58103d0fc64fa19f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 16 Jun 2017 08:50:03 +0200
+From 0ffad73a59d3c831dfab66d4d06f1ab25fce66f2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Jul 2019 22:58:07 +0200
 Subject: [PATCH] Fix for binutils 2.23.1
 
 libbfd from binutils 2.23.1+ requires PACKAGE* definitions from autoconf.
-Patch from https://fedorahosted.org/dropwatch/ticket/5
-Upstream status: new.
+So include config.h now that dropwatch uses autoconf
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Retrieved (and slightly updated) from:
+https://git.buildroot.net/buildroot/tree/package/dropwatch/0001-binutils-2.23.1.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/nhorman/dropwatch/commit/0ffad73a59d3c831dfab66d4d06f1ab25fce66f2]
 ---
- src/lookup.c     | 2 +-
- src/lookup.h     | 3 +++
- src/lookup_bfd.c | 2 +-
- src/lookup_kas.c | 2 +-
- 4 files changed, 6 insertions(+), 3 deletions(-)
+ src/lookup.c     | 3 +++
+ src/lookup_bfd.c | 2 ++
+ src/lookup_kas.c | 2 ++
+ 3 files changed, 7 insertions(+)
 
 diff --git a/src/lookup.c b/src/lookup.c
-index ba54991..809981b 100644
+index ba54991..521e292 100644
 --- a/src/lookup.c
 +++ b/src/lookup.c
-@@ -27,13 +27,13 @@
+@@ -24,6 +24,9 @@
+  * 1) /usr/lib/debug/<kernel version> using libbfd
+  * 2) /proc/kallsyms
+  */
++
++#include "config.h"
++
  #include <stdlib.h>
  #include <stdio.h>
  #include <sys/utsname.h>
--#include <bfd.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- 
- #include "lookup.h"
-+#include <bfd.h>
- 
- extern struct lookup_methods bfd_methods;
- extern struct lookup_methods kallsym_methods;
-diff --git a/src/lookup.h b/src/lookup.h
-index e6568d8..47a7b56 100644
---- a/src/lookup.h
-+++ b/src/lookup.h
-@@ -28,6 +28,9 @@
- #include <stdlib.h>
- #include <asm/types.h>
- 
-+// satisfy PR 14072 in bfd.h
-+#define PACKAGE 1
-+#define PACKAGE_VERSION 1
- 
- /*
-  * Initalization routine
 diff --git a/src/lookup_bfd.c b/src/lookup_bfd.c
-index cc7010b..271d426 100644
+index cc7010b..2c08e5e 100644
 --- a/src/lookup_bfd.c
 +++ b/src/lookup_bfd.c
-@@ -25,13 +25,13 @@
+@@ -22,6 +22,8 @@
+  * symbollic name using the bfd library
+  */
+ 
++#include "config.h"
++
  #include <stdlib.h>
  #include <stdio.h>
  #include <sys/utsname.h>
--#include <bfd.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- 
- #include "lookup.h"
-+#include <bfd.h>
- 
- 
- static int lookup_bfd_init(void)
 diff --git a/src/lookup_kas.c b/src/lookup_kas.c
-index 16e639f..556cb62 100644
+index 5e05630..2300220 100644
 --- a/src/lookup_kas.c
 +++ b/src/lookup_kas.c
-@@ -25,7 +25,6 @@
+@@ -22,6 +22,8 @@
+  * symbolic name using /proc/kallsyms
+  */
+ 
++#include "config.h"
++
  #include <stdlib.h>
  #include <stdio.h>
- #include <sys/utsname.h>
--#include <bfd.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
-@@ -33,6 +32,7 @@
- #include <sys/queue.h>
- 
- #include "lookup.h"
-+#include <bfd.h>
- 
- struct symbol_entry {
- 	char *sym_name;
--- 
-2.1.4
-
+ #include <stdint.h>
diff --git a/package/dropwatch/0002-remove-werror.patch b/package/dropwatch/0002-remove-werror.patch
deleted file mode 100644
index 4b6c989364..0000000000
--- a/package/dropwatch/0002-remove-werror.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2462baf55939ee53bb28ff5f9474761f2a888add Mon Sep 17 00:00:00 2001
-From: Markos Chandras <markos.chandras@imgtec.com>
-Date: Fri, 16 Jun 2017 08:53:31 +0200
-Subject: [PATCH] remove werror
-
--Werror shouldn't be used in released code since it can
-cause random build failures on moderate warnings. It also
-depends on the used toolchain since different toolchains may
-or may not print the same warnings.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 5bc6aaa..527c1da 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -1,7 +1,7 @@
- all: dropwatch
- 
- CPPFLAGS += -D_GNU_SOURCE
--CFLAGS += -g -Wall -Werror $(shell pkg-config --cflags libnl-3.0)
-+CFLAGS += -g -Wall $(shell pkg-config --cflags libnl-3.0)
- LDLIBS += -lbfd -lreadline -lnl-3 -lnl-genl-3
- 
- OBJFILES := main.o lookup.o\
--- 
-2.1.4
-
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index f470f1b562..6d021756ee 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_DROPWATCH
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
 
-	  http://git.infradead.org/users/nhorman/dropwatch.git
+	  https://github.com/nhorman/dropwatch
 
 comment "dropwatch needs a toolchain w/ threads, wchar"
 	depends on !BR2_nios2
diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 585b035d0f..e0e03ad883 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4937007da3d0071c9a37ee0360cfd1657b342fd2a327d83ba992fbf3e0ea51b5  dropwatch-7c33d8a8ed105b07a46b55d71d93b36ed34c16db.tar.gz
+sha256 3a95b7ff0d609f581c120a4072e6a97d044f900824b4f4d3ac83fdcc5f3e96cf  dropwatch-1.5.1.tar.gz
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 692a6e8c40..bda25dd326 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,27 +4,21 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 7c33d8a8ed105b07a46b55d71d93b36ed34c16db
-DROPWATCH_SITE = git://git.infradead.org/users/nhorman/dropwatch.git
+DROPWATCH_VERSION = 1.5.1
+DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
+# From git
+DROPWATCH_AUTORECONF = YES
 
-# libbfd may be linked to libintl
-# Ugly... but LDLIBS are hardcoded anyway
-DROPWATCH_LDLIBS = \
-	-lbfd -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm \
-	$(TARGET_NLS_LIBS)
-
-define DROPWATCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		LDLIBS="$(DROPWATCH_LDLIBS)" build
+# Autoreconf step fails due to missing m4 directory
+define DROPWATCH_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
 endef
+DROPWATCH_PRE_CONFIGURE_HOOKS += DROPWATCH_CREATE_M4_DIR
 
-define DROPWATCH_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/dropwatch \
-		$(TARGET_DIR)/usr/bin/dropwatch
-endef
+DROPWATCH_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.20.1
