From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Mar 2020 15:45:01 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on arm32
 arch not armv7
In-Reply-To: <20200325143108.11935-1-giulio.benetti@benettiengineering.com>
References: <20200325143108.11935-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200325154501.3e922440@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Mar 2020 15:31:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index dc502f309..c7eb9c205 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -781,7 +781,7 @@ ifeq ($(CPU_ARCH),arm)
> + USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
> + $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
> + ifndef NSS_DISABLE_GCM_ARM32_NEON
> +-$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
> ++$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)

But only ARMv7 can have NEON support support. So removing just
-march=armv7 doesn't make sense. Actually, the issue is probably that
they should be using -march=armv7-a, because -march=armv7 is the common
subset of ARMv7-A, ARMv7-M and ARMv7-R, which I suppose doesn't include
NEON.

So while the patch work, its description is misleading at best, and
having -march=armv7-a here is probably the right fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
