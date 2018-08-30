From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Thu, 30 Aug 2018 11:57:48 +0200
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: Use '-isystem' instead of
 '-I' in HOST_CFLAGS
Message-ID: <20180830095748.30297-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the last update of the DTC package, linux build breaks at some point
with the following error:

    In file included from {output}/host/include/libfdt.h:54:0,
                     from scripts/dtc/libfdt/fdt.c:54:
    {output}/host/include/libfdt_env.h:82:24: error: redefinition of \
    ?fdt16_to_cpu?
     static inline uint16_t fdt16_to_cpu(fdt16_t x)
                            ^~~~~~~~~~~~
    In file included from scripts/dtc/libfdt/fdt.c:51:0:
    scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of \
    ?fdt16_to_cpu? was here

This is because the HOST_CFLAGS is added before Linux's makefile add it's
own local ones (-Iscripts/dtc/libfdt), resulting in a mix of local and host
headers beeing used.

So, to fix this the '-I' is substituted by '-isystem' to let it search for
the headers in the right location first.

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 675e7906a8..a31617ca22 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -115,7 +115,7 @@ LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTCC="$(HOSTCC) $(patsubst -I%,-isystem %,$(HOST_CFLAGS)) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
2.13.6
