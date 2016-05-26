From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 15:15:02 +0200
Subject: [Buildroot] [git commit] jamvm: add patch to fix musl build
Message-ID: <20160526135039.911AC81EE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b6b67f34d6d4aeb340bbca579dbf85363c3f4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch available from JamVM's bug tracker to fix the build with
the musl C library. The build was verified with the musl and uClibc C
libraries.

Fixes:

  http://autobuild.buildroot.org/results/8292973e9f6f2971d090f02f24d11a31709254cf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Use-fenv.h-instead-of-fpu_control.h.patch | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch b/package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch
new file mode 100644
index 0000000..50f95cd
--- /dev/null
+++ b/package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch
@@ -0,0 +1,86 @@
+From 7152ded5219453c9ff1cd062cecbeaf4d77e4cab Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 26 May 2016 15:05:48 +0200
+Subject: [PATCH] Use <fenv.h> instead of <fpu_control.h>
+
+musl libc (http://musl-libc.org lack the non-standard <fpu_control.h>
+header, which is used in src/os/linux/{i386,x86_64}/init.c files to
+setup the floating point precision. This patch makes it use the
+standard C <fenv.h> header instead.
+
+Original patch at Felix Janda at
+https://sourceforge.net/p/jamvm/patches/6/.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/os/linux/i386/init.c   | 12 ++++++------
+ src/os/linux/x86_64/init.c | 16 ++++++----------
+ 2 files changed, 12 insertions(+), 16 deletions(-)
+
+diff --git a/src/os/linux/i386/init.c b/src/os/linux/i386/init.c
+index d9c6648..94a733e 100644
+--- a/src/os/linux/i386/init.c
++++ b/src/os/linux/i386/init.c
+@@ -19,18 +19,18 @@
+  * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+  */
+ 
+-#include <fpu_control.h>
++#include <fenv.h>
+ 
+ /* Change floating point precision to double (64-bit) from
+  * the extended (80-bit) Linux default. */
+ 
+ void setDoublePrecision() {
+-    fpu_control_t cw;
++    fenv_t fenv;
+ 
+-    _FPU_GETCW(cw);
+-    cw &= ~_FPU_EXTENDED;
+-    cw |= _FPU_DOUBLE;
+-    _FPU_SETCW(cw);
++    fegetenv(&fenv);
++    fenv.__control_word &= ~0x300; /* _FPU_EXTENDED */
++    fenv.__control_word |= 0x200; /* _FPU_DOUBLE */
++    fesetenv(&fenv);
+ }
+ 
+ void initialisePlatform() {
+diff --git a/src/os/linux/x86_64/init.c b/src/os/linux/x86_64/init.c
+index 9d55229..a76a923 100644
+--- a/src/os/linux/x86_64/init.c
++++ b/src/os/linux/x86_64/init.c
+@@ -19,9 +19,7 @@
+  * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+  */
+ 
+-#ifdef __linux__
+-#include <fpu_control.h>
+-#endif
++#include <fenv.h>
+ 
+ /* Change the x87 FPU precision to double (64-bit) from the extended
+    (80-bit) Linux default.  Note, unlike on i386, my testcases pass
+@@ -30,14 +28,12 @@
+ */
+ 
+ void setDoublePrecision() {
+-#ifdef __linux__
+-    fpu_control_t cw;
++    fenv_t fenv;
+ 
+-    _FPU_GETCW(cw);
+-    cw &= ~_FPU_EXTENDED;
+-    cw |= _FPU_DOUBLE;
+-    _FPU_SETCW(cw);
+-#endif
++    fegetenv(&fenv);
++    fenv.__control_word &= ~0x300; /*_FPU_EXTENDED */
++    fenv.__control_word |= 0x200; /*_FPU_DOUBLE */
++    fesetenv(&fenv);
+ }
+ 
+ void initialisePlatform() {
+-- 
+2.7.4
+
