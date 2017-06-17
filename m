From: Alexander Dahl <post@lespocky.de>
Date: Sat, 17 Jun 2017 09:27:26 +0200
Subject: [Buildroot] [PATCH] dropwatch: bump to master and fix site
Message-ID: <1497684446-18637-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool was hosted at fedorahosted.org which was shut down in early
2017. According to a private conversation with the upstream maintainer,
the new home for this tool is on infradead.org so far. So the SITE was
adapted accordingly.

Additionally the version was bumped from 1.4 to current master. This
allows to drop one build patch. The other patches were recreated with
Git.

Cc: Neil Horman <nhorman@tuxdriver.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 ...ils-2.23.1.patch => 0001-binutils-2.23.1.patch} | 60 ++++++++++++++--------
 package/dropwatch/0001-build.patch                 | 27 ----------
 package/dropwatch/0002-remove-werror.patch         | 31 +++++++++++
 package/dropwatch/0003-remove-werror.patch         | 18 -------
 package/dropwatch/dropwatch.hash                   |  2 +-
 package/dropwatch/dropwatch.mk                     |  5 +-
 6 files changed, 73 insertions(+), 70 deletions(-)
 rename package/dropwatch/{0002-binutils-2.23.1.patch => 0001-binutils-2.23.1.patch} (59%)
 delete mode 100644 package/dropwatch/0001-build.patch
 create mode 100644 package/dropwatch/0002-remove-werror.patch
 delete mode 100644 package/dropwatch/0003-remove-werror.patch

diff --git a/package/dropwatch/0002-binutils-2.23.1.patch b/package/dropwatch/0001-binutils-2.23.1.patch
similarity index 59%
rename from package/dropwatch/0002-binutils-2.23.1.patch
rename to package/dropwatch/0001-binutils-2.23.1.patch
index 4d43356..8790051 100644
--- a/package/dropwatch/0002-binutils-2.23.1.patch
+++ b/package/dropwatch/0001-binutils-2.23.1.patch
@@ -1,12 +1,24 @@
+From c89cc908ba7f9f41aba4f61f58103d0fc64fa19f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 16 Jun 2017 08:50:03 +0200
+Subject: [PATCH 1/2] binutils 2.23.1
+
 libbfd from binutils 2.23.1+ requires PACKAGE* definitions from autoconf.
 Patch from https://fedorahosted.org/dropwatch/ticket/5
 Upstream status: new.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/lookup.c     | 2 +-
+ src/lookup.h     | 3 +++
+ src/lookup_bfd.c | 2 +-
+ src/lookup_kas.c | 2 +-
+ 4 files changed, 6 insertions(+), 3 deletions(-)
 
-diff -aurd src.orig/lookup.c src/lookup.c
---- a/src/lookup.c	2011-10-03 22:51:38.000000000 +0400
-+++ b/src/lookup.c	2013-02-18 09:13:56.683214438 +0400
+diff --git a/src/lookup.c b/src/lookup.c
+index ba54991..809981b 100644
+--- a/src/lookup.c
++++ b/src/lookup.c
 @@ -27,13 +27,13 @@
  #include <stdlib.h>
  #include <stdio.h>
@@ -16,28 +28,30 @@ diff -aurd src.orig/lookup.c src/lookup.c
  #include <unistd.h>
  #include <sys/types.h>
  #include <sys/stat.h>
-
+ 
  #include "lookup.h"
 +#include <bfd.h>
-
+ 
  extern struct lookup_methods bfd_methods;
  extern struct lookup_methods kallsym_methods;
-diff -aurd src.orig/lookup.h src/lookup.h
---- a/src/lookup.h	2011-10-03 22:51:38.000000000 +0400
-+++ b/src/lookup.h	2013-02-18 09:11:00.506895026 +0400
+diff --git a/src/lookup.h b/src/lookup.h
+index e6568d8..47a7b56 100644
+--- a/src/lookup.h
++++ b/src/lookup.h
 @@ -28,6 +28,9 @@
  #include <stdlib.h>
  #include <asm/types.h>
-
+ 
 +// satisfy PR 14072 in bfd.h
 +#define PACKAGE 1
 +#define PACKAGE_VERSION 1
