From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 22:41:18 +0200
Subject: [Buildroot] [PATCH 1/5] package/mplayer: fix musl build error
Message-ID: <20170410204122.13382-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/08e/08ed316677f519c8005928366aea89570527a033/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/0006-musl-ldt.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/mplayer/0006-musl-ldt.patch

diff --git a/package/mplayer/0006-musl-ldt.patch b/package/mplayer/0006-musl-ldt.patch
new file mode 100644
index 000000000..8165f6f56
--- /dev/null
+++ b/package/mplayer/0006-musl-ldt.patch
@@ -0,0 +1,22 @@
+Fixes musl build error
+
+loader/ldt_keeper.o: In function `Setup_LDT_Keeper':
+ldt_keeper.c:(.text+0xab): undefined reference to `modify_ldt'
+
+Downloaded from
+https://github.com/dimkr/rlsd2/blob/master/rules/mplayer/musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -rup MPlayer-1.1.1-orig/loader/ldt_keeper.c MPlayer-1.1.1/loader/ldt_keeper.c
+--- MPlayer-1.1.1-orig/loader/ldt_keeper.c	2015-04-23 15:07:09.580805888 +0300
++++ MPlayer-1.1.1/loader/ldt_keeper.c	2015-04-23 15:08:07.736807270 +0300
+@@ -47,7 +47,7 @@
+ #if defined(__GLIBC__) &&  (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ == 0))
+ _syscall3( int, modify_ldt, int, func, void *, ptr, unsigned long, bytecount );
+ #else
+-int modify_ldt(int func, void *ptr, unsigned long bytecount);
++#define modify_ldt(func, ptr, bytecount) syscall(__NR_modify_ldt, func, ptr, bytecount)
+ #endif
+ #else
+ #if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
-- 
2.11.0
