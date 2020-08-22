From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 22:23:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build with gcc 9
Message-ID: <20200822202350.2341347-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/85f7c746ae1cc19f8839f892f0c280dcb0444ea9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/0006-fix-cmsg_fd.patch | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/kismet/0006-fix-cmsg_fd.patch

diff --git a/package/kismet/0006-fix-cmsg_fd.patch b/package/kismet/0006-fix-cmsg_fd.patch
new file mode 100644
index 0000000000..494486bb71
--- /dev/null
+++ b/package/kismet/0006-fix-cmsg_fd.patch
@@ -0,0 +1,31 @@
+Fix cmsg_fd
+
+Defining fd after a struct cmsghdr results in the following build
+failure with at least gcc 9:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
+                 from ipc_remote.h:61,
+                 from ipc_remote.cc:34:
+/home/buildroot/autobuild/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:289:33: error: flexible array member 'cmsghdr::__cmsg_data' not at end of 'struct<unnamed>'
+  289 |     __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
+      |                                 ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/307f234edd6dffdb2419a2be5209ef5cd3b6d8d1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable (offending code removed)]
+
+diff -Naurp kismet-2016-07-R1-orig/ipc_remote.cc kismet-2016-07-R1/ipc_remote.cc
+--- kismet-2016-07-R1-orig/ipc_remote.cc	2020-08-22 22:09:41.358657927 +0200
++++ kismet-2016-07-R1/ipc_remote.cc	2020-08-22 22:10:39.770835468 +0200
+@@ -941,8 +941,8 @@ int RootIPCRemote::OpenFDPassSock() {
+ }
+ 
+ typedef struct {
+-	struct cmsghdr header;
+ 	int            fd;
++	struct cmsghdr header;
+ } __attribute__((packed)) cmsg_fd;
+ 
+ int RootIPCRemote::SendDescriptor(int in_fd) {
-- 
2.28.0
