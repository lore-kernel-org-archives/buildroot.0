From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:03:02 +0100
Subject: [Buildroot] [git commit] wiringpi: fix static linking
Message-ID: <20170212140307.957AE82156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ac3f121f0ccc31a79b08c473e19e4d4ae922942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch 0001-Adjust-for-buildroot-build.patch to
use real static linking (command line flag '-static' for
target gpio-static).

Fixes [1]:

  [Link]
  .../output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
  ...output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
  collect2: error: ld returned 1 exit status
  make[1]: *** [gpio-static] Error 1
  make[1]: Leaving directory `.../output/build/wiringpi-2.32/gpio'

[1] http://autobuild.buildroot.net/results/b905617dda0e120d04c54daf7cae2bad236ac767

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../wiringpi/0001-Adjust-for-buildroot-build.patch | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
index 4add46e..4fddc99 100644
--- a/package/wiringpi/0001-Adjust-for-buildroot-build.patch
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -1,4 +1,4 @@
-From a16012bf4ea63f714468d80ebe101481c917e4b8 Mon Sep 17 00:00:00 2001
+From 10d5bde8d628a93993dd7305dc9a406da69f65a9 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Wed, 2 Dec 2015 00:22:26 +0100
 Subject: [PATCH] Adjust for buildroot build.
@@ -14,12 +14,12 @@ Subject: [PATCH] Adjust for buildroot build.
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  devLib/Makefile   |  9 +++++----
- gpio/Makefile     | 12 ++++++++----
+ gpio/Makefile     | 14 +++++++++-----
  wiringPi/Makefile |  7 ++++---
- 3 files changed, 17 insertions(+), 11 deletions(-)
+ 3 files changed, 18 insertions(+), 12 deletions(-)
 
 diff --git a/devLib/Makefile b/devLib/Makefile
-index 0fb0033..3117479 100644
+index 1b1ebe0..84b4d2a 100644
 --- a/devLib/Makefile
 +++ b/devLib/Makefile
 @@ -36,10 +36,10 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
@@ -36,7 +36,7 @@ index 0fb0033..3117479 100644
  
  LIBS    =
  
-@@ -67,6 +67,7 @@ $(STATIC):	$(OBJ)
+@@ -69,6 +69,7 @@ $(STATIC):	$(OBJ)
  $(DYNAMIC):	$(OBJ)
  	$Q echo "[Link (Dynamic)]"
  	$Q $(CC) -shared -Wl,-soname,libwiringPiDev.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
@@ -44,7 +44,7 @@ index 0fb0033..3117479 100644
  
  .c.o:
  	$Q echo [Compile] $<
-@@ -91,7 +92,7 @@ install:	$(DYNAMIC)
+@@ -93,7 +94,7 @@ install:	$(DYNAMIC)
  	$Q echo "[Install Dynamic Lib]"
  	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
  	$Q install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
@@ -54,7 +54,7 @@ index 0fb0033..3117479 100644
  
  .PHONY:	install-static
 diff --git a/gpio/Makefile b/gpio/Makefile
-index 7dcd090..e8e43f9 100644
+index 7dcd090..dc4be72 100644
 --- a/gpio/Makefile
 +++ b/gpio/Makefile
 @@ -32,11 +32,11 @@ endif
@@ -73,19 +73,23 @@ index 7dcd090..e8e43f9 100644
  LIBS    = -lwiringPi -lwiringPiDev -lpthread
  
  # May not need to  alter anything below this line
-@@ -55,6 +55,10 @@ gpio:	$(OBJ)
- 	$Q echo [Link]
+@@ -52,9 +52,13 @@ version.h:	../VERSION
+ 	$Q echo Need to run newVersion above.
+ 
+ gpio:	$(OBJ)
+-	$Q echo [Link]
++	$Q echo "[Link (Dynamic)]"
  	$Q $(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
  
 +gpio-static: $(OBJ)
-+	$Q echo [Link]
-+	$Q $(CC) -o gpio $(OBJ) ../wiringPi/libwiringPi.a ../devLib/libwiringPiDev.a -lpthread
++	$Q echo "[Link (Static)]"
++	$Q $(CC) -static -o gpio $(OBJ) ../wiringPi/libwiringPi.a ../devLib/libwiringPiDev.a -lpthread
 +
  .c.o:
  	$Q echo [Compile] $<
  	$Q $(CC) -c $(CFLAGS) $< -o $@
 diff --git a/wiringPi/Makefile b/wiringPi/Makefile
-index 6bbcc5d..e0ccc52 100644
+index acb6e58..8b84dc6 100644
 --- a/wiringPi/Makefile
 +++ b/wiringPi/Makefile
 @@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
@@ -119,5 +123,5 @@ index 6bbcc5d..e0ccc52 100644
  
  .PHONY:	install-static
 -- 
-2.1.4
+2.11.0
 