-
+ 
  /*
   * Initalization routine
-diff -aurd src.orig/lookup_bfd.c src/lookup_bfd.c
---- a/src/lookup_bfd.c	2012-01-16 22:34:11.000000000 +0400
-+++ b/src/lookup_bfd.c	2013-02-18 09:14:02.472984310 +0400
+diff --git a/src/lookup_bfd.c b/src/lookup_bfd.c
+index cc7010b..271d426 100644
+--- a/src/lookup_bfd.c
++++ b/src/lookup_bfd.c
 @@ -25,13 +25,13 @@
  #include <stdlib.h>
  #include <stdio.h>
@@ -47,15 +61,16 @@ diff -aurd src.orig/lookup_bfd.c src/lookup_bfd.c
  #include <unistd.h>
  #include <sys/types.h>
  #include <sys/stat.h>
-
+ 
  #include "lookup.h"
 +#include <bfd.h>
-
-
+ 
+ 
  static int lookup_bfd_init(void)
-diff -aurd src.orig/lookup_kas.c src/lookup_kas.c
---- a/src/lookup_kas.c	2012-05-31 02:43:23.000000000 +0400
-+++ b/src/lookup_kas.c	2013-02-18 09:14:07.906101713 +0400
+diff --git a/src/lookup_kas.c b/src/lookup_kas.c
+index 16e639f..556cb62 100644
+--- a/src/lookup_kas.c
++++ b/src/lookup_kas.c
 @@ -25,7 +25,6 @@
  #include <stdlib.h>
  #include <stdio.h>
@@ -66,9 +81,12 @@ diff -aurd src.orig/lookup_kas.c src/lookup_kas.c
  #include <sys/types.h>
 @@ -33,6 +32,7 @@
  #include <sys/queue.h>
-
+ 
  #include "lookup.h"
 +#include <bfd.h>
-
+ 
  struct symbol_entry {
  	char *sym_name;
+-- 
+2.1.4
+
diff --git a/package/dropwatch/0001-build.patch b/package/dropwatch/0001-build.patch
deleted file mode 100644
index eed43e8..0000000
--- a/package/dropwatch/0001-build.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 03bab84ca3f102274837e83ee6da4c997a9da018 Mon Sep 17 00:00:00 2001
-From: Tzu-Jung Lee <tjlee@ambarella.com>
-Date: Fri, 12 Jul 2013 20:00:57 +0800
-Subject: [PATCH] build: modify hardcoded gcc to support buildroot
-
-Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
-
-diff --git a/src/Makefile b/src/Makefile
-index 026b6ba..b87ae9f 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -5,10 +5,10 @@ OBJFILES := main.o lookup.o\
- 	 lookup_bfd.o lookup_kas.o
- 
- dropwatch: $(OBJFILES) 
--	gcc -g -o dropwatch $(OBJFILES) $(LDFLAGS) 
-+	$(CC) -g -o dropwatch $(OBJFILES) $(LDFLAGS)
- 
- %.o: %.c
--	gcc $(CFLAGS) $<
-+	$(CC) $(CFLAGS) $<
- clean:
- 	rm -f dropwatch *.o
- 
--- 
-1.8.3.2
-
diff --git a/package/dropwatch/0002-remove-werror.patch b/package/dropwatch/0002-remove-werror.patch
new file mode 100644
index 0000000..8006550
--- /dev/null
+++ b/package/dropwatch/0002-remove-werror.patch
@@ -0,0 +1,31 @@
+From 2462baf55939ee53bb28ff5f9474761f2a888add Mon Sep 17 00:00:00 2001
+From: Markos Chandras <markos.chandras@imgtec.com>
+Date: Fri, 16 Jun 2017 08:53:31 +0200
+Subject: [PATCH 2/2] remove werror
+
+-Werror shouldn't be used in released code since it can
+cause random build failures on moderate warnings. It also
+depends on the used toolchain since different toolchains may
+or may not print the same warnings.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 5bc6aaa..527c1da 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1,7 +1,7 @@
+ all: dropwatch
+ 
+ CPPFLAGS += -D_GNU_SOURCE
+-CFLAGS += -g -Wall -Werror $(shell pkg-config --cflags libnl-3.0)
++CFLAGS += -g -Wall $(shell pkg-config --cflags libnl-3.0)
+ LDLIBS += -lbfd -lreadline -lnl-3 -lnl-genl-3
+ 
+ OBJFILES := main.o lookup.o\
+-- 
+2.1.4
+
diff --git a/package/dropwatch/0003-remove-werror.patch b/package/dropwatch/0003-remove-werror.patch
deleted file mode 100644
index 97b26b7..0000000
--- a/package/dropwatch/0003-remove-werror.patch
+++ /dev/null
@@ -1,18 +0,0 @@
--Werror shouldn't be used in released code since it can
-cause random build failures on moderate warnings. It also
-depends on the used toolchain since different toolchains may
-or may not print the same warnings.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-Index: dropwatch-1.4/src/Makefile
-===================================================================
---- dropwatch-1.4.orig/src/Makefile
-+++ dropwatch-1.4/src/Makefile
-@@ -1,5 +1,5 @@
- all: dropwatch
--CFLAGS+=-c -g -D_GNU_SOURCE -Wall -Werror `pkg-config --cflags libnl-3.0`
-+CFLAGS+=-c -g -D_GNU_SOURCE -Wall `pkg-config --cflags libnl-3.0`
- LDFLAGS=-lbfd -lreadline -lnl-3 -lnl-genl-3
- OBJFILES := main.o lookup.o\
- 	 lookup_bfd.o lookup_kas.o
diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 3f15c84..585b035 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c2348b8d72781ab0f3ca52b8415d78ea98808280e14e7d68e76605f196bb5c4a  dropwatch-1.4.tar.xz
+sha256 4937007da3d0071c9a37ee0360cfd1657b342fd2a327d83ba992fbf3e0ea51b5  dropwatch-7c33d8a8ed105b07a46b55d71d93b36ed34c16db.tar.gz
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index a037d3f..bb91fd7 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.4
-DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.xz
-DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot
+DROPWATCH_VERSION = 7c33d8a8ed105b07a46b55d71d93b36ed34c16db
+DROPWATCH_SITE = git://git.infradead.org/users/nhorman/dropwatch.git
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
 DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
-- 
2.1.4
