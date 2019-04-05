From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 21:21:53 +0200
Subject: [Buildroot] [git commit] package/trinity: bump to version 1.9
Message-ID: <20190405192416.E068D8DAC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95fc346c73a69cdf737377be90261b822b342d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-compat-handle-removed-autofs-macros.patch | 61 ---------------
 .../0002-memfd-fix-build-with-glibc-2.27.patch     | 87 ----------------------
 ...igure-fix-build-with-kernel-headers-v4.17.patch | 73 ------------------
 .../0004-Check-if-VIDIOC_RESERVED-is-defined.patch | 56 --------------
 ...to-rds-include-libc-network-headers-first.patch | 48 ------------
 package/trinity/trinity.hash                       |  2 +-
 package/trinity/trinity.mk                         |  2 +-
 7 files changed, 2 insertions(+), 327 deletions(-)

diff --git a/package/trinity/0001-compat-handle-removed-autofs-macros.patch b/package/trinity/0001-compat-handle-removed-autofs-macros.patch
deleted file mode 100644
index e3c6ee3b54..0000000000
--- a/package/trinity/0001-compat-handle-removed-autofs-macros.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e4f31d5a1ce65974c2a6b2e6e1a2b16fffc51518 Mon Sep 17 00:00:00 2001
-From: Jiri Slaby <jslaby@suse.cz>
-Date: Tue, 28 Nov 2017 10:15:22 +0100
-Subject: [PATCH] compat: handle removed autofs macros
-
-In file included from ioctls/autofs.c:4:0:
-ioctls/autofs.c:241:8: error: 'AUTOFS_IOC_EXPIRE_INDIRECT' undeclared here (not in a function); did you mean 'AUTOFS_IOC_EXPIRE_CMD'?
-  IOCTL(AUTOFS_IOC_EXPIRE_INDIRECT),
-        ^
-include/ioctls.h:53:15: note: in definition of macro 'IOCTL'
-  { .request = _request, .name = #_request, }
-               ^~~~~~~~
-ioctls/autofs.c:242:8: error: 'AUTOFS_IOC_EXPIRE_DIRECT' undeclared here (not in a function); did you mean 'AUTOFS_IOC_EXPIRE_INDIRECT'?
-  IOCTL(AUTOFS_IOC_EXPIRE_DIRECT),
-        ^
-include/ioctls.h:53:15: note: in definition of macro 'IOCTL'
-  { .request = _request, .name = #_request, }
-               ^~~~~~~~
-
-Define them as AUTOFS_IOC_EXPIRE_MULTI as they used to be.
-
-Signed-off-by: Jiri Slaby <jslaby@suse.cz>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit e4f31d5a1ce
-
- include/compat.h | 8 ++++++++
- ioctls/autofs.c  | 1 +
- 2 files changed, 9 insertions(+)
-
-diff --git a/include/compat.h b/include/compat.h
-index 10065ceca5f6..fc9a1b95ac4c 100644
---- a/include/compat.h
-+++ b/include/compat.h
-@@ -1209,3 +1209,11 @@ struct kvm_get_htab_fd {
- #ifndef SO_IP_SET
- #define SO_IP_SET 83
- #endif
-+
-+/* linux/auto_fs4.h */
-+#ifndef AUTOFS_IOC_EXPIRE_INDIRECT
-+#define AUTOFS_IOC_EXPIRE_INDIRECT AUTOFS_IOC_EXPIRE_MULTI
-+#endif
-+#ifndef AUTOFS_IOC_EXPIRE_DIRECT
-+#define AUTOFS_IOC_EXPIRE_DIRECT AUTOFS_IOC_EXPIRE_MULTI
-+#endif
-diff --git a/ioctls/autofs.c b/ioctls/autofs.c
-index 04a3eb811326..a39ccccc056b 100644
---- a/ioctls/autofs.c
-+++ b/ioctls/autofs.c
-@@ -8,6 +8,7 @@
- #include "shm.h"
- #include "syscall.h"
- #include "utils.h"
-+#include "compat.h"
- 
- /* include/linux/auto_dev-ioctl.h */
- /*
--- 
-2.15.0
-
diff --git a/package/trinity/0002-memfd-fix-build-with-glibc-2.27.patch b/package/trinity/0002-memfd-fix-build-with-glibc-2.27.patch
deleted file mode 100644
index 9ea3634688..0000000000
--- a/package/trinity/0002-memfd-fix-build-with-glibc-2.27.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From c93bb184ce996c4d77eefbae2ab0bf74f396ec45 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 13 Mar 2018 06:53:06 +0200
-Subject: [PATCH] memfd: fix build with glibc 2.27
-
-glibc 2.27 added a wrapper for memfd_create(). This causes build
-failure:
-
-fds/memfd.c:19:12: error: static declaration of 'memfd_create' follows non-static declaration
- static int memfd_create(__unused__ const char *uname, __unused__ unsigned int flag)
-            ^~~~~~~~~~~~
-
-Don't use the local definition when the libc provides one.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/kernelslacker/trinity/pull/23
-
- configure   | 23 +++++++++++++++++++++++
- fds/memfd.c |  3 +++
- 2 files changed, 26 insertions(+)
-
-diff --git a/configure b/configure
-index dc0a87d8c1ad..c0166af33048 100755
---- a/configure
-+++ b/configure
-@@ -288,6 +288,29 @@ else
- 	echo "#define USE_BTRFS 1" >> $CONFIGH
- fi
- 
-+#############################################################################################
-+# Does glibc provide memfd_create() syscall wrapper
-+#
-+echo -n "[*] Checking if glibc provides memfd_create.. "
-+rm -f "$TMP" || exit 1
-+
-+cat >"$TMP.c" << EOF
-+#include <sys/mman.h>
-+
-+void main()
-+{
-+	memfd_create();
-+}
-+EOF
-+
-+${CC} ${CFLAGS} "$TMP.c" -o "$TMP" &>"$TMP.log"
-+if [ ! -x "$TMP" ]; then
-+	echo $RED "[NO]" $COL_RESET
-+else
-+	echo $GREEN "[YES]" $COL_RESET
-+	echo "#define USE_MEMFD_CREATE 1" >> $CONFIGH
-+fi
-+
- #############################################################################################
- 
- check_header linux/caif/caif_socket.h USE_CAIF
-diff --git a/fds/memfd.c b/fds/memfd.c
-index 210678e4571c..aaaac2f78f54 100644
---- a/fds/memfd.c
-+++ b/fds/memfd.c
-@@ -5,6 +5,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-+#include <sys/mman.h>
- 
- #include "fd.h"
- #include "memfd.h"
-@@ -16,6 +17,7 @@
- #include "trinity.h"
- #include "udp.h"
- 
-+#ifndef USE_MEMFD_CREATE
- static int memfd_create(__unused__ const char *uname, __unused__ unsigned int flag)
- {
- #ifdef SYS_memfd_create
-@@ -24,6 +26,7 @@ static int memfd_create(__unused__ const char *uname, __unused__ unsigned int fl
- 	return -ENOSYS;
- #endif
- }
-+#endif
- 
- static void memfd_destructor(struct object *obj)
- {
--- 
-2.16.1
-
diff --git a/package/trinity/0003-configure-fix-build-with-kernel-headers-v4.17.patch b/package/trinity/0003-configure-fix-build-with-kernel-headers-v4.17.patch
deleted file mode 100644
index 89aa4219c2..0000000000
--- a/package/trinity/0003-configure-fix-build-with-kernel-headers-v4.17.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 5431126ac94bf81743852493a041e80e82918741 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 8 Jun 2018 06:05:26 +0300
-Subject: [PATCH] configure: fix build with kernel headers v4.17+
-
-Kernel v4.17 removed the linux/irda.h header. Skip the irda test when
-this header is missing.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/kernelslacker/trinity/pull/25
-
- configure        | 1 +
- net/proto-irda.c | 6 +++++-
- net/protocols.c  | 2 ++
- 3 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index c0166af33048..944c8cf77d1b 100755
---- a/configure
-+++ b/configure
-@@ -316,6 +316,7 @@ fi
- check_header linux/caif/caif_socket.h USE_CAIF
- check_header linux/fsmap.h USE_FSMAP
- check_header linux/if_alg.h USE_IF_ALG
-+check_header linux/irda.h USE_IRDA
- check_header linux/rds.h USE_RDS
- check_header linux/vfio.h USE_VFIO
- check_header drm/drm.h USE_DRM
-diff --git a/net/proto-irda.c b/net/proto-irda.c
-index 02d51bcd2ee0..264e36dfa040 100644
---- a/net/proto-irda.c
-+++ b/net/proto-irda.c
-@@ -4,13 +4,15 @@
- #include <sys/un.h>
- /* old irda.h does not include something which defines sa_family_t */
- #include <netinet/in.h>
--#include <linux/irda.h>
- #include <stdlib.h>
- #include "net.h"
- #include "random.h"
- #include "utils.h"	// RAND_ARRAY
- #include "compat.h"
- 
-+#ifdef USE_IRDA
-+#include <linux/irda.h>
-+
- static void irda_gen_sockaddr(struct sockaddr **addr, socklen_t *addrlen)
- {
- 	struct sockaddr_irda *irda;
-@@ -53,3 +55,5 @@ const struct netproto proto_irda = {
- 	.valid_triplets = irda_triplets,
- 	.nr_triplets = ARRAY_SIZE(irda_triplets),
- };
-+
-+#endif
-diff --git a/net/protocols.c b/net/protocols.c
-index 90a60affedca..87acf85c707f 100644
---- a/net/protocols.c
-+++ b/net/protocols.c
-@@ -26,7 +26,9 @@ const struct protoptr net_protocols[TRINITY_PF_MAX] = {
- #ifdef USE_RDS
- 	[PF_RDS] = { .proto = &proto_rds },
- #endif
-+#ifdef USE_IRDA
- 	[PF_IRDA] = { .proto = &proto_irda },
-+#endif
- 	[PF_LLC] = { .proto = &proto_llc },
- 	[PF_CAN] = { .proto = &proto_can },
- 	[PF_TIPC] = { .proto = &proto_tipc },
--- 
-2.17.1
-
diff --git a/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch b/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch
deleted file mode 100644
index 54f8bea63c..0000000000
--- a/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a5f32b9714613404e9f4699aaaad720f2bb033b4 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Thu, 23 Aug 2018 22:28:49 +0000
-Subject: [PATCH] Check if VIDIOC_RESERVED is defined.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-VIDIOC_RESERVED was removed in Linux 4.19.
-
-commit ea8532daee31bc72abfbc9ca7a43cbec0f6c05af
-Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
-Date:   Wed May 30 11:07:05 2018 -0400
-
-    media: videodev2: get rid of VIDIOC_RESERVED
-
-    While this ioctl is there at least since Kernel 2.6.12-rc2, it
-    was never used by any upstream driver.
-
-    Get rid of it.
-
-    Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
-
-This patch fixes this build error.
-
-  CC	ioctls/videodev2.o
-In file included from ioctls/videodev2.c:4:
-ioctls/videodev2.c:8:8: error: ???VIDIOC_RESERVED??? undeclared here (not in a function); did you mean ???VIDIOC_G_STD????
-  IOCTL(VIDIOC_RESERVED),
-        ^~~~~~~~~~~~~~~
-include/ioctls.h:53:15: note: in definition of macro ???IOCTL???
-  { .request = _request, .name = #_request, }
-               ^~~~~~~~
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/kernelslacker/trinity/commit/a5f32b9714613404e9f4699aaaad720f2bb033b4]
----
- ioctls/videodev2.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ioctls/videodev2.c b/ioctls/videodev2.c
-index f7183f29..67089abf 100644
---- a/ioctls/videodev2.c
-+++ b/ioctls/videodev2.c
-@@ -5,7 +5,9 @@
- 
- static const struct ioctl videodev2_ioctls[] = {
- 	IOCTL(VIDIOC_QUERYCAP),
-+#ifdef VIDIOC_RESERVED
- 	IOCTL(VIDIOC_RESERVED),
-+#endif
- 	IOCTL(VIDIOC_ENUM_FMT),
- 	IOCTL(VIDIOC_G_FMT),
- 	IOCTL(VIDIOC_S_FMT),
diff --git a/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch b/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch
deleted file mode 100644
index 438bbfb56a..0000000000
--- a/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 350c05e5c0d7af5941a9c17f2f86e1c6297d7475 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 12 Dec 2018 20:52:50 +0200
-Subject: [PATCH] proto-rds: include libc network headers first
-
-To avoid collisions between libc networking headers and header kernels
-the libc headers must appear first in the list of headers. This fixes a
-build issue with kernel headers v4.19:
-
-In file included from include/net.h:5:0,
-                 from net/proto-rds.c:6:
-.../sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
- struct in6_addr {
-        ^~~~~~~~
-In file included from .../sysroot/usr/include/linux/rds.h:40:0,
-                 from net/proto-rds.c:4:
-.../sysroot/usr/include/linux/in6.h:33:8: note: originally defined here
- struct in6_addr {
-		^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/kernelslacker/trinity/pull/29
-
- net/proto-rds.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/net/proto-rds.c b/net/proto-rds.c
-index c8ff22f886c3..06e36e82d990 100644
---- a/net/proto-rds.c
-+++ b/net/proto-rds.c
-@@ -1,12 +1,12 @@
- #ifdef USE_RDS
- #include <sys/socket.h>
- #include <stdint.h>
--#include <linux/rds.h>
- #include <stdlib.h>
- #include "net.h"
- #include "compat.h"
- #include "random.h"
- #include "utils.h"	// RAND_ARRAY
-+#include <linux/rds.h>
- 
- static void rds_gen_sockaddr(struct sockaddr **addr, socklen_t *addrlen)
- {
--- 
-2.19.2
-
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 2000653336..f7522514e1 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8cadc4221660b7accc4728311ce1a130ac9b9d1f3b04e35508ba0cc80d9c3f94  trinity-1.8.tar.xz
+sha256 7e0da953c2cc6fb3907d1f37d35f61836433fb50e97117a72eef113abb783dc6  trinity-1.9.tar.xz
 sha256 35e3fc68c89fd7b8f72fd910b521cb3292f859e9181f3c26bd0df84d144bc1d4  COPYING
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index b75c46943e..adf7d1455c 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = 1.8
+TRINITY_VERSION = 1.9
 TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
 TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
