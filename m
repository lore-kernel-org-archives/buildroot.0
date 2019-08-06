From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:15:08 +0200
Subject: [Buildroot] [git commit] package/mdadm: fix build with musl libc
Message-ID: <20190806201232.F03FA8E4B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=735b2fe88080d876ad7063912cc2e1f58a628850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to make sys/sysmacros.h include unconditional for the
major/minor macros. musl libc recently removed include of
sys/sysmacros.h from sys/types.h (musl commit a31a30a0076c28).

Fixes:
http://autobuild.buildroot.net/results/37d6b351f989ceaf1acf0fe0b3b9be6d1c5c300e/
http://autobuild.buildroot.net/results/a0d9b49c99b36468e2ef506d55a1c3cbbcf43a4e/
http://autobuild.buildroot.net/results/979b5e9dd8fb27969ed6bd0b82d9dd5f88b2b986/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...adm.h-include-sysmacros.h-unconditionally.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch b/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
new file mode 100644
index 0000000000..c8944c8475
--- /dev/null
+++ b/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
@@ -0,0 +1,35 @@
+From 6c781ad75d92c6f65832810c44afcba1b2dffc41 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 6 Aug 2019 16:01:15 +0300
+Subject: [PATCH] mdadm.h: include sysmacros.h unconditionally
+
+musl libc now also requires sys/sysmacros.h for the major/minor macros.
+All supported libc implementations carry sys/sysmacros.h, including
+diet-libc, klibc, and uclibc-ng.
+
+Cc: Hauke Mehrtens <hauke@hauke-m.de>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://marc.info/?l=linux-raid&m=156509677018508
+
+ mdadm.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/mdadm.h b/mdadm.h
+index c36d7fdb10f6..d61a9ca82dc1 100644
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -45,10 +45,8 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
+ #include	<errno.h>
+ #include	<string.h>
+ #include	<syslog.h>
+-#ifdef __GLIBC__
+ /* Newer glibc requires sys/sysmacros.h directly for makedev() */
+ #include	<sys/sysmacros.h>
+-#endif
+ #ifdef __dietlibc__
+ #include	<strings.h>
+ /* dietlibc has deprecated random and srandom!! */
+-- 
+2.20.1
+
