From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Mar 2020 19:21:10 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix linux/kcmp.h related
 compile failure
Message-ID: <20200304180929.EE3F78F386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75c5cc23b43bbe1fd3c7abbd27752afa902e9e4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch [1].

Fixes:

  http://autobuild.buildroot.net/results/df5bcb8e4f6e98c4de347abbbe91e10a98047422

  ../src/util/os_file.c:37:24: fatal error: linux/kcmp.h: No such file or directory

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0006-util-remove-the-dependency-on-kcmp.h.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
new file mode 100644
index 0000000000..27ae021e08
--- /dev/null
+++ b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
@@ -0,0 +1,42 @@
+From 63ad4535df6a0a938e7391d73adcada05e730c89 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
+Date: Tue, 18 Feb 2020 16:12:23 -0500
+Subject: [PATCH] util: remove the dependency on kcmp.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: f76cbc7901f7 "util: Add os_same_file_description helper"
+
+Acked-by: Eric Engestrom <eric@engestrom.ch>
+Reviewed-by: Michel D??nzer <mdaenzer@redhat.com>
+Tested-by: Marge Bot <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
+
+[ Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988 ]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/util/os_file.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/util/os_file.c b/src/util/os_file.c
+index b502ff4..128fe87 100644
+--- a/src/util/os_file.c
++++ b/src/util/os_file.c
+@@ -34,11 +34,12 @@ os_file_create_unique(const char *filename, int filemode)
+ #if defined(__linux__)
+ 
+ #include <fcntl.h>
+-#include <linux/kcmp.h>
+ #include <sys/stat.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
++/* copied from <linux/kcmp.h> */
++#define KCMP_FILE 0
+ 
+ static ssize_t
+ readN(int fd, char *buf, size_t len)
+-- 
+2.25.1
+
