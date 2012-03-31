From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 31 Mar 2012 23:57:35 +0200
Subject: [Buildroot] [git commit] systemd: fix build on uClibc
Message-ID: <20120331215812.E994E969C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=575d4712e1c4305acdba74e1af9277114ce99883
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch based on similar patch in openembedded.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/systemd/systemd-uclibc-fix.patch |   40 ++++++++++++++++++++++++++++++
 package/systemd/systemd.mk               |    3 ++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
new file mode 100644
index 0000000..24c32ab
--- /dev/null
+++ b/package/systemd/systemd-uclibc-fix.patch
@@ -0,0 +1,40 @@
+[PATCH] fix build with uClibc
+
+Based on OE patch from Khem Raj:
+
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
+
+But extended to also cover execvpe (OE carries a patch adding execvpe
+support to uClibc).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/macro.h |   15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+Index: systemd-37/src/macro.h
+===================================================================
+--- systemd-37.orig/src/macro.h
++++ systemd-37/src/macro.h
+@@ -27,6 +27,21 @@
+ #include <sys/uio.h>
+ #include <inttypes.h>
+ 
++#ifdef __UCLIBC__
++/* uclibc does not implement mkostemp GNU extension */
++#define mkostemp(x,y) mkstemp(x)
++/* uclibc does not implement execvpe GNU extension */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++#include <unistd.h>
++static inline int execvpe(const char *file, char *const argv[],
++                          char *const envp[])
++{
++        environ = (char **)envp;
++        return execvp(file, argv);
++}
++#endif
+ #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
+ #define _sentinel_ __attribute__ ((sentinel))
+ #define _noreturn_ __attribute__((noreturn))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fc49f3c..eded472 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -41,6 +41,9 @@ else
 	SYSTEMD_CONF_OPT += --disable-acl
 endif
 
+# mq_getattr needs -lrt
+SYSTEMD_MAKE_OPT += LIBS=-lrt
+
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemd $(TARGET_DIR)/sbin/init
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
