From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 09:15:21 +0200
Subject: [Buildroot] [git commit] zeromq: fix pkg-config file for static
	linking
Message-ID: <20150513071940.5343781DEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9876fb0990cc8232eb21f5aaf34f442b3bb5667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/faf/faf0bb00fccb1350afaef55f6cf14c11a5f5dc3c/
http://autobuild.buildroot.net/results/8d2/8d279baa4c8bffbb01f897119092c7b736942df4/
http://autobuild.buildroot.net/results/4d3/4d3dea604da9a5a1e7fe20548813f8de474ae33f/
http://autobuild.buildroot.net/results/fd6/fd602617839817352763e51754553960b7f795ac/

And many more.

Libzmq uses C++ standard library features, so users of it should link
against that as well when statically linking.

Add it to Libs.private so users using pkg-config automatically gets the
correct linker flags.

Patch is upstream:
https://github.com/zeromq/libzmq/pull/1398

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...q-Fix-pkg-config-files-for-static-linking.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/0003-libzmq-Fix-pkg-config-files-for-static-linking.patch b/package/zeromq/0003-libzmq-Fix-pkg-config-files-for-static-linking.patch
new file mode 100644
index 0000000..11acec2
--- /dev/null
+++ b/package/zeromq/0003-libzmq-Fix-pkg-config-files-for-static-linking.patch
@@ -0,0 +1,29 @@
+From e89577d30c278fba0f9e40266ceb6fb2821907d5 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Wed, 13 May 2015 08:01:34 +0200
+Subject: [PATCH] libzmq: Fix pkg-config files for static linking
+
+Libzmq uses C++ standard library features, so users of it should link
+against that as well when statically linking.
+
+Add it to Libs.private so users using pkg-config automatically gets the
+correct linker flags.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/libzmq.pc.in       | 1 +
+ 1 file changed, 1 insertions(+)
+
+diff --git a/src/libzmq.pc.in b/src/libzmq.pc.in
+index ba155a3..52a39f7 100644
+--- a/src/libzmq.pc.in
++++ b/src/libzmq.pc.in
+@@ -7,4 +7,5 @@ Name: libzmq
+ Description: 0MQ c++ library
+ Version: @VERSION@
+ Libs: -L${libdir} -lzmq
++Libs.private: -lstdc++
+ Cflags: -I${includedir}
+-- 
+2.1.4
+
