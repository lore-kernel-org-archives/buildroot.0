From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:51:36 +0100
Subject: [Buildroot] [git commit] wiringpi: fix compile for missing baud
	defines
Message-ID: <20170320205452.706F5818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b29552216f988875635ab59600e1ff536685734b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
containing:

  /* These have totally bogus values and nobody uses them
     so far. Later on we'd have to use say 0x10000x and
     adjust CBAUD constant and drivers accordingly.
  #define B2500000  0x00001010
  #define B3000000  0x00001011
  #define B3500000  0x00001012
  #define B4000000  0x00001013  */

Fixes [1]:

  wiringSerial.c: In function 'serialOpen':
  wiringSerial.c:78:28: error: 'B2500000' undeclared (first use in this function)
       case 2500000: myBaud = B2500000 ; break ;
                              ^
  wiringSerial.c:78:28: note: each undeclared identifier is reported only once for each function it appears in
  wiringSerial.c:79:28: error: 'B3000000' undeclared (first use in this function)
       case 3000000: myBaud = B3000000 ; break ;
                              ^
  wiringSerial.c:80:28: error: 'B3500000' undeclared (first use in this function)
       case 3500000: myBaud = B3500000 ; break ;
                              ^
  wiringSerial.c:81:28: error: 'B4000000' undeclared (first use in this function)
       case 4000000: myBaud = B4000000 ; break ;
                              ^

[1] http://autobuild.buildroot.net/results/5be/5bea1e95d1c7b444a5f0a5770251f1af3efc9c18

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ringSerial-fix-compile-for-missing-baud-d.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
new file mode 100644
index 0000000..c9c4385
--- /dev/null
+++ b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
@@ -0,0 +1,47 @@
+From 1e7a7a625ca20633062406ce525b19d168c356af Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 20 Mar 2017 20:51:20 +0100
+Subject: [PATCH] wiringPi/wiringSerial: fix compile for missing baud defines
+
+For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
+containing:
+
+  /* These have totally bogus values and nobody uses them
+     so far. Later on we'd have to use say 0x10000x and
+     adjust CBAUD constant and drivers accordingly.
+  #define B2500000  0x00001010
+  #define B3000000  0x00001011
+  #define B3500000  0x00001012
+  #define B4000000  0x00001013  */
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ wiringPi/wiringSerial.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/wiringPi/wiringSerial.c b/wiringPi/wiringSerial.c
+index e1587ad..4ac8d1e 100644
+--- a/wiringPi/wiringSerial.c
++++ b/wiringPi/wiringSerial.c
+@@ -75,10 +75,18 @@ int serialOpen (const char *device, const int baud)
+     case 1152000:	myBaud = B1152000 ; break ;
+     case 1500000:	myBaud = B1500000 ; break ;
+     case 2000000:	myBaud = B2000000 ; break ;
++#if defined(B2500000)
+     case 2500000:	myBaud = B2500000 ; break ;
++#endif
++#if defined(B3000000)
+     case 3000000:	myBaud = B3000000 ; break ;
++#endif
++#if defined(B3500000)
+     case 3500000:	myBaud = B3500000 ; break ;
++#endif
++#if defined(B4000000)
+     case 4000000:	myBaud = B4000000 ; break ;
++#endif
+ 
+     default:
+       return -2 ;
+-- 
+2.11.0
+
