From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Feb 2017 17:21:26 +0100
Subject: [Buildroot] [PATCH] package/tmux: fix build
Message-ID: <1486311686-24971-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bump to the latest libevent version exposed a latent bug in tmux,
which tries to re-define a variable exposed by the C library.

This breaks with uClibc-ng wihch defines it const char*, while glibc and
musl define it as non-const.

Fixes:
    http://autobuild.buildroot.org/results/31d/31d37c95b40d297b90a6181ec79c42ee1e2e5090/
    http://autobuild.buildroot.org/results/ccc/ccc9d2e995ba1eaf19f6b325b0af5ebeb8066e7f/
    http://autobuild.buildroot.org/results/8a2/8a28d43bd0c079c1b49b61b0c6ef7de79eda0549/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...t-re-define-program_invocation_short_name.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch

diff --git a/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch b/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch
new file mode 100644
index 0000000..bddc2c7
--- /dev/null
+++ b/package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch
@@ -0,0 +1,42 @@
+From 9b18a98614a9f201b0883c2b15e7c7bde0aa0ff2 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 5 Feb 2017 17:12:00 +0100
+Subject: [PATCH] compat: don't re-define program_invocation_short_name
+
+program_invocation_short_name is defined in errno.h, and its definition
+can differ between the various C libraries: glibc defines it as:
+    extern char *program_invocation_short_name;
+
+while uClibc defines it as:
+    extern const char *program_invocation_short_name;
+
+So there is not simple solution to know the prototype.
+
+But since it is defined in errno.h, there is no reason to try and define
+it ourselves; let's just trust what the header provides.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ compat/getprogname.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/compat/getprogname.c b/compat/getprogname.c
+index 80a496d..ad619fc 100644
+--- a/compat/getprogname.c
++++ b/compat/getprogname.c
+@@ -19,11 +19,10 @@
+ #include "compat.h"
+ 
+ #if defined(HAVE_PROGRAM_INVOCATION_SHORT_NAME)
++#include <errno.h>
+ const char *
+ getprogname(void)
+ {
+-	extern char	*program_invocation_short_name;
+-
+ 	return (program_invocation_short_name);
+ }
+ #elif defined(HAVE___PROGNAME)
+-- 
+2.7.4
+
-- 
2.7.4
