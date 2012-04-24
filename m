From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 10:08:12 +0200
Subject: [Buildroot] [git commit] sane-backends: fix build on !x86
Message-ID: <20120424080852.A04C396BB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e08e35326cd4767f7f49f8a1d13f9389dc6a43f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qcam backend uses x86 specific inb/outb/ioperm interface, so replace
with noops on !x86.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../sane-backends-1.0.22-qcam-x86.patch            |   61 ++++++++++++++++++++
 1 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends-1.0.22-qcam-x86.patch b/package/sane-backends/sane-backends-1.0.22-qcam-x86.patch
new file mode 100644
index 0000000..f14dd0e
--- /dev/null
+++ b/package/sane-backends/sane-backends-1.0.22-qcam-x86.patch
@@ -0,0 +1,61 @@
+[PATCH] backend/qcam.c: fix build on !x86
+
+inb/outb/ioperm are x86 specific interfaces, so replace with noops on
+!x86.
+
+Inspired by similar patch in openwrt:
+https://dev.openwrt.org/ticket/5689
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ backend/qcam.c |   14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+Index: sane-backends-1.0.22/backend/qcam.c
+===================================================================
+--- sane-backends-1.0.22.orig/backend/qcam.c
++++ sane-backends-1.0.22/backend/qcam.c
+@@ -205,12 +205,20 @@
+ 
+ #endif /* <sys/io.h> || <asm/io.h> || <sys/hw.h> */
+ 
++/* inb / outb only exist on x86 */
++#if defined(__i386__) || defined(__x86_64__)
+ #define read_lpdata(d)		inb ((d)->port)
+ #define read_lpstatus(d)	inb ((d)->port + 1)
+ #define read_lpcontrol(d)	inb ((d)->port + 2)
+ #define write_lpdata(d,v)	outb ((v), (d)->port)
+ #define write_lpcontrol(d,v)	outb ((v), (d)->port + 2)
+-
++#else
++#define read_lpdata(d)		0
++#define read_lpstatus(d)	0
++#define read_lpcontrol(d)	0
++#define write_lpdata(d,v)
++#define write_lpcontrol(d,v)
++#endif
+ 
+ static SANE_Status
+ enable_ports (QC_Device * q)
+@@ -219,8 +227,10 @@
+   if (q->port < 0x278 || q->port > 0x3bc)
+     return SANE_STATUS_INVAL;
+ 
++#if defined(__i386__) || defined(__x86_64__)
+   if (ioperm (q->port, 3, 1) < 0)
+     return SANE_STATUS_INVAL;
++#endif
+ 
+   return SANE_STATUS_GOOD;
+ }
+@@ -228,8 +238,10 @@
+ static SANE_Status
+ disable_ports (QC_Device * q)
+ {
++#if defined(__i386__) || defined(__x86_64__)
+   if (ioperm (q->port, 3, 0) < 0)
+     return SANE_STATUS_INVAL;
++#endif
+ 
+   return SANE_STATUS_GOOD;
+ }
