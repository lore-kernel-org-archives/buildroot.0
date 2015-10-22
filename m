From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 22:27:54 +0200
Subject: [Buildroot] [PATCH] toochain/wrapper: fix potential bug in
	foreach loop
In-Reply-To: <1445462467-26873-1-git-send-email-yann.morin.1998@free.fr>
References: <1445462467-26873-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <562946CA.2020403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 23:21, Yann E. MORIN wrote:
> In Makefile, the comma ',' is used to separate the arguments passed to
> functions, so we should not be allowed to use straight commas in strings
> we want to expand.
> 
> For the toolchain wrapper, we need to transform a list:
>     -mfoo -mbar -mbuz
> 
> into something acceptable for a C array assignment:
>     "-mfoo", "-mbar", "-mbuz",
> 
> So, we use a $(foreach ...) loop for that. However, we do have a
> straight comma in there.
> 
> It does not cause any issue in practice, since $(foreach) is a make
> builtin function that accepts three and only three parameters.
> 
> However, this is not sane.
> 
> Change the straight comma to the usual $(comma) expansion, like we sould
> do for a call to any other function.
> 
> At the same time, make the code a bit easier to read, by first creating
> the transformed list, and then creating the define.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (Build test with BR2_TARGET_OPTIMIZATION containing two elements)


 Regards,
 Arnout


> ---
>  toolchain/toolchain-wrapper.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index eba2b38..af39071 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -14,7 +14,9 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
>  
>  # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
>  # separate argument when used in execv() by the toolchain wrapper.
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
> +TOOLCHAIN_WRAPPER_OPTS = \
> +	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
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
