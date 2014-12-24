From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Dec 2014 20:09:13 +0100
Subject: [Buildroot] [PATCH 2/2] bdwgc: add patch automatically detecting
	for NO_GETCONTEXT need
In-Reply-To: <cover.1419448003.git.yann.morin.1998@free.fr>
References: <cover.1419448003.git.yann.morin.1998@free.fr>
Message-ID: <efeb5ff2d78fb77cfd65a2e4e3bbb78ec9bef3f0.1419448003.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This patch is necessary to successfully build guile with toolchain
missing support for getcontext.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: add a comment, change variable name, use
 AS_IF, remove debug traces, use AC_CHECK_FUNCS (Thomas)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: we're not testing setcontext, because it is not used. getcontext
is used only to retrieve the context of the tread (like registers, heap
adress, and so on...), not to actually use contexts.
---
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

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
-- 
1.9.1
