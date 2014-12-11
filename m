From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Dec 2014 00:05:15 +0100
Subject: [Buildroot] [PATCHv2 1/3] Turn the static lib option into a
 choice with more options
In-Reply-To: <1418338211-1595-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418338211-1595-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211230515.GO4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-11 23:50 +0100, Thomas Petazzoni spake thusly:
> This commit turns the single static option into a choice, which offers
> various possibilities:
> 
>  1. Build and use static libraries only;
>  2. Build both shared and static libraries, but use shared libraries;
>  3. Build and use shared libraries only.
> 
> On most platforms, (2) is currently the default, and kept as the
> default in this commit. Of course, on certain platforms (Blackfin,
> m68k), only option (1) will be available.
> 
> In addition to the introduction of the Config.in options, this commit
> also:
> 
>  * Removes the 'select BR2_STATIC_LIBS' from 'BR2_BINFMT_FLAT', since
>    with the use of a choice, we are guaranteed that BR2_STATIC_LIBS
>    will be selected when the binary format is BR2_BINFMT_FLAT, since
>    BR2_STATIC_LIBS will be the only possible solution in the choice.
> 
>  * Changes package/Makefile.in to use the proper
>    --{enable,disable}-{shared,static} options for autotools packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in           | 45 ++++++++++++++++++++++++++++++++++++---------
>  arch/Config.in      |  1 -
>  package/Makefile.in |  4 +++-
>  3 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index cdc5f0f..a647283 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -525,19 +525,46 @@ config BR2_ENABLE_SSP
>  comment "enabling Stack Smashing Protection requires support in the toolchain"
>  	depends on !BR2_TOOLCHAIN_HAS_SSP
>  
> +choice
> +

As discussed on IRC: supperfluous empty line

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> +	bool "libraries"
> +	default BR2_SHARED_STATIC_LIBS if BR2_BINFMT_SUPPORTS_SHARED
> +	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
> +	help
> +	  Select the type of libraries you want to use on the target.
> +
> +	  The default is to build dynamic libraries and use those on
> +	  the target filesystem, except when the architecture and/or
> +	  the selected binary format does not support shared
> +	  libraries.
> +
>  config BR2_STATIC_LIBS
> -	bool "build statically linked applications, no dynamic libraries"
> +	bool "static only"
>  	help
> -	  Build all applications for the target statically linked.
> -	  This potentially increases your filesystem size and should only be
> -	  used if you know what you do.
> +	  Build and use only static libraries. No shared libraries
> +	  will be instaled on the target. This potentially increases
> +	  your code size and should only be used if you know what you
> +	  are doing. Note that some packages may not be available when
> +	  this option is enabled, due to their need for dynamic
> +	  library support.
>  
> -	  Note that some applications cannot be build statically and so are
> -	  intentionally disabled.
> +config BR2_SHARED_LIBS
> +	bool "shared only"
> +	depends on BR2_BINFMT_SUPPORTS_SHARED
> +	help
> +	  Build and use only shared libraries. This is the recommended
> +	  solution as it saves space and build time.
> +
> +config BR2_SHARED_STATIC_LIBS
> +	bool "both static and shared"
> +	depends on BR2_BINFMT_SUPPORTS_SHARED
> +	help
> +	  Build both shared and static libraries, but link executables
> +	  dynamically. While building both shared and static libraries
> +	  take more time and more disk space, having static libraries
> +	  may be useful to link some of the applications statically.
>  
> -	  The default (if this option is disabled) is to build dynamic
> -	  libraries and dynamically link applications to use those on the
> -	  target filesystem.
> +endchoice
>  
>  
>  config BR2_PACKAGE_OVERRIDE_FILE
> diff --git a/arch/Config.in b/arch/Config.in
> index d06ab5e..890e7e2 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -284,7 +284,6 @@ config BR2_BINFMT_FDPIC
>  config BR2_BINFMT_FLAT
>  	bool "FLAT"
>  	depends on BR2_bfin || BR2_m68k
> -	select BR2_STATIC_LIBS
>  	help
>  	  FLAT binary is a relatively simple and lightweight executable format
>  	  based on the original a.out format. It is widely used in environment
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 50f86ad..a63a2e8 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -394,7 +394,9 @@ SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
>  TARGET_CFLAGS += -static
>  TARGET_CXXFLAGS += -static
>  TARGET_LDFLAGS += -static
> -else
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +SHARED_STATIC_LIBS_OPTS = --disable-static --enable-shared
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
>  endif
>  
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
