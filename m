From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Apr 2019 19:22:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/sane-backends: remove unneeded
 first patch
Message-ID: <20190416172245.18739-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is not needed since version 1.0.25 and
https://gitlab.com/sane-project/backends/commit/8434ea91623f313eeb68ac301f7c7abf65976fc8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sane-backends/0001-qcam-x86.patch     | 61 -------------------
 ...1-sane_backend-add-missing-config.h.patch} |  0
 2 files changed, 61 deletions(-)
 delete mode 100644 package/sane-backends/0001-qcam-x86.patch
 rename package/sane-backends/{0002-sane_backend-add-missing-config.h.patch => 0001-sane_backend-add-missing-config.h.patch} (100%)

diff --git a/package/sane-backends/0001-qcam-x86.patch b/package/sane-backends/0001-qcam-x86.patch
deleted file mode 100644
index f14dd0e980..0000000000
--- a/package/sane-backends/0001-qcam-x86.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-[PATCH] backend/qcam.c: fix build on !x86
-
-inb/outb/ioperm are x86 specific interfaces, so replace with noops on
-!x86.
-
-Inspired by similar patch in openwrt:
-https://dev.openwrt.org/ticket/5689
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- backend/qcam.c |   14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-Index: sane-backends-1.0.22/backend/qcam.c
-===================================================================
---- sane-backends-1.0.22.orig/backend/qcam.c
-+++ sane-backends-1.0.22/backend/qcam.c
-@@ -205,12 +205,20 @@
- 
- #endif /* <sys/io.h> || <asm/io.h> || <sys/hw.h> */
- 
-+/* inb / outb only exist on x86 */
-+#if defined(__i386__) || defined(__x86_64__)
- #define read_lpdata(d)		inb ((d)->port)
- #define read_lpstatus(d)	inb ((d)->port + 1)
- #define read_lpcontrol(d)	inb ((d)->port + 2)
- #define write_lpdata(d,v)	outb ((v), (d)->port)
- #define write_lpcontrol(d,v)	outb ((v), (d)->port + 2)
--
-+#else
-+#define read_lpdata(d)		0
-+#define read_lpstatus(d)	0
-+#define read_lpcontrol(d)	0
-+#define write_lpdata(d,v)
-+#define write_lpcontrol(d,v)
-+#endif
- 
- static SANE_Status
- enable_ports (QC_Device * q)
-@@ -219,8 +227,10 @@
-   if (q->port < 0x278 || q->port > 0x3bc)
-     return SANE_STATUS_INVAL;
- 
-+#if defined(__i386__) || defined(__x86_64__)
-   if (ioperm (q->port, 3, 1) < 0)
-     return SANE_STATUS_INVAL;
-+#endif
- 
-   return SANE_STATUS_GOOD;
- }
-@@ -228,8 +238,10 @@
- static SANE_Status
- disable_ports (QC_Device * q)
- {
-+#if defined(__i386__) || defined(__x86_64__)
-   if (ioperm (q->port, 3, 0) < 0)
-     return SANE_STATUS_INVAL;
-+#endif
- 
-   return SANE_STATUS_GOOD;
- }
diff --git a/package/sane-backends/0002-sane_backend-add-missing-config.h.patch b/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
similarity index 100%
rename from package/sane-backends/0002-sane_backend-add-missing-config.h.patch
rename to package/sane-backends/0001-sane_backend-add-missing-config.h.patch
-- 
2.20.1
