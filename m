From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 23:17:04 +0100
Subject: [Buildroot] [PATCH v3 1/2] erlang: use erlang's native atomic
	ops
In-Reply-To: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
References: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56D22060.4020108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/16 20:17, Frank Hunleth wrote:
> Now that we're using Erlang 18, the preferred atomic ops implementation
> for Erlang is its own built-in implementation, so use it.  It is still
> possible to use libatomic_ops if the native implementation does not
> work. BR2_PACKAGE_ERLANG_ARCH_SUPPORTS is added now that
> BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS is no longer appropriate for
> checking whether Erlang can be built for a platform.
> 
> This fixes an autobuilder failure when using libatomic_ops on aarch64.
> Erlang's native atomic ops implementation works on this platform.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
[snip]
> +config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sparc_v9 || BR2_arm || BR2_aarch64 # case (1)

 This line is too long, please split it.

> +	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)
>  
>  config BR2_PACKAGE_ERLANG
>  	bool "erlang"
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS
> -	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
> -	select BR2_PACKAGE_LIBATOMIC_OPS
> +	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	help
>  	  Erlang is a programming language used to build massively scalable
>  	  soft real-time systems with requirements on high availability.
> @@ -20,6 +36,14 @@ config BR2_PACKAGE_ERLANG
>  
>  if BR2_PACKAGE_ERLANG
>  
> +config BR2_PACKAGE_ERLANG_LIBATOMIC_OPS
> +	bool "libatomic_ops"

 Does it make sense to let the user select this? I don't think so...

 I think we should have:

config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS_DIRECTLY # case (1)
	bool
	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
		BR2_sparc_v9 || BR2_arm # aarch64 causes build failures

config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
	bool
	default y if BR2_PACKAGE_ERLANG_ARCH_SUPPORTS_DIRECTLY
	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)

and nothing more.

> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
> +	depends on !BR2_aarch64 # causes build failures
> +	select BR2_PACKAGE_LIBATOMIC_OPS
> +	help
> +	  Use libatomic_ops instead of Erlang's native atomic ops support.
> +
>  config BR2_PACKAGE_ERLANG_SMP
>  	bool "enable SMP support"
>  	help
> @@ -38,3 +62,8 @@ config BR2_PACKAGE_ERLANG_MEGACO
>  	  enable it.
>  
>  endif # BR2_PACKAGE_ERLANG
> +
> +comment "erlang needs a toolchain w/ dynamic library, atomic_ops"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_ERLANG_ARCH_SUPPORTS

 This should depend on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS, so:

comment "erlang needs a toolchain w/ dynamic library"
	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
	depends on BR2_USE_MMU # fork()
	depends on BR2_STATIC_LIBS

and that should ideally be a separate patch, or at least mentioned in the commit
message.

> +
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 638d2c2..8257ab4 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -30,8 +30,12 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
>  
>  ERLANG_CONF_OPTS = --without-javac
>  
> +# Erlang uses its own native atomic ops implementation if support is
> +# available. Override this if the user wants libatomic_ops.
> +ifeq ($(BR2_PACKAGE_ERLANG_LIBATOMIC_OPS),y)

 So here it should be

ifeq ($(BR2_PACKAGE_ERLANG_ARCH_SUPPORTS_DIRECTLY),)


 Regards,
 Arnout

>  ERLANG_DEPENDENCIES += libatomic_ops
>  ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
> +endif
>  
>  # erlang uses openssl for all things crypto. Since the host tools (such as
>  # rebar) uses crypto, we need to build host-erlang with support for openssl.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
