From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 14:28:37 +0200
Subject: [Buildroot] [PATCH 1/2] wvstreams: fix build failures
Message-ID: <1368102518-14826-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix wvstreams build failures such as
http://autobuild.buildroot.org/results/8cb2904113a5e63d6170c085f77a8040d50a0138/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wvstreams/wvstreams-0004-build-fixes.patch |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/wvstreams/wvstreams-0004-build-fixes.patch

diff --git a/package/wvstreams/wvstreams-0004-build-fixes.patch b/package/wvstreams/wvstreams-0004-build-fixes.patch
new file mode 100644
index 0000000..21792d7
--- /dev/null
+++ b/package/wvstreams/wvstreams-0004-build-fixes.patch
@@ -0,0 +1,40 @@
+Add missing includes for proper build on Linux/glibc
+
+The current wvstreams code doesn't build on Linux/glibc, with error
+about chmod() not being available (for wvunixdgsocket.cc) or umask()
+not being available (for wvatomicfile.cc). Those errors turn out to be
+missing includes. Those includes were in fact already done, but
+conditionally for MacOS. We make them unconditional (it probably
+breaks other platforms, but since Buildroot is Linux only, we don't
+care).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/ipstreams/wvunixdgsocket.cc
+===================================================================
+--- a/ipstreams/wvunixdgsocket.cc
++++ b/ipstreams/wvunixdgsocket.cc
+@@ -1,8 +1,6 @@
+ #include "wvunixdgsocket.h"
+-#ifdef MACOS
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-#endif
+ 
+ WvUnixDGSocket::WvUnixDGSocket(WvStringParm filename, bool _server, int perms)
+     : socketfile(filename)
+Index: b/streams/wvatomicfile.cc
+===================================================================
+--- a/streams/wvatomicfile.cc
++++ b/streams/wvatomicfile.cc
+@@ -10,10 +10,7 @@
+ #include "wvatomicfile.h"
+ #include "wvfileutils.h"
+ #include "wvstrutils.h"
+-
+-#ifdef MACOS
+ #include <sys/stat.h>
+-#endif
+ 
+ WvAtomicFile::WvAtomicFile(WvStringParm filename, int flags, mode_t create_mode)
+     : tmp_file(WvString::null)
-- 
1.7.9.5
