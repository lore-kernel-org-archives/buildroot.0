From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Sep 2015 06:31:50 +0300
Subject: [Buildroot] [PATCH] micropython: Invert fallback detection logic
In-Reply-To: <1442793782-6664-1-git-send-email-judge.packham@gmail.com>
References: <1442793782-6664-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20150921033150.GJ2782@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Mon, Sep 21, 2015 at 12:03:02PM +1200, Chris Packham wrote:
> Rather than specifying architectures that do not have explicit support
> in micropython invert the logic and set MICROPY_GCREGS_SETJMP=1 if the
> architecture does not have explicit support. MIPS is listed as being
> supported but this support consists of automatically defining
> MICROPY_GCREGS_SETJMP 1 based on __mips__ being defined.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> This should clean up most of the remaining build failures. Listing the
> architectures with explicit support makes more sense to me and is
> certainly a shorter list at the moment.
> 
>  package/micropython/micropython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index f2ad5bf..e351843 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -13,7 +13,7 @@ MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe14
>  
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
> -ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
> +ifneq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),y)

We prefer positive logic, like (untested):

   ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)

baruch

>  MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
