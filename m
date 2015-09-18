From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 11:02:07 +0100
Subject: [Buildroot] [PATCH] micropython: Set MPZ_DIG_SIZE=32 for 64 bit
	targets
In-Reply-To: <1442569912-13452-1-git-send-email-judge.packham@gmail.com>
References: <CAFOYHZDSreZL_4FWoF7WzyChSx=Me1QO8NqtK25w8Js9NWyH8A@mail.gmail.com>
 <1442569912-13452-1-git-send-email-judge.packham@gmail.com>
Message-ID: <55FBE11F.2000700@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On 09/18/2015 10:51 AM, Chris Packham wrote:
> From the micropython source:
> 
>   This mpz module implements arbitrary precision integers.
> 
>   The storage for each digit is defined by mpz_dig_t.  The actual number
>   of bits in mpz_dig_t that are used is defined by MPZ_DIG_SIZE.  The
>   machine must also provide a type that is twice as wide as mpz_dig_t,
>   in both signed and unsigned versions
> 
>   MPZ_DIG_SIZE can be between 4 and 8*sizeof(mpz_dig_t), but it makes
>   most sense to have it as large as possible.
> 
> Micropython detects x86_64 targets and sets MPZ_DIG_SIZE appropriately
> but for other 64-bit targets we need to explicitly pass
> -DMPZ_DIG_SIZE=32 in CFLAGS.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/micropython.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 6266882..1ac2e8d 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -16,6 +16,10 @@ ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
>  MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
>  endif
>  
> +ifeq ($(BR2_ARCH_IS_64),y)
> +MICROPYTHON_CFLAGS += -DMPZ_DIG_SIZE=32
> +endif
> +

you have to take into account that MIPS64 n32 is a 64-bit target as
well, but it has a MP_SSIZE_MAX of 32-bit. So, if you set MPZ_DIG_SIZE
to 32 for all 64-bit arches, then you will see the same failure for the
when building for MIPS64 n32.

I suggest you to do modify the "ifeq" like this:

# MIPS64 n32 is a 64-bit arch, but it has a 32-bit wide SSIZE_MAX which
# means we still need the default MPZ_DIG_SIZE of 16.
ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)


Regards,

Vincent.

>  define MICROPYTHON_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
>  		CROSS_COMPILE=$(TARGET_CROSS) \
> 
