From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 21:04:28 +0100
Subject: [Buildroot] [git commit] qtuio: fix build/link issue when Qt is
	built with debug support
Message-ID: <20121030200608.956FB999A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29266a3375e2711fc63f2b10bed46efb598f329c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/6dcbf4ca3fcc5ec911ac7a1680f7cb381fd18fcb

qtuio appends _d to the library name when Qt was built with debug support,
breaking linking step for examples and staging/target install.

There's no real advantage to the _d suffix, so simply fix it by removing
the logic appending _d.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qtuio/qtuio-dont-append-_d-for-debug.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/qtuio/qtuio-dont-append-_d-for-debug.patch b/package/qtuio/qtuio-dont-append-_d-for-debug.patch
new file mode 100644
index 0000000..fbaaf19
--- /dev/null
+++ b/package/qtuio/qtuio-dont-append-_d-for-debug.patch
@@ -0,0 +1,29 @@
+[PATCH] don't append _d to library name when Qt is built with debug support
+
+qtuio appends _d to the library name when Qt was built with debug support,
+breaking linking step for examples and staging/target install.
+
+There's no real advantage to the _d suffix, so simply fix it by removing
+the logic appending _d.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/qTUIO.pro |    5 -----
+ 1 file changed, 5 deletions(-)
+
+Index: qtuio-abe4973ff6/src/qTUIO.pro
+===================================================================
+--- qtuio-abe4973ff6.orig/src/qTUIO.pro
++++ qtuio-abe4973ff6/src/qTUIO.pro
+@@ -16,11 +16,6 @@
+ win32:LIBS += ws2_32.lib \
+     winmm.lib
+ 
+-# Changes the name of the target, when is debug mode
+-CONFIG( debug, debug|release ) { 
+-    TARGET = $${TARGET}_d
+-    BUILD_NAME = debug
+-}
+ CONFIG( release, debug|release ):BUILD_NAME = release
+ 
+ # Temporary folders for the auxiliar files
