From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:43 -0700
Subject: [Buildroot] [PATCH 21/21] BugFix - m4 - Fixed Missing wint_t
	typedef When There Is No WChar Support
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-22-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When uClibc is configured without wchar support, wint_t does not get defined.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/m4/m4-1.4.9-002-no-wchar.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/m4/m4-1.4.9-002-no-wchar.patch

diff --git a/package/m4/m4-1.4.9-002-no-wchar.patch b/package/m4/m4-1.4.9-002-no-wchar.patch
new file mode 100644
index 0000000..7b67295
--- /dev/null
+++ b/package/m4/m4-1.4.9-002-no-wchar.patch
@@ -0,0 +1,24 @@
+--- m4-1.4.9/lib/printf-args-orig.h	2007-03-23 05:50:53.000000000 -0700
++++ m4-1.4.9/lib/printf-args.h	2010-09-18 19:09:21.000000000 -0700
+@@ -29,6 +29,9 @@
+ /* Get wint_t.  */
+ #if HAVE_WINT_T
+ # include <wchar.h>
++# ifndef __UCLIBC_HAS_WCHAR__
++typedef int wint_t;
++# endif
+ #endif
+ 
+ /* Get va_list.  */
+--- m4-1.4.9/lib/wctype_-orig.h	2010-09-18 19:13:07.000000000 -0700
++++ m4-1.4.9/lib/wctype_.h	2010-09-18 19:09:21.000000000 -0700
+@@ -39,6 +39,9 @@
+ # include <stdio.h>
+ # include <time.h>
+ # include <wchar.h>
++# ifndef __UCLIBC_HAS_WCHAR__
++typedef int wint_t;
++# endif
+ typedef wint_t __wctype_wint_t;
+ #else
+ typedef int __wctype_wint_t;
-- 
1.7.2.3
