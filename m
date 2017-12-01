From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:57 -0000
Subject: [Buildroot] [git commit] iproute2: bump to version 4.14.1
Message-ID: <20171201205331.331387FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5847ab8b184bb65c4e2cd42b1ac5d79c04acf0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove uClibc build fix; current uClibc version defines the required
macro.

Remove static link fix; fixed upstream.

Rebase the musl libc-compat.h workaround to adapt to upstream headers
location change.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...musl-workaround-to-the-libc-compat.h-copy.patch |  16 ++--
 .../iproute2/0002-Fix-build-with-uClibc-ng.patch   |  38 --------
 .../0003-lib-fix-multiple-strlcpy-definition.patch | 103 ---------------------
 package/iproute2/iproute2.hash                     |   2 +-
 package/iproute2/iproute2.mk                       |   2 +-
 5 files changed, 10 insertions(+), 151 deletions(-)

diff --git a/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch b/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
index c7c6e15..ff362c9 100644
--- a/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
+++ b/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
@@ -1,4 +1,4 @@
-From b4edb4eebbfd35934b8bc6d7ee0e00e76a01596c Mon Sep 17 00:00:00 2001
+From 909a6f10157114e09936d2dd545175d7ed84c0fb Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Thu, 22 Dec 2016 15:26:30 +0200
 Subject: [PATCH] Add the musl workaround to the libc-compat.h copy
@@ -12,14 +12,14 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
 musl fix must go to the kernel first.
 ---
- include/linux/libc-compat.h | 4 +++-
+ include/uapi/linux/libc-compat.h | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h
-index f38571dabd8d..30f0b67c7a12 100644
---- a/include/linux/libc-compat.h
-+++ b/include/linux/libc-compat.h
-@@ -49,10 +49,12 @@
+diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
+index 9ab3ace08e2b..e768459d89f9 100644
+--- a/include/uapi/linux/libc-compat.h
++++ b/include/uapi/linux/libc-compat.h
+@@ -50,10 +50,12 @@
  #define _LIBC_COMPAT_H
  
  /* We have included glibc headers... */
@@ -34,5 +34,5 @@ index f38571dabd8d..30f0b67c7a12 100644
  /* GLIBC headers included first so don't define anything
   * that would already be defined. */
 -- 
-2.11.0
+2.15.0
 
