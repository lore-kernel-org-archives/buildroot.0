From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 20:55:37 +0400
Subject: [Buildroot] [PATCH v2 2/3] Makefile.in: add -mtext-section-literals
	to xtensa ABI
In-Reply-To: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396198538-32628-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Collecting literals into separate section can be advantageous if that
section is placed into DTCM at link time. This is applicable for code
running on bare metal, but makes no sense under linux, where userspace
is isolated from the physical memory details. OTOH placing literals into
separate section breaks build of huge source files, because l32r
instruction can only access literals in 256 KBytes range.

Add -mtext-section-literals into xtensa ABI to fix build issues of
packages with huge sources.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1 -> v2:
- add comment to XTENSA_ABI variable explaining -mtext-section-literals usage

 package/Makefile.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eea7043..a70e538 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -72,8 +72,17 @@ endif
 # and is required for some packages. While this option can degrade both
 # code size and performance, the linker can usually optimize away the
 # overhead when a call ends up within a certain range.
+#
+# Use text-section-literals for Xtensa globally.
+# Collecting literals into separate section can be advantageous if that
+# section is placed into DTCM at link time. This is applicable for code
+# running on bare metal, but makes no sense under linux, where userspace
+# is isolated from the physical memory details. OTOH placing literals into
+# separate section breaks build of huge source files, because l32r
+# instruction can only access literals in 256 KBytes range.
+#
 ifeq ($(BR2_xtensa),y)
-TARGET_ABI += -mlongcalls
+TARGET_ABI += -mlongcalls -mtext-section-literals
 endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
-- 
1.8.1.4
