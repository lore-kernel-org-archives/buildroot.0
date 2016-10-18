From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 20:57:55 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-wrapper.mk: refactor
 additional flags into TARGET_FLAGS
In-Reply-To: <20161018185128.6404-1-arnout@mind.be>
References: <20161018185128.6404-1-arnout@mind.be>
Message-ID: <4a388102-267d-9be5-b293-0877e55ca958@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Oops, I forgot to add a cover letter...

On 18-10-16 20:51, Arnout Vandecappelle (Essensium/Mind) wrote:
> Currently, the additional flags encoded in the toolchain wrapper are
> limited to BR2_TARGET_OPTIMIZATION. However, we are going to add more
> flags to it, so it is convenient to have a TARGET_FLAGS variable
> that collects all of them and do the list-to-array conversion on all
> of them together.
> 
> The variable is called TARGET_FLAGS because later it will be modified
> to include all the flags that we pass to the toolchain wrapper, and
> it will also be used as the base for TARGET_CFLAGS etc.

 So this is a part of a series I'm trying to build that will sanitize the flags
passed to the wrapper and passed to the build systems. The idea is that all the
flags that are currently hardcoded in toolchain-wrapper.c will move into
TARGET_FLAGS, and that all flags that are currently added to TARGET_CFLAGS but
not to the wrapper get added to TARGET_FLAGS as well.

 I have only lightly tested this; Vincent, please include this in your series
and test for real.

 I wanted to push this patch fast so Vicente can use it in his series. However,
the idea is to move all this setting of flags into a new .mk file. I was
thinking of toolchain/toolchain-flags.mk. If anyone has better ideas, please
speak up!

 Regards,
 Arnout

> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-wrapper.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index af39071..8939650 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -9,14 +9,15 @@ else
>  TOOLCHAIN_WRAPPER_HASH_STYLE = both
>  endif
>  
> +TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> +
>  TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
>  
>  # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
>  # separate argument when used in execv() by the toolchain wrapper.
> -TOOLCHAIN_WRAPPER_OPTS = \
> -	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
> +TOOLCHAIN_WRAPPER_ARGS += \
> +	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TARGET_FLAGS),"$(f)"$(comma))'
>  
>  ifeq ($(BR2_CCACHE),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
