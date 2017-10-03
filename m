From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 14:29:30 +0200
Subject: [Buildroot] [git commit] nfs-utils: add missing include of stdint.h
Message-ID: <20171003123215.EA9527FF1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=854d61f7aabac5f9f2f9612bd88266d5f44c4a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Glibc bump to 2.26 exposed this missing header when building with the
following combination using an i386 internal toolchain:

gcc5.4.0
bin2.28.1
linux4.1.43

Logfile snippet:

2017-10-02T00:08:11 ^
2017-10-02T00:08:12 rpc.c: In function ???nsm_recv_getport???:
2017-10-02T00:08:12 rpc.c:469:13: error: ???UINT16_MAX??? undeclared (first use in this function)

Upstream: https://bugzilla.linux-nfs.org/show_bug.cgi?id=312

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfs-utils-add-missing-include-of-stdint.h.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch b/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
new file mode 100644
index 0000000..a621435
--- /dev/null
+++ b/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
@@ -0,0 +1,33 @@
+From b3ff26fa182b34b6faa1317f18a9dac4c7963334 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 2 Oct 2017 09:57:15 -0500
+Subject: [PATCH] nfs-utils: add missing include of stdint.h
+
+Glibc bump to 2.26 exposed this missing header when building
+with the following combination using an i386 internal toolchain.
+gcc5.4.0
+bin2.28.1
+linux4.1.43
+
+Upstream: https://bugzilla.linux-nfs.org/show_bug.cgi?id=312
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ support/nsm/rpc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nsm/rpc.c b/support/nsm/rpc.c
+index 4e5f40e..d91c6ea 100644
+--- a/support/nsm/rpc.c
++++ b/support/nsm/rpc.c
+@@ -40,6 +40,7 @@
+ 
+ #include <time.h>
+ #include <stdbool.h>
++#include <stdint.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-- 
+1.9.1
+
