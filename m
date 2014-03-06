From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 08:09:39 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain-external: fix musl external
 support on x86
In-Reply-To: <1394058220-5863-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53181F33.4060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 23:23, Thomas Petazzoni wrote:
> On x86, the symbolic link ld-musl-<ARCH>.so.1 to libc.so must be
> ld-musl-i386.so.1 in all cases, but $(ARCH) in Buildroot might be
> i386, i486, i586, i686, etc. depending on the specific x86 variants
> being selected.
> 
> This commit fixes that by creating a MUSL_ARCH variable set to i386 on
> x86, and to $(ARCH) on other architectures.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  toolchain/toolchain-external/toolchain-external.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 378e7b2..1b1053d 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -447,8 +447,13 @@ endef
>  # of the dynamic library loader. We just need to create a symbolic
>  # link to libc.so with the appropriate name.
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> +ifeq ($(BR2_i386),y)
> +MUSL_ARCH = i386
> +else
> +MUSL_ARCH = $(ARCH)
> +endif
>  define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> -	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(ARCH).so.1
> +	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
>  endef
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
