From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] valgrind: fix build without
	largefile support
Message-ID: <20091003210636.0100A776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=59c8e4de91bb0499be741252fc4f6ec10d7dc5b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |    3 ++-
 package/valgrind/valgrind-largefile.patch |   27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 package/valgrind/valgrind-largefile.patch

diff --git a/CHANGES b/CHANGES
index 9cd4835..1f9081a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,8 @@
 	festival, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libuuid, ltrace, mdadm,
 	ncftp, netkittelnet, openssl, python, quagga, radvd, samba,
-	speech-tools, squashfs, syslinux, u-boot, xdata_xcursor-themes
+	speech-tools, squashfs, syslinux, u-boot, valgrind,
+	xdata_xcursor-themes
 
 	Removed package: mdnsresponder, mpatrol
 
diff --git a/package/valgrind/valgrind-largefile.patch b/package/valgrind/valgrind-largefile.patch
new file mode 100644
index 0000000..9ef5708
--- /dev/null
+++ b/package/valgrind/valgrind-largefile.patch
@@ -0,0 +1,27 @@
+[PATCH] valgrind: don't enable largefile support unconditionally on uClibc
+
+uClibc can be compiled without largefile support (and errors out if
+_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
+is detected.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ coregrind/m_ume.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: valgrind-3.2.3/coregrind/m_ume.c
+===================================================================
+--- valgrind-3.2.3.orig/coregrind/m_ume.c
++++ valgrind-3.2.3/coregrind/m_ume.c
+@@ -31,7 +31,11 @@
+ 
+ 
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ 
+ // It seems that on SuSE 9.1 (x86) something in <fcntl.h> messes up stuff
+ // acquired indirectly from vki-x86-linux.h.  Therefore our headers must be
-- 
1.6.3.3
