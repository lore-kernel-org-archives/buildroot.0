From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:06:25 +0100
Subject: [Buildroot] [git commit] package/dante: fix configure error
Message-ID: <20191225205733.7DABC8E436@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a68ad177e9a11c02e489aee62b36d9d25c3f5493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9be8a0d5af85370ecb52bcd315aa73cacbc95abc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sdep-m4-Remove-getaddrinfo-too-low-checks.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch b/package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch
new file mode 100644
index 0000000000..af23d46d11
--- /dev/null
+++ b/package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch
@@ -0,0 +1,35 @@
+osdep.m4: Remove getaddrinfo() too low checks
+
+dante runs AC_PREPROC_IFELSE then it fills $ERRVALFILE by running the
+following command:
+
+cat conftest.i | grep gaierrval: >>$2
+
+As a result, $ERRVALFILE does not contain the expected values because
+the expected value is not on the same line than gaierrval:
+
+ gaierrval: 
+ # 130 "conftest.c" 3 4
+           -3
+
+So drop these checks
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nuar dante-1.4.2-orig/osdep.m4 dante-1.4.2/osdep.m4
+--- dante-1.4.2-orig/osdep.m4	2019-12-09 21:28:38.936003218 +0100
++++ dante-1.4.2/osdep.m4	2019-12-09 21:49:48.764019371 +0100
+@@ -956,13 +956,7 @@
+ unset UNIQUEVALS UNIQUESYMBOLS
+ if test -s $ERRVALFILE; then
+     UNIQUEVALS=`sort $ERRVALFILE | uniq | wc -l | awk '{ print $1 }'`
+-    if test $UNIQUEVALS -le 1; then
+-        AC_MSG_FAILURE([error: getaddrinfo() error value count too low])
+-    fi
+     UNIQUESYMBOLS=`cat $ERRVALFILE | wc -l | awk '{ print $1 }'`
+-    if test $UNIQUESYMBOLS -le 1; then
+-        AC_MSG_FAILURE([error: getaddrinfo() error symbol count too low])
+-    fi
+ 
+     if test $ERRNOCNT -ne $UNIQUESYMBOLS; then
+ 	AC_MSG_FAILURE([internal error: errno symbol count mismatch])