diff --git a/package/iproute2/0002-Fix-build-with-uClibc-ng.patch b/package/iproute2/0002-Fix-build-with-uClibc-ng.patch
deleted file mode 100644
index 48cae70..0000000
--- a/package/iproute2/0002-Fix-build-with-uClibc-ng.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2ac2f416072d9968a9ea2dd9f48168223a1147b0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 18 Jul 2017 14:09:06 +0300
-Subject: [PATCH] Fix build with uClibc-ng
-
-Add a local definition for IPPROTO_MH to fix build with uClibc-ng. As of
-version 1.0.25, the uClibc-ng netinet/in.h header does not provide this
-definition. The kernel provided definition is masked by libc-compat.h. Add
-this local fix until uClibc-ng syncs netinet/in.h with glibc.
-
-This partially reverts upstream commit a9ae195a2169 (xfrm: get #define's from
-linux includes)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: non upstreamable; local uClibc-ng compatibility fix
----
- ip/xfrm.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ip/xfrm.h b/ip/xfrm.h
-index 54d80ce5e949..50b85550fb45 100644
---- a/ip/xfrm.h
-+++ b/ip/xfrm.h
-@@ -30,6 +30,10 @@
- #include <linux/xfrm.h>
- #include <linux/ipsec.h>
- 
-+#ifndef IPPROTO_MH
-+# define IPPROTO_MH     135
-+#endif
-+
- #define XFRMS_RTA(x)  ((struct rtattr*)(((char*)(x)) + NLMSG_ALIGN(sizeof(struct xfrm_usersa_info))))
- #define XFRMS_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct xfrm_usersa_info))
- 
--- 
-2.13.2
-
diff --git a/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch b/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch
deleted file mode 100644
index 05e9c38..0000000
--- a/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 5b55bbe48a29cf6a72cef9f424835f6244e66351 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 26 Sep 2017 13:45:21 +0300
-Subject: [PATCH] lib: fix multiple strlcpy definition
-
-Some C libraries, like uClibc and musl, provide BSD compatible
-strlcpy(). Add check_strlcpy() to configure, and avoid defining strlcpy
-and strlcat when the C library provides them.
-
-This fixes the following static link error:
-
-.../sysroot/usr/lib/libc.a(strlcpy.os): In function `strlcpy':
-strlcpy.c:(.text+0x0): multiple definition of `strlcpy'
-../lib/libutil.a(utils.o):utils.c:(.text+0x1ddc): first defined here
-collect2: error: ld returned 1 exit status
-
-[baruch: backported from upstream submission to 4.13]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://patchwork.ozlabs.org/patch/819705/
----
- configure    | 24 ++++++++++++++++++++++++
- lib/Makefile |  4 ++++
- lib/utils.c  |  2 ++
- 3 files changed, 30 insertions(+)
-
-diff --git a/configure b/configure
-index 88cbdb825689..4964b998059e 100755
---- a/configure
-+++ b/configure
-@@ -325,6 +325,27 @@ EOF
-     rm -f $TMPDIR/dbtest.c $TMPDIR/dbtest
- }
- 
-+check_strlcpy()
-+{
-+    cat >$TMPDIR/strtest.c <<EOF
-+#include <string.h>
-+int main(int argc, char **argv) {
-+	char dst[10];
-+	strlcpy(dst, "test", sizeof(dst));
-+	return 0;
-+}
-+EOF
-+    $CC -I$INCLUDE -o $TMPDIR/strtest $TMPDIR/strtest.c >/dev/null 2>&1
-+    if [ $? -eq 0 ]
-+    then
-+	echo "no"
-+    else
-+	echo "NEED_STRLCPY:=y" >>Config
-+	echo "yes"
-+    fi
-+    rm -f $TMPDIR/strtest.c $TMPDIR/strtest
-+}
-+
- quiet_config()
- {
- 	cat <<EOF
-@@ -396,6 +417,9 @@ check_mnl
- echo -n "Berkeley DB: "
- check_berkeley_db
- 
-+echo -n "need for strlcpy: "
-+check_strlcpy
-+
- echo
- echo -n "docs:"
- check_docs
-diff --git a/lib/Makefile b/lib/Makefile
-index b7b1d5685b94..227c8211786b 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -12,6 +12,10 @@ ifeq ($(HAVE_MNL),y)
- 	CFLAGS += -DHAVE_LIBMNL $(shell $(PKG_CONFIG) libmnl --cflags)
- endif
- 
-+ifeq ($(NEED_STRLCPY),y)
-+	CFLAGS += -DNEED_STRLCPY
-+endif
-+
- CFLAGS += -fPIC
- 
- UTILOBJ = utils.o rt_names.o ll_types.o ll_proto.o ll_addr.o \
-diff --git a/lib/utils.c b/lib/utils.c
-index 330ab073c206..f53dacae2e1f 100644
---- a/lib/utils.c
-+++ b/lib/utils.c
-@@ -1231,6 +1231,7 @@ int get_real_family(int rtm_type, int rtm_family)
- 	return rtm_family;
- }
- 
-+#ifdef NEED_STRLCPY
- size_t strlcpy(char *dst, const char *src, size_t size)
- {
- 	if (size) {
-@@ -1249,3 +1250,4 @@ size_t strlcat(char *dst, const char *src, size_t size)
- 
- 	return dlen + strlcpy(dst + dlen, src, size - dlen);
- }
-+#endif
--- 
-2.14.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 7954039..e9b8a0e 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	9cfb81edf8c8509e03daa77cf62aead01c4a827132f6c506578f94cc19415c50	iproute2-4.13.0.tar.xz
+sha256	d43ac068afcc350a448f4581b6e292331ef7e4e7aa746e34981582d5fdb10067	iproute2-4.14.1.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d002d4d..b75349d 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.13.0
+IPROUTE2_VERSION = 4.14.1
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
