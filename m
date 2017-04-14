From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:54:34 +0200
Subject: [Buildroot] [git commit] trinity: fix ipv6 headers detection
Message-ID: <20170414085448.0E11A827A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a263cad2d95c8c691db7b23273acd7efc67a4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The trinity configure script looks into a host header to check for libc/kernel
headers conflict resolution. This is not compatible with cross compilation.
Add a patch that does direct compilation test instead.

This issue was not caught by the autobuilder yet.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-cross-compile-detection-of-broken-ipv6.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch b/package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch
new file mode 100644
index 0000000..5bc3260
--- /dev/null
+++ b/package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch
@@ -0,0 +1,49 @@
+From ac38a49a18e337fb3bc7ac8e06097e28e1e3b3f7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 14 Apr 2017 07:43:04 +0300
+Subject: [PATCH] configure: fix cross compile detection of broken ipv6 headers
+
+Checking the content of the host ipv6.h headers is incompatible with cross
+compilation. Target headers may not be the same as the host. Do direct build
+test instead using the ${CC} (cross) compiler to detect headers issues.
+
+Define _GNU_SOURCE to make sure glibc ipv6 definitions are exposed.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: submitted upstream
+
+ configure | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index aa3f7f334971..8639a38eba96 100755
+--- a/configure
++++ b/configure
+@@ -51,8 +51,21 @@ echo "[*] Checking system headers."
+ [ -z "$IPV6" ] && IPV6=yes
+ if [[ "$IPV6" == "yes" ]]; then
+ 	echo -n "[*] Checking ipv6 headers ... "
+-	RET=$(grep __UAPI_DEF_IN6_PKTINFO /usr/include/linux/ipv6.h)
+-	if [ -z "$RET" ]; then
++	rm -f "$TMP" || exit 1
++
++	cat >"$TMP.c" << EOF
++#include <netinet/in.h>
++#include <netinet/ip6.h>
++#include <linux/in6.h>
++#include <linux/ipv6.h>
++
++int main()
++{
++	struct in6_addr test;
++}
++EOF
++	${CC} ${CFLAGS} -D_GNU_SOURCE "$TMP.c" -o "$TMP" &>"$TMP.log"
++	if [ ! -x "$TMP" ]; then
+ 		echo $RED "[BROKEN]" $COL_RESET "See https://patchwork.ozlabs.org/patch/425881/"
+ 	else
+ 		echo $GREEN "[OK]" $COL_RESET
+-- 
+2.11.0
+
