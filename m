From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 18 Sep 2015 21:51:52 +1200
Subject: [Buildroot] [PATCH] micropython: Set MPZ_DIG_SIZE=32 for 64 bit
	targets
In-Reply-To: <CAFOYHZDSreZL_4FWoF7WzyChSx=Me1QO8NqtK25w8Js9NWyH8A@mail.gmail.com>
References: <CAFOYHZDSreZL_4FWoF7WzyChSx=Me1QO8NqtK25w8Js9NWyH8A@mail.gmail.com>
Message-ID: <1442569912-13452-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the micropython source:

  This mpz module implements arbitrary precision integers.

  The storage for each digit is defined by mpz_dig_t.  The actual number
  of bits in mpz_dig_t that are used is defined by MPZ_DIG_SIZE.  The
  machine must also provide a type that is twice as wide as mpz_dig_t,
  in both signed and unsigned versions

  MPZ_DIG_SIZE can be between 4 and 8*sizeof(mpz_dig_t), but it makes
  most sense to have it as large as possible.

Micropython detects x86_64 targets and sets MPZ_DIG_SIZE appropriately
but for other 64-bit targets we need to explicitly pass
-DMPZ_DIG_SIZE=32 in CFLAGS.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 6266882..1ac2e8d 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -16,6 +16,10 @@ ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
+ifeq ($(BR2_ARCH_IS_64),y)
+MICROPYTHON_CFLAGS += -DMPZ_DIG_SIZE=32
+endif
+
 define MICROPYTHON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
 		CROSS_COMPILE=$(TARGET_CROSS) \
-- 
2.5.0
