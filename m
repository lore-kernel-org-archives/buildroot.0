From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2020 21:34:32 +0100
Subject: [Buildroot] [git commit] package/dropwatch: bump to version 1.5.2
Message-ID: <20200313202220.8F21982977@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a630c5759a9e63bf7807cb48e392b32a3574676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version comes with some new features and minor fixes. The two
previously included patches were merged upstream. A new patch was added
to fix build on 32-bit systems. There's a new dependency to the pcap
library.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-build-on-32-bit-systems.patch         |  87 ++++++++++++
 package/dropwatch/0001-binutils-2.23.1.patch       |  60 ---------
 .../dropwatch/0002-Make-binutils-optional.patch    | 146 ---------------------
 package/dropwatch/Config.in                        |   1 +
 package/dropwatch/dropwatch.hash                   |   2 +-
 package/dropwatch/dropwatch.mk                     |   4 +-
 6 files changed, 91 insertions(+), 209 deletions(-)

diff --git a/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch b/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch
new file mode 100644
index 0000000000..355a01c99f
--- /dev/null
+++ b/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch
@@ -0,0 +1,87 @@
+From 3004f23d38400cd4a8619bcacd55a625d3bd7e1f Mon Sep 17 00:00:00 2001
+From: Alexander Dahl <post@lespocky.de>
+Date: Fri, 13 Mar 2020 13:20:27 +0100
+Subject: [PATCH] Fix build on 32-bit systems
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Because -Werror is set, some printf statements caused build errors on
+32-bit systems when printing uint64_t. This can be handled in a portable
+way by using the macros from inttypes.h ???
+
+Fixes: #12
+Signed-off-by: Alexander Dahl <post@lespocky.de>
+---
+PR upstream: https://github.com/nhorman/dropwatch/pull/24
+---
+ src/dwdump.c | 3 ++-
+ src/main.c   | 9 +++++----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/dwdump.c b/src/dwdump.c
+index 0c3ba6f..0ea9fd0 100644
+--- a/src/dwdump.c
++++ b/src/dwdump.c
+@@ -3,6 +3,7 @@
+  */
+ 
+ #include <errno.h>
++#include <inttypes.h>
+ #include <getopt.h>
+ #include <pcap.h>
+ #include <signal.h>
+@@ -246,7 +247,7 @@ static void dwdump_nested_stats_print(struct nlattr *attr)
+ 		return;
+ 
+ 	if (attrs[NET_DM_ATTR_STATS_DROPPED])
+-		printf("Tail dropped: %lu\n",
++		printf("Tail dropped: %" PRIu64 "\n",
+ 		       nla_get_u64(attrs[NET_DM_ATTR_STATS_DROPPED]));
+ }
+ 
+diff --git a/src/main.c b/src/main.c
+index 1a1515c..bd87085 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -10,6 +10,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <errno.h>
++#include <inttypes.h>
+ #include <signal.h>
+ #include <stdint.h>
+ #include <stdbool.h>
+@@ -486,9 +487,9 @@ void handle_dm_packet_alert_msg(struct netlink_message *msg, int err)
+ 		goto out_free;
+ 
+ 	if (attrs[NET_DM_ATTR_PC] && attrs[NET_DM_ATTR_SYMBOL])
+-		printf("drop at: %s (%p)\n",
++		printf("drop at: %s (0x%" PRIx64 ")\n",
+ 		       nla_get_string(attrs[NET_DM_ATTR_SYMBOL]),
+-		       (void *) nla_get_u64(attrs[NET_DM_ATTR_PC]));
++		       nla_get_u64(attrs[NET_DM_ATTR_PC]));
+ 	else if (attrs[NET_DM_ATTR_HW_TRAP_GROUP_NAME] &&
+ 		 attrs[NET_DM_ATTR_HW_TRAP_NAME])
+ 		printf("drop at: %s (%s)\n",
+@@ -524,7 +525,7 @@ void handle_dm_packet_alert_msg(struct netlink_message *msg, int err)
+ 
+ 		tstr = asctime(tm);
+ 		tstr[strlen(tstr) - 1] = 0;
+-		printf("timestamp: %s %09ld nsec\n", tstr, ts % 1000000000);
++		printf("timestamp: %s %09" PRId64 " nsec\n", tstr, ts % 1000000000);
+ 	}
+ 
+ 	if (attrs[NET_DM_ATTR_PROTO])
+@@ -599,7 +600,7 @@ void print_nested_stats(struct nlattr *attr)
+ 		return;
+ 
+ 	if (attrs[NET_DM_ATTR_STATS_DROPPED])
+-		printf("Tail dropped: %lu\n",
++		printf("Tail dropped: %" PRIu64 "\n",
+ 		       nla_get_u64(attrs[NET_DM_ATTR_STATS_DROPPED]));
+ }
+ 
+-- 
+2.20.1
+
diff --git a/package/dropwatch/0001-binutils-2.23.1.patch b/package/dropwatch/0001-binutils-2.23.1.patch
deleted file mode 100644
index 86b1822bc0..0000000000
--- a/package/dropwatch/0001-binutils-2.23.1.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0ffad73a59d3c831dfab66d4d06f1ab25fce66f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Jul 2019 22:58:07 +0200
-Subject: [PATCH] Fix for binutils 2.23.1
-
-libbfd from binutils 2.23.1+ requires PACKAGE* definitions from autoconf.
-So include config.h now that dropwatch uses autoconf
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Retrieved (and slightly updated) from:
-https://git.buildroot.net/buildroot/tree/package/dropwatch/0001-binutils-2.23.1.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/nhorman/dropwatch/commit/0ffad73a59d3c831dfab66d4d06f1ab25fce66f2]
----
- src/lookup.c     | 3 +++
- src/lookup_bfd.c | 2 ++
- src/lookup_kas.c | 2 ++
- 3 files changed, 7 insertions(+)
-
-diff --git a/src/lookup.c b/src/lookup.c
-index ba54991..521e292 100644
---- a/src/lookup.c
-+++ b/src/lookup.c
-@@ -24,6 +24,9 @@
-  * 1) /usr/lib/debug/<kernel version> using libbfd
-  * 2) /proc/kallsyms
-  */
-+
-+#include "config.h"
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <sys/utsname.h>
-diff --git a/src/lookup_bfd.c b/src/lookup_bfd.c
-index cc7010b..2c08e5e 100644
---- a/src/lookup_bfd.c
-+++ b/src/lookup_bfd.c
-@@ -22,6 +22,8 @@
-  * symbollic name using the bfd library
-  */
- 
-+#include "config.h"
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <sys/utsname.h>
-diff --git a/src/lookup_kas.c b/src/lookup_kas.c
-index 5e05630..2300220 100644
---- a/src/lookup_kas.c
-+++ b/src/lookup_kas.c
-@@ -22,6 +22,8 @@
-  * symbolic name using /proc/kallsyms
-  */
- 
-+#include "config.h"
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <stdint.h>
diff --git a/package/dropwatch/0002-Make-binutils-optional.patch b/package/dropwatch/0002-Make-binutils-optional.patch
deleted file mode 100644
index 2694e99b63..0000000000
--- a/package/dropwatch/0002-Make-binutils-optional.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From a9d1b6adb4e47ae89d55274ff3f7121122e15975 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 1 Aug 2019 17:42:16 +0200
-Subject: [PATCH] Make binutils optional
-
-Add an option to enable or disable bfd support to allow the user to use
-dropwatch without binutils
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nhorman/dropwatch/pull/10]
----
- configure.ac     | 10 ++++++++++
- src/Makefile.am  |  9 +++++++--
- src/lookup.c     |  8 ++++++++
- src/lookup.h     |  4 ++++
- src/lookup_kas.c |  1 -
- 5 files changed, 29 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 97e21fe..c01a9f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,6 +17,15 @@ PKG_CHECK_MODULES([LIBNL3], [libnl-3.0], [], [AC_MSG_ERROR([libnl-3.0 is require
- # Fallback on using -lreadline as readline.pc is only available since version 8.0
- PKG_CHECK_MODULES([READLINE], [readline], [], [READLINE_LIBS=-lreadline])
- 
-+AC_ARG_WITH([bfd],
-+	[AS_HELP_STRING([--without-bfd], [Build without bfd library (default: yes)])],
-+	[with_bfd=$withval],
-+	[with_bfd=yes])
-+AS_IF([test "x$with_bfd" != "xno"], [
-+	AC_CHECK_HEADERS([bfd.h], [], [AC_MSG_ERROR([Couldn't find or include bfd.h])])
-+])
-+AM_CONDITIONAL(USE_BFD, test "x$with_bfd" != "xno")
-+
- AC_OUTPUT(Makefile src/Makefile doc/Makefile tests/Makefile)
- 
- AC_MSG_NOTICE()
-@@ -25,3 +34,4 @@ AC_MSG_NOTICE([Target:                 $target])
- AC_MSG_NOTICE([Installation prefix:    $prefix])
- AC_MSG_NOTICE([Compiler:               $CC])
- AC_MSG_NOTICE([Compiler flags: $CFLAGS])
-+AC_MSG_NOTICE([BFD library support: $with_bfd])
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 16db0b4..994fbd8 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -2,7 +2,12 @@
- bin_PROGRAMS = dropwatch
- 
- AM_CFLAGS = -g -Wall -Werror $(LIBNL3_CFLAGS) $(READLINE_CFLAGS)
--AM_LDFLAGS = $(LIBNL3_LIBS) -lnl-genl-3 -lbfd $(READLINE_LIBS)
-+AM_LDFLAGS = $(LIBNL3_LIBS) -lnl-genl-3 $(READLINE_LIBS)
- AM_CPPFLAGS = -D_GNU_SOURCE
- 
--dropwatch_SOURCES = main.c lookup_bfd.c lookup.c lookup_kas.c
-+dropwatch_SOURCES = main.c lookup.c lookup_kas.c
-+
-+if USE_BFD
-+dropwatch_SOURCES += lookup_bfd.c
-+AM_LDFLAGS += -lbfd
-+endif
-diff --git a/src/lookup.c b/src/lookup.c
-index 521e292..ec5e847 100644
---- a/src/lookup.c
-+++ b/src/lookup.c
-@@ -30,7 +30,9 @@
- #include <stdlib.h>
- #include <stdio.h>
- #include <sys/utsname.h>
-+#ifdef HAVE_BFD_H
- #include <bfd.h>
-+#endif
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
-@@ -38,7 +40,9 @@
- 
- #include "lookup.h"
- 
-+#ifdef HAVE_BFD_H
- extern struct lookup_methods bfd_methods;
-+#endif
- extern struct lookup_methods kallsym_methods;
- 
- static int lookup_null_init(void)
-@@ -75,17 +79,21 @@ int init_lookup(lookup_init_method_t method)
- 		methods = &null_methods;
- 		break;
- 	case METHOD_AUTO:
-+#ifdef HAVE_BFD_H
- 		methods = &bfd_methods;
- 		if (methods->lookup_init() == 0)
- 			return 0;
-+#endif
- 		methods = &kallsym_methods;
- 		if (methods->lookup_init() == 0)
- 			return 0;
- 		methods = NULL;
- 		return -1;
-+#ifdef HAVE_BFD_H
- 	case METHOD_DEBUGINFO:
- 		methods = &bfd_methods;
- 		break;
-+#endif
- 	case METHOD_KALLSYMS:
- 		methods = &kallsym_methods;
- 		break;
-diff --git a/src/lookup.h b/src/lookup.h
-index e6568d8..2c56a92 100644
---- a/src/lookup.h
-+++ b/src/lookup.h
-@@ -25,6 +25,8 @@
-  * 2) /proc/kallsyms
-  */
- 
-+#include "config.h"
-+
- #include <stdlib.h>
- #include <asm/types.h>
- 
-@@ -44,7 +46,9 @@
- typedef enum {
- 	METHOD_NULL = 0,
- 	METHOD_AUTO,
-+#ifdef HAVE_BFD_H
- 	METHOD_DEBUGINFO,
-+#endif
- 	METHOD_KALLSYMS
- } lookup_init_method_t;
- 
-diff --git a/src/lookup_kas.c b/src/lookup_kas.c
-index 2300220..9a1a148 100644
---- a/src/lookup_kas.c
-+++ b/src/lookup_kas.c
-@@ -28,7 +28,6 @@
- #include <stdio.h>
- #include <stdint.h>
- #include <sys/utsname.h>
--#include <bfd.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
--- 
-2.20.1
-
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index cf11a03d43..8dfb4ace56 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DROPWATCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index e0e03ad883..e4b687ae75 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3a95b7ff0d609f581c120a4072e6a97d044f900824b4f4d3ac83fdcc5f3e96cf  dropwatch-1.5.1.tar.gz
+sha256 a2049a68d2cc2f81df977c7a732f50de3ec71283bc7bd94389ba33574af9aaa6  dropwatch-1.5.2.tar.gz
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index c5873ccf76..0ee9e5e0f6 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.1
+DROPWATCH_VERSION = 1.5.2
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
-DROPWATCH_DEPENDENCIES = libnl readline host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 # Until upstream updates their tree with a proper license
 # blurb: https://github.com/nhorman/dropwatch/issues/14
 DROPWATCH_LICENSE = GPL-2.0+
