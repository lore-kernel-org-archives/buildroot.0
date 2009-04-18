From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 18 Apr 2009 14:13:53 +0000 (UTC)
Subject: [Buildroot] svn commit: [26151] trunk/buildroot/package/busybox
Message-ID: <20090418141353.D6F6477196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-18 14:13:53 +0000 (Sat, 18 Apr 2009)
New Revision: 26151

Log:
busybox: 1.14.0 fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.14.0-acpid.patch
   trunk/buildroot/package/busybox/busybox-1.14.0-defconfig.patch
   trunk/buildroot/package/busybox/busybox-1.14.0-unaligned.patch

Removed:
   trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.14.0-acpid.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-acpid.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-acpid.patch	2009-04-18 14:13:53 UTC (rev 26151)
@@ -0,0 +1,13 @@
+--- busybox-1.14.0/util-linux/acpid.c	Tue Apr 14 01:43:11 2009
++++ busybox-1.14.0-acpid/util-linux/acpid.c	Sat Apr 18 13:33:19 2009
+@@ -78,8 +78,8 @@
+ 	// goto configuration directory
+ 	xchdir(opt_conf);
+ 
+-//	// setup signals
+-//	bb_signals(BB_FATAL_SIGS, record_signo);
++	// prevent zombies
++	signal(SIGCHLD, SIG_IGN);
+ 
+ 	// no explicit evdev files given? -> use proc event interface
+ 	if (!*argv) {

Added: trunk/buildroot/package/busybox/busybox-1.14.0-defconfig.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-defconfig.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-defconfig.patch	2009-04-18 14:13:53 UTC (rev 26151)
@@ -0,0 +1,11 @@
+--- busybox-1.14.0/scripts/defconfig	Tue Apr 14 01:42:52 2009
++++ busybox-1.14.0-defconfig/scripts/defconfig	Fri Apr 17 01:08:24 2009
+@@ -579,7 +579,7 @@
+ CONFIG_EJECT=y
+ CONFIG_FEATURE_EJECT_SCSI=y
+ CONFIG_FBSPLASH=y
+-CONFIG_FLASH_ERASEALL=y
++# CONFIG_FLASH_ERASEALL is not set
+ CONFIG_IONICE=y
+ # CONFIG_INOTIFYD is not set
+ CONFIG_LAST=y

Deleted: trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch	2009-04-18 14:13:49 UTC (rev 26150)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-unaligned-fix.patch	2009-04-18 14:13:53 UTC (rev 26151)
@@ -1,28 +0,0 @@
-[PATCH] fix move_to_unaligned32() for !x86
-
-get_unaligned() got changed into move_{from,to}_unaligned() in r24334, but
-the temporary variabled used to make sure we can take the address of the
-source argument for memcpy() got removed. Later on in r26068 dnsd.c got
-changed to call move_to_unaligned with htons/htonl as source breaking
-the build for !x86.
-
-Fix it by reintroducing the temporary variable.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/platform.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: busybox-1.14.0/include/platform.h
-===================================================================
---- busybox-1.14.0.orig/include/platform.h
-+++ busybox-1.14.0/include/platform.h
-@@ -173,7 +173,7 @@
- /* performs reasonably well (gcc usually inlines memcpy here) */
- #define move_from_unaligned16(v, u16p) (memcpy(&(v), (u16p), 2))
- #define move_from_unaligned32(v, u32p) (memcpy(&(v), (u32p), 4))
--#define move_to_unaligned32(u32p, v)   (memcpy((u32p), &(v), 4))
-+#define move_to_unaligned32(u32p, v)   do { uint32_t __t = (v); memcpy((u32p), &__t, 4); } while (0)
- #endif
- 
- /* ---- Networking ------------------------------------------ */

Added: trunk/buildroot/package/busybox/busybox-1.14.0-unaligned.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-unaligned.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-unaligned.patch	2009-04-18 14:13:53 UTC (rev 26151)
@@ -0,0 +1,14 @@
+--- busybox-1.14.0/include/platform.h	Tue Apr 14 01:43:05 2009
++++ busybox-1.14.0-unaligned/include/platform.h	Sat Apr 18 00:14:34 2009
+@@ -173,7 +173,10 @@
+ /* performs reasonably well (gcc usually inlines memcpy here) */
+ #define move_from_unaligned16(v, u16p) (memcpy(&(v), (u16p), 2))
+ #define move_from_unaligned32(v, u32p) (memcpy(&(v), (u32p), 4))
+-#define move_to_unaligned32(u32p, v)   (memcpy((u32p), &(v), 4))
++#define move_to_unaligned32(u32p, v) do { \
++	uint32_t __t = (v); \
++	memcpy((u32p), &__t, 4); \
++} while (0)
+ #endif
+ 
+ /* ---- Networking ------------------------------------------ */
