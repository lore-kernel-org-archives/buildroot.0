From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 13:45:42 +0100
Subject: [Buildroot] [git commit] bdwgc: add patch automatically detecting
	for NO_GETCONTEXT need
Message-ID: <20141226141335.567D68004B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8995e5b57def429ae42c9b47f70dbf18211947f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is necessary to successfully build guile with toolchain
missing support for getcontext.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: add a comment, change variable name, use
 AS_IF, remove debug traces, use AC_CHECK_FUNCS (Thomas)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
new file mode 100644
index 0000000..393ad90
--- /dev/null
+++ b/package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
@@ -0,0 +1,28 @@
+configure.ac: add check for NO_GETCONTEXT definition
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[yann.morin.1998 at free.fr: add a comment, change variable name, use
+ AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
+ Thomas)]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- bdwgc-7.2f.orig/configure.ac	2014-06-01 19:00:47.000000000 +0200
++++ bdwgc-7.2f/configure.ac	2014-12-23 14:13:11.585716713 +0100
+@@ -365,6 +365,12 @@
+   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
+ fi
+ 
++# Check for getcontext (uClibc can be configured without it, for example)
++AC_CHECK_FUNCS([getcontext])
++AS_IF([test "$ac_cv_func_getcontext" = "no"],
++  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
++
+ case "$host" in
+ # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
+ # and unnecessary everywhere.
