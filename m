From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Sep 2017 14:25:41 +0300
Subject: [Buildroot] [PATCH] iproute2: fix static build with uClibc
Message-ID: <926dfffe1683d9ec42526e825f1297e994b8542a.1506425141.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 4.13 added a local definition of strlcpy(). This clashes with
the uClibc provided one when linking statically. Add a patch that
detects libc provided strlcpy(), and avoids the multiple definition.

Fixes:
http://autobuild.buildroot.net/results/f34/f34684dcdb47938a3da8b00c8b29000cc23b4e3d/
http://autobuild.buildroot.net/results/a01/a01c5775945f5ffe75451722b676fc93333a0f14/
http://autobuild.buildroot.net/results/0ee/0eeab1a0ca943f9a035a0d458ddf9cc210bc87f4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0003-lib-fix-multiple-strlcpy-definition.patch | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch

diff --git a/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch b/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch
new file mode 100644
index 000000000000..997dd8803c2a
--- /dev/null
+++ b/package/iproute2/0003-lib-fix-multiple-strlcpy-definition.patch
@@ -0,0 +1,103 @@
+From 14a6f7764f2097f767852767bcab7a48ace360fc Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 26 Sep 2017 13:45:21 +0300
+Subject: [PATCH] lib: fix multiple strlcpy definition
+
+Some C libraries, like uClibc and musl, provide BSD compatible
+strlcpy(). Add check_strlcpy() to configure, and avoid defining strlcpy
+and strlcat when the C library provides them.
+
+This fixes the following static link error:
+
+.../sysroot/usr/lib/libc.a(strlcpy.os): In function `strlcpy':
+strlcpy.c:(.text+0x0): multiple definition of `strlcpy'
+../lib/libutil.a(utils.o):utils.c:(.text+0x1ddc): first defined here
+collect2: error: ld returned 1 exit status
+
+[baruch: backported from upstream submission to 4.13]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://patchwork.ozlabs.org/patch/818538/
+
+ configure    | 24 ++++++++++++++++++++++++
+ lib/Makefile |  4 ++++
+ lib/utils.c  |  2 ++
+ 3 files changed, 30 insertions(+)
+
+diff --git a/configure b/configure
+index 88cbdb825689..506701c00073 100755
+--- a/configure
++++ b/configure
+@@ -325,6 +325,27 @@ EOF
+     rm -f $TMPDIR/dbtest.c $TMPDIR/dbtest
+ }
+ 
++check_strlcpy()
++{
++    cat >$TMPDIR/strtest.c <<EOF
++#include <string.h>
++int main(int argc, char **argv) {
++	char dst[10];
++	strlcpy("test", dst, sizeof(dst));
++	return 0;
++}
++EOF
++    $CC -I$INCLUDE -o $TMPDIR/strtest $TMPDIR/strtest.c >/dev/null 2>&1
++    if [ $? -eq 0 ]
++    then
++	echo "no"
++    else
++	echo "NEED_STRLCPY:=y" >>Config
++	echo "yes"
++    fi
++    rm -f $TMPDIR/strtest.c $TMPDIR/strtest
++}
++
+ quiet_config()
+ {
+ 	cat <<EOF
+@@ -396,6 +417,9 @@ check_mnl
+ echo -n "Berkeley DB: "
+ check_berkeley_db
+ 
++echo -n "need for strlcpy: "
++check_strlcpy
++
+ echo
+ echo -n "docs:"
+ check_docs
+diff --git a/lib/Makefile b/lib/Makefile
+index b7b1d5685b94..227c8211786b 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -12,6 +12,10 @@ ifeq ($(HAVE_MNL),y)
+ 	CFLAGS += -DHAVE_LIBMNL $(shell $(PKG_CONFIG) libmnl --cflags)
+ endif
+ 
++ifeq ($(NEED_STRLCPY),y)
++	CFLAGS += -DNEED_STRLCPY
++endif
++
+ CFLAGS += -fPIC
+ 
+ UTILOBJ = utils.o rt_names.o ll_types.o ll_proto.o ll_addr.o \
+diff --git a/lib/utils.c b/lib/utils.c
+index 330ab073c206..f53dacae2e1f 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -1231,6 +1231,7 @@ int get_real_family(int rtm_type, int rtm_family)
+ 	return rtm_family;
+ }
+ 
++#ifdef NEED_STRLCPY
+ size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+ 	if (size) {
+@@ -1249,3 +1250,4 @@ size_t strlcat(char *dst, const char *src, size_t size)
+ 
+ 	return dlen + strlcpy(dst + dlen, src, size - dlen);
+ }
++#endif
+-- 
+2.14.1
+
-- 
2.14.1
