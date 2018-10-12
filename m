From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 11:24:58 +0200
Subject: [Buildroot] [git commit] ntp: fix build for no-MMU
Message-ID: <20181012092820.DA0A68360C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d759ced52cb461a4460f4c513f2f6993292bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Code rearrange in the latest ntp version exposed code that used to be
hidden behind HAVE_WORKING_FORK. Put this code back where it belongs.

Fixes:
http://autobuild.buildroot.net/results/9f4/9f4710b451df1a60f95ab6503cfb7788ad998a65/
http://autobuild.buildroot.net/results/d0b/d0b20a6c0f37a8b06841afc2764c8aab6ffd27d2/
http://autobuild.buildroot.net/results/85c/85c89f5e9d36915567b8d14b9c99e3720c866577/

Cc: Artem Panfilov <apanfilov@spectracom.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0003-fix-nommu.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/ntp/0003-fix-nommu.patch b/package/ntp/0003-fix-nommu.patch
new file mode 100644
index 0000000000..53bf4dfcf3
--- /dev/null
+++ b/package/ntp/0003-fix-nommu.patch
@@ -0,0 +1,22 @@
+Fix no-MMU build
+
+The detach_from_terminal() is unused for no-MMU, but it depends on symbols
+that are not defined for no-MMU. Don't define detach_from_terminal() when
+HAVE_WORKING_FORK is not defined.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://bugs.ntp.org/show_bug.cgi?id=3538
+
+diff -Nuar ntp-4.2.8p12.orig/ntpd/ntpd.c ntp-4.2.8p12/ntpd/ntpd.c
+--- ntp-4.2.8p12.orig/ntpd/ntpd.c	2018-08-14 14:51:30.000000000 +0300
++++ ntp-4.2.8p12/ntpd/ntpd.c	2018-10-12 08:19:01.291781773 +0300
+@@ -529,7 +529,7 @@
+ }
+ #endif	/* !SIM */
+ 
+-#if !defined(SIM) && !defined(SYS_WINNT)
++#if !defined(SIM) && !defined(SYS_WINNT) && defined(HAVE_WORKING_FORK)
+ /*
+  * Detach from terminal (much like daemon())
+  * Nothe that this function calls exit()
