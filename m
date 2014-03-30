From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 20:22:01 +0400
Subject: [Buildroot] [PATCH 2/2] Makefile.in: add -mtext-section-literals to
	xtensa ABI
In-Reply-To: <1396196521-30184-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396196521-30184-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396196521-30184-3-git-send-email-jcmvbkbc@gmail.com>
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
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eea7043..31c72a0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -73,7 +73,7 @@ endif
 # code size and performance, the linker can usually optimize away the
 # overhead when a call ends up within a certain range.
 ifeq ($(BR2_xtensa),y)
-TARGET_ABI += -mlongcalls
+TARGET_ABI += -mlongcalls -mtext-section-literals
 endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
-- 
1.8.1.4
