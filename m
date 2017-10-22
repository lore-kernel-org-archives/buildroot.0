From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:40:02 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] libffi: add patch to fix
	MIPS support
Message-ID: <20171022224415.2A08D8103F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e27c8e67f45cbc9e853228f669ce483a83b63265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Building Python 3.x on MIPS with musl fails because the libffi code
uses a "#ifdef linux" test to decide if we're building on Linux or
not. When building with -std=c99, "linux" is not defined, so instead
of including <asm/sgidefs.h>, libffi's code tries to include
<sgidefs.h>, which doesn't exist on musl.

The right fix is to use __linux__, which is POSIX compliant, and
therefore defined even when -std=c99 is used.

Note that glibc and uClibc were not affected because they do provide a
<sgidefs.h> header in addition to the <asm/sgidefs.h> one.

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
[Thomas: reformat patch with Git, add a better commit log and description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit 4852f05907cd365825f37c283a415a77ba1fcba9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-mips-use-__linux__-and-not-linux.patch    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libffi/0005-mips-use-__linux__-and-not-linux.patch b/package/libffi/0005-mips-use-__linux__-and-not-linux.patch
new file mode 100644
index 0000000..a48f3d3
--- /dev/null
+++ b/package/libffi/0005-mips-use-__linux__-and-not-linux.patch
@@ -0,0 +1,37 @@
+From 1f43e5edfd91bee80e518432b80db01f1bf226e3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 22 Oct 2017 15:02:11 +0200
+Subject: [PATCH] mips: use __linux__ and not linux
+
+The "linux" symbol is not POSIX compliant [1], and therefore not
+defined when building with -std=c99. Due to this, the linux
+conditional block doesn't get used on Linux when building Python 3.x
+(which is built with -std=c99). To fix this, we use the POSIX
+compliant __linux__ symbol, which is defined when -std=c99 is used.
+
+This fixes the build of Python 3.x on MIPS/musl configuration, as it
+makes sures that <asm/sgidefs.h> gets included and not <sgidefs.h>.
+
+[1] https://sourceforge.net/p/predef/wiki/OperatingSystems/
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/mips/ffitarget.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mips/ffitarget.h b/src/mips/ffitarget.h
+index 717d659..6faa358 100644
+--- a/src/mips/ffitarget.h
++++ b/src/mips/ffitarget.h
+@@ -32,7 +32,7 @@
+ #error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
+ #endif
+ 
+-#ifdef linux
++#ifdef __linux__
+ # include <asm/sgidefs.h>
+ #elif defined(__rtems__)
+ /*
+-- 
+2.13.6
+
