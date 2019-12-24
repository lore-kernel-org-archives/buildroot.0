From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 16:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/dante: fix configure error
Message-ID: <20191224150709.932615-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9be8a0d5af85370ecb52bcd315aa73cacbc95abc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...m4-Remove-getaddrinfo-too-low-checks.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch

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
-- 
2.24.0
