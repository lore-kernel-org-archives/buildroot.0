From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Jan 2012 07:28:18 +0200
Subject: [Buildroot] [PATCH 05/14] Expand external toolchain wrapper to
 custom flags
In-Reply-To: <6fb3d3263d9c8989b75248f74261197562233489.1325622133.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
 <6fb3d3263d9c8989b75248f74261197562233489.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20120124052818.GA13673@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jan 03, 2012 at 09:22:46PM +0100, Thomas Petazzoni wrote:
> The BR2_TARGET_OPTIMIZATION flags were not used by the external
> toolchain wrapper, which broke the multilib selection logic of
> multilib external toolchains. It also simplifies the compilation of
> external programs since all flags are properly passed automatically by
> the toolchain wrapper.

This patch supersedes the one from Matias Garcia 
(http://lists.busybox.net/pipermail/buildroot/2011-July/043944.html) and fixes 
the multiple arguments problem mentioned by Peter 
(http://lists.busybox.net/pipermail/buildroot/2011-July/044639.html). I've 
used it to build an e500v2 based filesystem with the CodeSourcery toolchain.

Tested-by: Baruch Siach <baruch@tkos.co.il>

Thanks,

baruch

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/ext-tool.mk           |    8 ++++++++
>  .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 1e62201..b768c0b 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -150,6 +150,14 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
>  endif
>  
> +ifneq ($(BR2_TARGET_OPTIMIZATION),)
> +TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> +# We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
> +# flag is a separate argument when used in execv() by the external
> +# toolchain wrapper.
> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
> +endif
> +
>  ifeq ($(BR2_SOFT_FLOAT),y)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index cc404f3..719f13b 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -40,6 +40,9 @@ static char *predef_args[] = {
>  #ifdef BR_VFPFLOAT
>  	"-mfpu=vfp",
>  #endif /* BR_VFPFLOAT */
> +#ifdef BR_ADDITIONAL_CFLAGS
> +	BR_ADDITIONAL_CFLAGS
> +#endif
>  };
>  
>  static const char *get_basename(const char *name)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
