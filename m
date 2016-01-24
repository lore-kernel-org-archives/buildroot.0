From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:00:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/vpnc: fix musl build
Message-ID: <1453640456-32346-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vpnc/0004-musl.patch | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/vpnc/0004-musl.patch

diff --git a/package/vpnc/0004-musl.patch b/package/vpnc/0004-musl.patch
new file mode 100644
index 0000000..db254b6
--- /dev/null
+++ b/package/vpnc/0004-musl.patch
@@ -0,0 +1,39 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/testing/vpnc/working.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/sysdep.c b/sysdep.c
+index ff07753..43fdb74 100644
+--- a/sysdep.c
++++ b/sysdep.c
+@@ -59,7 +59,7 @@
+ #if defined(__DragonFly__)
+ #include <net/tun/if_tun.h>
+ #elif defined(__linux__)
+-#include <linux/if_tun.h>
++/*#include <linux/if_tun.h>*/
+ #elif defined(__APPLE__)
+ /* no header for tun */
+ #elif defined(__CYGWIN__)
+diff --git a/sysdep.h b/sysdep.h
+index a5eafd6..af34e94 100644
+--- a/sysdep.h
++++ b/sysdep.h
+@@ -38,11 +38,13 @@ int tun_get_hwaddr(int fd, char *dev, uint8_t *hwaddr);
+ 
+ /***************************************************************************/
+ #if defined(__linux__) || defined(__GLIBC__)
++#ifdef __GLIBC__
+ #include <error.h>
++#define HAVE_ERROR     1
++#endif
+ 
+ #define HAVE_VASPRINTF 1
+ #define HAVE_ASPRINTF  1
+-#define HAVE_ERROR     1
+ #define HAVE_GETLINE   1
+ #define HAVE_UNSETENV  1
+ #define HAVE_SETENV    1
-- 
2.7.0.rc3
