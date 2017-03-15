From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 15 Mar 2017 22:08:28 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
Message-ID: <20170315210828.3784-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebase 0001-Adjust-for-buildroot-build.patch
- delete 0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
  (all changes are incorporated into wiringpi-2.44)
- remove useless hash file (git download)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../wiringpi/0001-Adjust-for-buildroot-build.patch | 26 +++++-----
 ...de-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch | 60 ----------------------
 package/wiringpi/wiringpi.hash                     |  2 -
 package/wiringpi/wiringpi.mk                       |  2 +-
 4 files changed, 14 insertions(+), 76 deletions(-)
 delete mode 100644 package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
 delete mode 100644 package/wiringpi/wiringpi.hash

diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
index 4fddc9951..520555c8e 100644
--- a/package/wiringpi/0001-Adjust-for-buildroot-build.patch
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -1,4 +1,4 @@
-From 10d5bde8d628a93993dd7305dc9a406da69f65a9 Mon Sep 17 00:00:00 2001
+From 17ffb0cb301d4bf6ef900c8698d716f68cb77360 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Wed, 2 Dec 2015 00:22:26 +0100
 Subject: [PATCH] Adjust for buildroot build.
@@ -19,7 +19,7 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  3 files changed, 18 insertions(+), 12 deletions(-)
 
 diff --git a/devLib/Makefile b/devLib/Makefile
-index 1b1ebe0..84b4d2a 100644
+index cf665d6..3fb41e8 100644
 --- a/devLib/Makefile
 +++ b/devLib/Makefile
 @@ -36,10 +36,10 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
@@ -54,7 +54,7 @@ index 1b1ebe0..84b4d2a 100644
  
  .PHONY:	install-static
 diff --git a/gpio/Makefile b/gpio/Makefile
-index 7dcd090..dc4be72 100644
+index f41a005..7095fa5 100644
 --- a/gpio/Makefile
 +++ b/gpio/Makefile
 @@ -32,11 +32,11 @@ endif
@@ -63,14 +63,14 @@ index 7dcd090..dc4be72 100644
  DEBUG	= -O2
 -CC	= gcc
 -INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
--CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+-CFLAGS	= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe
 +CC	?= gcc
 +INCLUDE	= -I../wiringPi -I../devLib
-+CFLAGS	+= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
++CFLAGS	+= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe
  
 -LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
 +LDFLAGS	= -L../wiringPi -L../devLib
- LIBS    = -lwiringPi -lwiringPiDev -lpthread
+ LIBS    = -lwiringPi -lwiringPiDev -lpthread -lrt -lm -lcrypt
  
  # May not need to  alter anything below this line
 @@ -52,9 +52,13 @@ version.h:	../VERSION
@@ -89,7 +89,7 @@ index 7dcd090..dc4be72 100644
  	$Q echo [Compile] $<
  	$Q $(CC) -c $(CFLAGS) $< -o $@
 diff --git a/wiringPi/Makefile b/wiringPi/Makefile
-index acb6e58..8b84dc6 100644
+index e1868b9..68c950e 100644
 --- a/wiringPi/Makefile
 +++ b/wiringPi/Makefile
 @@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
@@ -100,20 +100,20 @@ index acb6e58..8b84dc6 100644
 +CC	?= gcc
  INCLUDE	= -I.
  DEFS	= -D_GNU_SOURCE
--CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
-+CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
+-CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
++CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
  
- LIBS    =
+ LIBS    = -lm -lpthread -lrt -lcrypt
  
-@@ -90,6 +90,7 @@ $(STATIC):	$(OBJ)
+@@ -79,6 +79,7 @@ $(STATIC):	$(OBJ)
  $(DYNAMIC):	$(OBJ)
  	$Q echo "[Link (Dynamic)]"
- 	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) -lpthread $(OBJ)
+ 	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) $(LIBS) $(OBJ)
 +	$Q ln -sf libwiringPi.so.$(VERSION) libwiringPi.so
  
  .c.o:
  	$Q echo [Compile] $<
-@@ -115,7 +116,7 @@ install:	$(DYNAMIC)
+@@ -104,7 +105,7 @@ install:	$(DYNAMIC)
  	$Q echo "[Install Dynamic Lib]"
  	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
  	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
diff --git a/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch b/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
deleted file mode 100644
index 6480e3c44..000000000
--- a/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7f65eb37a82a6d9b095d9c8f262ad9dd205acd03 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Jan 2016 16:57:38 -0800
-Subject: [PATCH] include <asm/ioctl.h> directly for _IOC_SIZEBITS
-
-Fixes errors like
-| wiringPiSPI.c: In function 'wiringPiSPIDataRW':
-| wiringPiSPI.c:89:35: error: '_IOC_SIZEBITS' undeclared (first use in
-this function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Patch from https://raw.githubusercontent.com/agherzan/meta-raspberrypi/master/recipes-devtools/wiringPi/wiringpi/0001-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch]
-Signed-off-by: Peter Seiderere <ps.report@gmx.net>
----
-Upstream-Status: Submitted
-
- wiringPi/wiringPi.c    | 1 +
- wiringPi/wiringPiI2C.c | 1 +
- wiringPi/wiringPiSPI.c | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
-index 32e5100..cb5db9d 100644
---- a/wiringPi/wiringPi.c
-+++ b/wiringPi/wiringPi.c
-@@ -64,6 +64,7 @@
- #include <time.h>
- #include <fcntl.h>
- #include <pthread.h>
-+#include <asm/ioctl.h>
- #include <sys/time.h>
- #include <sys/mman.h>
- #include <sys/stat.h>
-diff --git a/wiringPi/wiringPiI2C.c b/wiringPi/wiringPiI2C.c
-index c787bce..efdf53c 100644
---- a/wiringPi/wiringPiI2C.c
-+++ b/wiringPi/wiringPiI2C.c
-@@ -52,6 +52,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
-+#include <asm/ioctl.h>
- 
- #include "wiringPi.h"
- #include "wiringPiI2C.h"
-diff --git a/wiringPi/wiringPiSPI.c b/wiringPi/wiringPiSPI.c
-index 453df31..ae3c7d9 100644
---- a/wiringPi/wiringPiSPI.c
-+++ b/wiringPi/wiringPiSPI.c
-@@ -27,6 +27,7 @@
- #include <fcntl.h>
- #include <errno.h>
- #include <string.h>
-+#include <asm/ioctl.h>
- #include <sys/ioctl.h>
- #include <linux/spi/spidev.h>
- 
--- 
-2.7.0
-
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
deleted file mode 100644
index abddaf9b2..000000000
--- a/package/wiringpi/wiringpi.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256 0775e3bfa2df2131746c75d611ad354e5c884661be0d9de9fd786fc96f6ad918 wiringPi-2.32.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index ce0819dac..3227fb26d 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRINGPI_VERSION = 2.32
+WIRINGPI_VERSION = 2.44
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPLv3+
-- 
2.11.0
