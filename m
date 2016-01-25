From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:31:26 +0100
Subject: [Buildroot] [git commit] package/transmission: fix musl build
Message-ID: <20160201224659.5DD4A80AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acf3785e8fe9031a083cd086a28b69caeffd7dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../transmission/0002-musl-missing-header.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/transmission/0002-musl-missing-header.patch b/package/transmission/0002-musl-missing-header.patch
new file mode 100644
index 0000000..ebb74cb
--- /dev/null
+++ b/package/transmission/0002-musl-missing-header.patch
@@ -0,0 +1,36 @@
+Fix musl build
+
+Downloaded from
+https://cgit.gentoo.org/proj/musl.git/tree/net-p2p/transmission/files/transmission-2.84-musl-missing-header.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+libtransmission/transmission.h: add missing <sys/types.h>
+
+transmission.h and several files including it, like bitfield.c and fdlimits.h
+make reference to ssize_t, off_t and other types defined in <sys/types.h> but
+never include the header.  By including <sys/types.h> in transmission.h, the
+required type definitions are propagated to all files that need them.
+
+Not including <sys/types.h> on glibc and uClibc systems does not pose a problem
+because of the way the headers stack in those C Standard Libraries, but on musl
+excluding <sys/types.h> leads to compile time failure.
+
+For the POSIX specs, see
+
+http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/sys_types.h.html
+
+Signed-of-by: Anthony G. Basile <blueness@gentoo.org>
+
+diff -Naur transmission-2.84.orig/libtransmission/transmission.h transmission-2.84/libtransmission/transmission.h
+--- transmission-2.84.orig/libtransmission/transmission.h	2014-07-01 13:09:01.682910744 -0400
++++ transmission-2.84/libtransmission/transmission.h	2015-07-19 03:11:07.379219181 -0400
+@@ -28,6 +28,7 @@
+ 
+ #include <inttypes.h> /* uintN_t */
+ #include <time.h> /* time_t */
++#include <sys/types.h>
+ 
+ #ifdef WIN32
+  #define __USE_MINGW_ANSI_STDIO 1
