From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 22:32:42 +0100
Subject: [Buildroot] [git commit] package/uclibc: restore __isctype_l
 definition
Message-ID: <20200209212142.D27857F8DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=115185b407a35e61785e83eccd0bcaed7eaac5f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent is*_l fix broke uclibc build because removed __isctype_l
definition was used in libc/misc/ctype/ctype.c. Restore it.

Fixes: 8723c5e7a6db ("package/uclibc: fix ctype.h is*_l definitions")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
[yann.morin.1998 at free.fr:
  - add new patch, don't fix existing one
  - add URL to upstream ML post
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...de-ctype.h-restore-__isctype_l-definition.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch b/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch
new file mode 100644
index 0000000000..a0e115c763
--- /dev/null
+++ b/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch
@@ -0,0 +1,32 @@
+From 7a9a3e4b36955e8530756823d3443f6822562c56 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 9 Feb 2020 22:29:53 +0100
+Subject: [PATCH] include/ctype.h: restore __isctype_l definition
+
+Recent is*_l fix broke uclibc build because removed __isctype_l
+definition was used in libc/misc/ctype/ctype.c. Restore it.
+
+Fixes: d1a3ca7ca566 ("include/ctype.h: drop is*_l macro definitions")
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Upstream status:
+https://mailman.uclibc-ng.org/pipermail/devel/2020-February/001940.html
+---
+ include/ctype.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/ctype.h b/include/ctype.h
+index e934cf332..05f21c553 100644
+--- a/include/ctype.h
++++ b/include/ctype.h
+@@ -350,6 +350,7 @@ libc_hidden_proto(tolower_l)
+ /* Return the uppercase version of C.  */
+ extern int toupper_l (int __c, __locale_t __l) __THROW;
+ 
++# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
+ # ifndef __NO_CTYPE
+ #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
+ 	&& defined __UCLIBC_SUSV4_LEGACY__
+-- 
+2.20.1
+
