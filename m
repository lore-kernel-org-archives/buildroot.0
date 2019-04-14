From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:46:46 +0200
Subject: [Buildroot] [git commit] package/util-linux: fix build with glibc
 2.29
Message-ID: <20190414125103.7D6688E810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee3404bb7a7a0d83afc5ef16796f4abdcc93c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - No autobuilders failures yet (found with
 qemu_mips64el_malta_defconfig)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch b/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
new file mode 100644
index 0000000000..381c25382a
--- /dev/null
+++ b/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
@@ -0,0 +1,32 @@
+From 963413a1adf6767ab17712097e288e1a346f63a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jan 2019 22:38:25 -0800
+Subject: [PATCH] ldattach: Check for value of _HAVE_STRUCT_TERMIOS_C_ISPEED
+
+in glibc 2.29+ checking for just existence of _HAVE_STRUCT_TERMIOS_C_ISPEED
+won't be enough, the value has to be checked
+
+see
+https://sourceware.org/git/?p=glibc.git;a=commit;h=e5a50db36eaa6e8c6427b3a971563240b633ca85
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/karelzak/util-linux/commit/963413a1adf6767ab17712097e288e1a346f63a7]
+---
+ sys-utils/ldattach.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/ldattach.c b/sys-utils/ldattach.c
+index d33d68535..fb50711eb 100644
+--- a/sys-utils/ldattach.c
++++ b/sys-utils/ldattach.c
+@@ -242,7 +242,7 @@ static int my_cfsetspeed(struct termios *ts, int speed)
+ 	 * -- we have to bypass glibc and set the speed manually (because glibc
+ 	 *    checks for speed and supports Bxxx bit rates only)...
+ 	 */
+-#ifdef _HAVE_STRUCT_TERMIOS_C_ISPEED
++#if _HAVE_STRUCT_TERMIOS_C_ISPEED
+ # define BOTHER 0010000		/* non standard rate */
+ 	dbg("using non-standard speeds");
+ 	ts->c_ospeed = ts->c_ispeed = speed;
