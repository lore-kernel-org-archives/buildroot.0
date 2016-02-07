From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 13:49:32 +0100
Subject: [Buildroot] [PATCH v2 18/18] erlang: support choosing atomic ops
In-Reply-To: <1454443064-14269-19-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-19-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B73D5C.9020704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Erlang requires atomic ops support and provides several options for
> fulfilling this need. Previously in Buildroot only the libatomic_ops
> option was used, but with Erlang 18, the Erlang developers prefer
> their own atomic ops implementation is used. This change makes it
> possible to select between options.
> 
> Additionally, this fixes an autobuilder failure that occurs when using
> libatomic_ops on aarch64. Erlang's native atomic ops implementation
> works on aarch64.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1->v2:
>   - Add BR2_PACKAGE_ERLANG_ARCH_SUPPORTS and related changes
>     (Thanks to Thomas)
>   - Atomic ops selection is a choice now due to the potential for
>     more than two options based on the Erlang documentation.
>   - Line wrapping updates
>   - Added note on Erlang choosing native atomic ops even if
>     libatomic_ops is present.
>   - Removed LIBS=-latomic_ops. The ./configure test for it still
>     worked, and Erlang linked to it without errors. 
> 
>  package/erlang/Config.in | 55 ++++++++++++++++++++++++++++++++++++++++++------
>  package/erlang/erlang.mk |  6 +++++-
>  2 files changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 0ec01bb..2a3098c 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -1,14 +1,30 @@
> -comment "erlang needs a toolchain w/ dynamic library"
> -	depends on BR2_USE_MMU # fork()
> -	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> -	depends on BR2_STATIC_LIBS
> +# Erlang requires platform support for atomic operations. See the
> +# HOWTO/INSTALL.md file for the full description. A summary of the
> +# options is as follows:
> +#
> +#   1. Erlang's atomic operations on 32/64-bit x86, 32/64-bit
> +#      SPARC V9, 32-bit PowerPC, or 32-bit Tile. The INSTALL.md
> +#      omits 32/64-bit ARM support, but those are supported as well.
> +#   2. The API provided by Windows (N/A for Buildroot)
> +#   3. Native atomic operations provided by the '__atomic_*' builtins
> +#      with gcc 4.7 or later.
> +#   4. libatomic_ops
> +#   5. The availability of __sync_*() operations. Based on
> +#      http://autobuild.buildroot.org/results/209/2090874eee165af3349cf2d597657fc1b4ca1012/build-end.log,
> +#      it needs the 4-byte and 8-byte versions.
> +#
> +# Cases 3 and 5 do not appear to work on configurations that are not
> +# included in 1 and 4 due to compiler errors.
> +config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sparc_v9 || BR2_arm || BR2_aarch64 # case (1)
> +	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)

Copy past error: BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS doesn't exist but you
probably wanted BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS.

Maybe BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS which is defined in libatomic_ops
package is confusing... Thomas ?

>  
>  config BR2_PACKAGE_ERLANG
>  	bool "erlang"
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS
> -	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> -	select BR2_PACKAGE_LIBATOMIC_OPS
> +	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	help
>  	  Erlang is a programming language used to build massively scalable
>  	  soft real-time systems with requirements on high availability.
> @@ -20,6 +36,28 @@ config BR2_PACKAGE_ERLANG
>  
>  if BR2_PACKAGE_ERLANG
>  
> +choice
> +	prompt "atomic ops"
> +	help
> +	  Selects the atomic operations implementation used by the Erlang
> +	  VM
> +
> +config BR2_PACKAGE_ERLANG_NATIVE_ATOMIC_OPS
> +	bool "native atomic ops"
> +	help
> +	  Use Erlang's native atomic ops implementation. If unsure, select
> +	  this choice.

Well, for now BR2_PACKAGE_ERLANG_NATIVE_ATOMIC_OPS is not used anywhere.

Maybe you can just add BR2_PACKAGE_ERLANG_LIBATOMIC_OPS for now. If Erlang add a
new libatomic options in a further release then you can add a choice in the
packaging.

> +
> +config BR2_PACKAGE_ERLANG_LIBATOMIC_OPS
> +	bool "libatomic_ops"
> +	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> +	depends on !BR2_aarch64 # causes build failures
> +	select BR2_PACKAGE_LIBATOMIC_OPS
> +	help
> +	  Use libatomic_ops to provide atomic ops support.
> +
> +endchoice
> +
>  config BR2_PACKAGE_ERLANG_SMP
>  	bool "enable SMP support"
>  	help
> @@ -38,3 +76,8 @@ config BR2_PACKAGE_ERLANG_MEGACO
>  	  enable it.
>  
>  endif # BR2_PACKAGE_ERLANG
> +
> +comment "erlang needs a toolchain w/ dynamic library, atomic_ops"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_ERLANG_ARCH_SUPPORTS

Indeed the dependencies comment is missing in erlang but it's not related to
libatomic_ops. It would be great if you add this in a separate patch at the
beginning of this series.

> +
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 638d2c2..b1c8e35 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -30,8 +30,12 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
>  
>  ERLANG_CONF_OPTS = --without-javac
>  
> +# Erlang uses its own native atomic ops implementation if support is
> +# available. Override this if the user wants libatomic_ops.
> +ifeq ($(BR2_PACKAGE_ERLANG_LIBATOMIC_OPS),y)
>  ERLANG_DEPENDENCIES += libatomic_ops
> -ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
> +ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
> +endif

Maybe the removal of LIBS=-latomic_ops should be part of Erlang bump patch ?

Best regards,
Romain

>  
>  # erlang uses openssl for all things crypto. Since the host tools (such as
>  # rebar) uses crypto, we need to build host-erlang with support for openssl.
> 
