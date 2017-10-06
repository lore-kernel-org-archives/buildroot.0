From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:23:35 +0200
Subject: [Buildroot] [git commit] trinity: undefined UIO_MAXIOV need sys/io.h
Message-ID: <20171006171618.D128C81187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da34a889d218ba5722774a769842ed08a64279ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This upstream patch fixes the build error produced by building for
powerpc 32bit after the glibc bump to 2.26 with the following internal
toolchain config.

gcc5.4.0
glibc2.26
bin2.28.1
linux4.1.43

Failure log:
  CC	net/proto-ipv4.o
net/proto-ipv4.c: In function ???ip_setsockopt???:
net/proto-ipv4.c:231:49: error: ???UIO_MAXIOV??? undeclared (first use in this function); did you mean ???_IO_MAGIC????
   so->optlen = rnd() % sizeof(unsigned long)*(2*UIO_MAXIOV+512);
                                                 ^~~~~~~~~~
                                                 _IO_MAGIC

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: add Matthew's Sob to the patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...06-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch b/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch
new file mode 100644
index 0000000..27c7850
--- /dev/null
+++ b/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch
@@ -0,0 +1,40 @@
+From dd7fc8b44cc8bb8a7e9dc03aa3aa57fbefbf433b Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Tue, 20 Jun 2017 22:43:01 +0000
+Subject: [PATCH] Include sys/io.h for UIO_MAXIOV symbol.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch fixes this build error.
+
+  CC	net/proto-ipv4.o
+net/proto-ipv4.c: In function ???ip_setsockopt???:
+net/proto-ipv4.c:231:49: error: ???UIO_MAXIOV??? undeclared (first use in this function); did you mean ???_IO_MAGIC????
+   so->optlen = rnd() % sizeof(unsigned long)*(2*UIO_MAXIOV+512);
+                                                 ^~~~~~~~~~
+                                                 _IO_MAGIC
+
+Upstream: https://github.com/kernelslacker/trinity/commit/dd7fc8b44cc8bb8a7e9dc03aa3aa57fbefbf433b
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ net/proto-ipv4.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/proto-ipv4.c b/net/proto-ipv4.c
+index b77364e..9ffaa5e 100644
+--- a/net/proto-ipv4.c
++++ b/net/proto-ipv4.c
+@@ -1,6 +1,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <sys/uio.h>
+ #include <netinet/in.h>
+ #include <netinet/udp.h>
+ #include <stdlib.h>
+-- 
+1.9.1
+
