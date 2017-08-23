From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:20:21 +0200
Subject: [Buildroot] [git commit] dbus-cpp: fix build with gcc 7.x
Message-ID: <20170823211336.D360080790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f357180fbf536755eca72e45a23b75470037002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to dbus-cpp to make it build with gcc 7.x.

Fixes:

  http://autobuild.buildroot.net/results/07a7559c0efeeda16c239e0fa06259d4cd48c71b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...3-src-pipe.c-fix-build-error-with-gcc-7.x.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch b/package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch
new file mode 100644
index 0000000..6f3e624
--- /dev/null
+++ b/package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch
@@ -0,0 +1,36 @@
+From 167042116f523f90911f3a28c4ec065918d56cc9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 22 Aug 2017 00:02:52 +0200
+Subject: [PATCH] src/pipe.c: fix build error with gcc 7.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The write function takes a char* as argument, not a char.
+
+Fixes:
+
+pipe.cpp: In member function ???void DBus::Pipe::signal()???:
+pipe.cpp:86:29: error: invalid conversion from ???char??? to ???const void*??? [-fpermissive]
+   ::write(_fd_write, '\0', 1);
+                             ^
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/pipe.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pipe.cpp b/src/pipe.cpp
+index 01211b3..d0572c7 100644
+--- a/src/pipe.cpp
++++ b/src/pipe.cpp
+@@ -83,5 +83,5 @@ ssize_t Pipe::read(void *buffer, unsigned int &nbytes)
+ void Pipe::signal()
+ {
+   // TODO: ignoring return of read/write generates warning; maybe relevant for eventloop work...
+-  ::write(_fd_write, '\0', 1);
++  ::write(_fd_write, "\0", 1);
+ }
+-- 
+2.9.4
+
