From: Atanas Palavrov <palavrov@gmail.com>
Date: Thu, 21 Jun 2018 11:49:08 +0300
Subject: [Buildroot] [PATCH 1/1] wiringpi: bump version to
 8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
Message-ID: <20180621084908.27568-1-palavrov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Atanas Palavrov <palavrov@gmail.com>

    Updating wiringPi to version 2.46 which supports RPi3B+

Signed-off-by: Atanas Palavrov <palavrov@gmail.com>
---
 .../0001-Adjust-for-buildroot-build.patch     | 24 ++++++++++---------
 ...erial-fix-compile-for-missing-baud-d.patch |  7 +++---
 package/wiringpi/wiringpi.hash                |  2 +-
 package/wiringpi/wiringpi.mk                  |  2 +-
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
index 520555c8e8..7d5b4b6007 100644
--- a/package/wiringpi/0001-Adjust-for-buildroot-build.patch
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -1,7 +1,7 @@
-From 17ffb0cb301d4bf6ef900c8698d716f68cb77360 Mon Sep 17 00:00:00 2001
+From 80bb549ea1bd52b25cf3d46315e070657791ed95 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Wed, 2 Dec 2015 00:22:26 +0100
-Subject: [PATCH] Adjust for buildroot build.
+Subject: [PATCH 1/2] Adjust for buildroot build.
 
  - enable CC override
  - fix devLib/gpio include path for local build (without installing first)
@@ -15,8 +15,8 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  devLib/Makefile   |  9 +++++----
  gpio/Makefile     | 14 +++++++++-----
- wiringPi/Makefile |  7 ++++---
- 3 files changed, 18 insertions(+), 12 deletions(-)
+ wiringPi/Makefile |  9 +++++----
+ 3 files changed, 19 insertions(+), 13 deletions(-)
 
 diff --git a/devLib/Makefile b/devLib/Makefile
 index cf665d6..3fb41e8 100644
@@ -54,7 +54,7 @@ index cf665d6..3fb41e8 100644
  
  .PHONY:	install-static
 diff --git a/gpio/Makefile b/gpio/Makefile
-index f41a005..7095fa5 100644
+index 9ec160d..360d64c 100644
 --- a/gpio/Makefile
 +++ b/gpio/Makefile
 @@ -32,11 +32,11 @@ endif
@@ -89,10 +89,10 @@ index f41a005..7095fa5 100644
  	$Q echo [Compile] $<
  	$Q $(CC) -c $(CFLAGS) $< -o $@
 diff --git a/wiringPi/Makefile b/wiringPi/Makefile
-index e1868b9..68c950e 100644
+index 287fa58..d51edc2 100644
 --- a/wiringPi/Makefile
 +++ b/wiringPi/Makefile
-@@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
+@@ -36,11 +36,11 @@ DYNAMIC=libwiringPi.so.$(VERSION)
  
  #DEBUG	= -g -O0
  DEBUG	= -O2
@@ -101,11 +101,13 @@ index e1868b9..68c950e 100644
  INCLUDE	= -I.
  DEFS	= -D_GNU_SOURCE
 -CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
+-#CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Wconversion -Winline $(INCLUDE) -pipe -fPIC
 +CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
++#CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Wconversion -Winline $(INCLUDE) -pipe -fPIC
  
  LIBS    = -lm -lpthread -lrt -lcrypt
  
-@@ -79,6 +79,7 @@ $(STATIC):	$(OBJ)
+@@ -76,6 +76,7 @@ static:
  $(DYNAMIC):	$(OBJ)
  	$Q echo "[Link (Dynamic)]"
  	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) $(LIBS) $(OBJ)
@@ -113,7 +115,7 @@ index e1868b9..68c950e 100644
  
  .c.o:
  	$Q echo [Compile] $<
-@@ -104,7 +105,7 @@ install:	$(DYNAMIC)
+@@ -101,7 +102,7 @@ install:	$(DYNAMIC)
  	$Q echo "[Install Dynamic Lib]"
  	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
  	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
@@ -121,7 +123,7 @@ index e1868b9..68c950e 100644
 +	$Q ln -sf libwiringPi.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
  	$Q $(LDCONFIG)
  
- .PHONY:	install-static
+ .PHONY:	install-deb
 -- 
-2.11.0
+2.17.0
 
diff --git a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
index c9c4385d48..6ed7a438b5 100644
--- a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
+++ b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
@@ -1,7 +1,8 @@
-From 1e7a7a625ca20633062406ce525b19d168c356af Mon Sep 17 00:00:00 2001
+From 363665caafd88724febac371ac7df95f021baafc Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Mon, 20 Mar 2017 20:51:20 +0100
-Subject: [PATCH] wiringPi/wiringSerial: fix compile for missing baud defines
+Subject: [PATCH 2/2] wiringPi/wiringSerial: fix compile for missing baud
+ defines
 
 For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
 containing:
@@ -43,5 +44,5 @@ index e1587ad..4ac8d1e 100644
      default:
        return -2 ;
 -- 
-2.11.0
+2.17.0
 
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index f4832e5fa8..62e67a6d6a 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4eae1d4f37f77534b1e2db4678a1003a5fd7ced4721c340527e3476d0bed1d9f wiringpi-96344ff7125182989f98d3be8d111952a8f74e15.tar.gz
+sha256 c21c1ff87206a2ce1e4a4d515ac36015735d114205d455afefff8a84fdc54710 wiringpi-8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index f2e9e246d9..11abd62b0b 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # using git commit id instead of (wrong) 2.44 git tag (Bug 10391)
-WIRINGPI_VERSION = 96344ff7125182989f98d3be8d111952a8f74e15
+WIRINGPI_VERSION = 8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPL-3.0+
-- 
2.17.1
