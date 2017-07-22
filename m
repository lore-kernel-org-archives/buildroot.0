From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 14:56:19 +0200
Subject: [Buildroot] [PATCH 04/20] package/skeleton: make
 SKELETON_LIB_SYMLINK a macro
In-Reply-To: <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <536fe404-3900-c733-b3d7-874b59980b66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Rather than duplicate that code in all skeleton packages, make this a
> macro, so that it is easier to use.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However...

> ---
>  package/skeleton/skeleton.mk | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 017479a990..0a8add66dc 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -17,6 +17,7 @@ SKELETON_INSTALL_STAGING = YES
>  ############
>  # Macros available for use by any skeleton package:
>  # - SKELETON_RSYNC
> +# - SKELETON_LIB_SYMLINK
>  
>  # This function rsyncs the skeleton directory in $(1) to the destination
>  # in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
> @@ -26,6 +27,21 @@ define SKELETON_RSYNC
>  		$(1)/ $(2)/
>  endef
>  
> +# Make a symlink lib32->lib or lib64->lib as appropriate.
> +# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
> +# $(1): base dir (either staging or target)
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)

 This makes me wonder: are we doing the right thing with NABI32? What is the
semantics of BR2_ARCH_IS_64? I would say, it doesn't specify that you have a
32-bit or 64-bit capable CPU; instead, it says that you have a 32-bit or 64-bit
userspace. I.e., that void* and long are 32 resp. 64 bits. Indeed, I don't think
it's really relevant for Buildroot to know about the CPU capabilities, the
important thing is the userpace ABI, i.e. how we compile packages.

 So, with that in mind, I think we should NOT select BR2_ARCH_IS_64 for the n32
ABI. Similarly, when we add x32, it should also not be BR2_ARCH_IS_64.

 It's a kind of big change though, that also affects how the architectures are
selected, and possibly with legacy implications...

 Vicente, what do you think?


 Regards,
 Arnout

 PS when replying to this, better change the subject :-)


> +define SKELETON_LIB_SYMLINK
> +	ln -snf lib $(1)/lib64
> +	ln -snf lib $(1)/usr/lib64
> +endef
> +else
> +define SKELETON_LIB_SYMLINK
> +	ln -snf lib $(1)/lib32
> +	ln -snf lib $(1)/usr/lib32
> +endef
> +endif
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
