From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 24 Sep 2015 11:43:49 +1200
Subject: [Buildroot] [PATCHv3 1/3] micropython: Invert fallback detection
	logic
In-Reply-To: <1443051831-8292-1-git-send-email-judge.packham@gmail.com>
References: <1443051831-8292-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1443051831-8292-2-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than specifying architectures that do not have explicit support
in micropython invert the logic and set MICROPY_GCREGS_SETJMP=1 if the
architecture does not have explicit support. MIPS is listed as being
supported but this support consists of automatically defining
MICROPY_GCREGS_SETJMP 1 based on __mips__ being defined.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
This should clean up most of the remaining build failures. Listing the
architectures with explicit support makes more sense to me and is
certainly a shorter list at the moment.
    
Changes since v1:
- Use positive logic ifeq(,) instead of ifneq(,y)
Changes since v2:
- none

 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 7ae88a0..1358864 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -15,7 +15,7 @@ MICROPYTHON_PATCH = \
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
+ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
-- 
2.5.0
