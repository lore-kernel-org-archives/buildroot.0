From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:30:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/gcc: fix xtensa
 uclinux code generation
Message-ID: <20181125212733.47754883BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3e731f7b0ea0bf46de82636a749a449438cfae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

xtensa-uclinux uses bFLT executable file format that cannot relocate
fields representing offsets from data to code. C++ objects built as PIC
use offsets to encode FDE structures. As a result C++ exception handling
doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
xtensa-uclinux.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop gcc-8.x patch]
(cherry picked from commit 4debb2fbb7d60ed7f81ddab82d8b48ac9c4c3055)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...xtensa-don-t-force-PIC-for-uclinux-target.patch | 41 ++++++++++++++++++++++
 ...xtensa-don-t-force-PIC-for-uclinux-target.patch | 41 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/package/gcc/6.4.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/6.4.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
new file mode 100644
index 0000000000..360947cbb1
--- /dev/null
+++ b/package/gcc/6.4.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
@@ -0,0 +1,41 @@
+From 960a2552f7b418134cdf7a31e96023a3811b98dd Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 4 Nov 2018 23:55:59 -0800
+Subject: [PATCH] gcc: xtensa: don't force PIC for uclinux target
+
+xtensa-uclinux uses bFLT executable file format that cannot relocate
+fields representing offsets from data to code. C++ objects built as PIC
+use offsets to encode FDE structures. As a result C++ exception handling
+doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
+xtensa-uclinux.
+
+gcc/
+2018-11-05  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/uclinux.h (XTENSA_ALWAYS_PIC): Change to 0.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r265823
+
+ gcc/config/xtensa/uclinux.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
+index ba26187c8f7a..c7743df9d97c 100644
+--- a/gcc/config/xtensa/uclinux.h
++++ b/gcc/config/xtensa/uclinux.h
+@@ -59,8 +59,8 @@ along with GCC; see the file COPYING3.  If not see
+ #undef LOCAL_LABEL_PREFIX
+ #define LOCAL_LABEL_PREFIX	"."
+ 
+-/* Always enable "-fpic" for Xtensa Linux.  */
+-#define XTENSA_ALWAYS_PIC 1
++/* Don't enable "-fpic" for Xtensa uclinux.  */
++#define XTENSA_ALWAYS_PIC 0
+ 
+ #undef TARGET_LIBC_HAS_FUNCTION
+ #define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
+-- 
+2.11.0
+
diff --git a/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
new file mode 100644
index 0000000000..360947cbb1
--- /dev/null
+++ b/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
@@ -0,0 +1,41 @@
+From 960a2552f7b418134cdf7a31e96023a3811b98dd Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 4 Nov 2018 23:55:59 -0800
+Subject: [PATCH] gcc: xtensa: don't force PIC for uclinux target
+
+xtensa-uclinux uses bFLT executable file format that cannot relocate
+fields representing offsets from data to code. C++ objects built as PIC
+use offsets to encode FDE structures. As a result C++ exception handling
+doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
+xtensa-uclinux.
+
+gcc/
+2018-11-05  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/uclinux.h (XTENSA_ALWAYS_PIC): Change to 0.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r265823
+
+ gcc/config/xtensa/uclinux.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
+index ba26187c8f7a..c7743df9d97c 100644
+--- a/gcc/config/xtensa/uclinux.h
++++ b/gcc/config/xtensa/uclinux.h
+@@ -59,8 +59,8 @@ along with GCC; see the file COPYING3.  If not see
+ #undef LOCAL_LABEL_PREFIX
+ #define LOCAL_LABEL_PREFIX	"."
+ 
+-/* Always enable "-fpic" for Xtensa Linux.  */
+-#define XTENSA_ALWAYS_PIC 1
++/* Don't enable "-fpic" for Xtensa uclinux.  */
++#define XTENSA_ALWAYS_PIC 0
+ 
+ #undef TARGET_LIBC_HAS_FUNCTION
+ #define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
+-- 
+2.11.0
+
