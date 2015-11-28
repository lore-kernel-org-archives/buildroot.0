From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Nov 2015 01:33:47 +0100
Subject: [Buildroot] [PATCH 1/1] core: add option to force compiling C++
 as C++11
In-Reply-To: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
References: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
Message-ID: <5658F66B.5040003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-11-15 15:50, Alexey Galakhov wrote:
> Many C++ libraries like boost and log4cplus use defines to be compatible with
> both C++03 and C++11 standards. This causes ABI incompatibilities between
> a library built with C++03 and an application built with C++11. To avoid this,
> one has to built libraries as C++11 as well.
> 
> This patch introduces the BR2_ENABLE_CPP11 configuration option that forces
> passing --std=c++11 to the compiler while building C++ target libraries.
> 
> Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
> ---
>  Config.in           | 16 ++++++++++++++++
>  package/Makefile.in | 12 +++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index d795361..79e4d31 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -533,6 +533,22 @@ config BR2_ENABLE_SSP
>  comment "enabling Stack Smashing Protection requires support in the toolchain"
>  	depends on !BR2_TOOLCHAIN_HAS_SSP
>  
> +config BR2_ENABLE_CPP11
> +	bool "force C++11 when building libraries"
> +	default n
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3

 As I understand it, the move constructor was only introduced in gcc 4.6 so we
should take that as the base, no? And actually, in practice, any package that
relies on C++11 will probably need gcc 4.7 anyway since that's the first one to
support a reasonable subset of the standard. So I'd propose to take that as the
minimum version. This also simplifies the selection of the --std= option.

> +	help
> +	  Force building of C++ libraries in C++11 mode.
> +
> +	  Some C++ libraries (i.e. boost) behave differently if compiled with
> +	  and without --std=c++11 flag. They define classes differently. This
> +	  causes linker errors while trying to use such a library in a C++11
> +	  project.
> +
> +	  This option forces building of all such libraries in C++11 mode.
> +	  Enable it if you encounter C++11-related linker errors.
> +
>  choice
>  	bool "libraries"
>  	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 85008bb..0bb911e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -135,9 +135,19 @@ ifeq ($(BR2_DEBUG_3),y)
>  TARGET_DEBUGGING = -g3
>  endif
>  
> +ifeq ($(BR2_ENABLE_CPP11),y)
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
> +TARGET_CXXLANGUAGE = --std=c++11
> +else
> +TARGET_CXXLANGUAGE = --std=c++0x
> +endif
> +else
> +TARGET_CXXLANGUAGE =

 There's no need to define it empty, just remove the else branch.

> +endif
> +
>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> -TARGET_CXXFLAGS = $(TARGET_CFLAGS)
> +TARGET_CXXFLAGS = $(TARGET_CFLAGS) $(TARGET_CXXLANGUAGE)

 I was thinking if it wouldn't be better to add this to the toolchain wrapper,
but in fact it is a good idea to let the package's build system know explicitly
that we're going to enable C++11 support. So this is fine.


 Regards,
 Arnout

>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
>  ifeq ($(BR2_BINFMT_FLAT),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
