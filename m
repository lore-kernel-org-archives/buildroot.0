From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 10:47:39 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] uclibc: fix mkostemp
Message-ID: <20181114094502.26F48835C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a628ef690c9139d48ce6d527dbba206f1622650b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Pull a patch already submitted upstream[1] that fixes mkostemp when
_LARGEFILE64_SOURCE is defined. This is required to prevent failures
on eudev[2]:

    # udevadm hwdb --update
    Failure writing database //etc/udev/hwdb.bin: Invalid argument

1. https://patchwork.ozlabs.org/patch/990045/
2. https://patchwork.ozlabs.org/patch/984848/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c33fb6e9f190273abef5fd8186ab0d5a496ef06a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-mkostemp64-clear-flags-as-mkostemp-does.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
new file mode 100644
index 0000000000..f87abd8849
--- /dev/null
+++ b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
@@ -0,0 +1,38 @@
+From 09a776103e4aa75f95c9ad44554a9c2b56de3535 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Mon, 29 Oct 2018 01:17:38 -0300
+Subject: [PATCH] mkostemp64: clear flags, as mkostemp does
+
+This should have been made in commit 9649721950 but was forgotten.
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ libc/stdlib/mkostemp64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libc/stdlib/mkostemp64.c b/libc/stdlib/mkostemp64.c
+index aa9736cd6..f4674bb0c 100644
+--- a/libc/stdlib/mkostemp64.c
++++ b/libc/stdlib/mkostemp64.c
+@@ -15,9 +15,9 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-#include <fcntl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ #include "../misc/internals/tempname.h"
+ 
+ /* Generate a unique temporary file name from TEMPLATE.
+@@ -27,6 +27,7 @@
+ int
+ mkostemp64 (char *template, int flags)
+ {
++  flags -= flags & O_ACCMODE; /* Remove O_RDONLY, O_WRONLY, and O_RDWR. */
+   return __gen_tempname (template, __GT_BIGFILE, flags | O_LARGEFILE, 0,
+                          S_IRUSR | S_IWUSR);
+ }
+-- 
+2.14.5
+
