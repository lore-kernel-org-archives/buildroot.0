From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 15:02:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] Fix -latomic for CMake packages
In-Reply-To: <20210413062615.2808309-1-glex.spb@gmail.com>
References: <20210413060942.2530596-1-glex.spb@gmail.com>
 <20210413062615.2808309-1-glex.spb@gmail.com>
Message-ID: <de634e81-64a4-285d-7e25-247ca3903e15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2021 08:26, Gleb Mazovetskiy wrote:
> The poppler package failed to build for me with errors such as this one:
> 
>     host/aarch64-buildroot-linux-gnu/include/c++/10.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
>        75 | #include_next <stdlib.h>
>           |               ^~~~~~~~~~
> 
> Changing the CMake option to a link-specific one fixes the issue.

 Applied to master, thanks.

 Your SoB was missing here, but it was on v1 so I re-added it.

 Normally we expect to have one patch per package. This makes it easier to:
- port to the stable branch (only the packages that apply to the stable branch);
- partially revert.

 In this case, I couldn't be bothered to change it though. Just for the future,
know that that's the preferred way. It also helps increase your ranking in the
contribution statistics :-)

 There are a few other packages that do something similar: bctoolbox with
-liconv, kf5-kcoreaddons with -latomic, libcpprestsdk with -latomic, mariadb
with -latomic, ogre with -latomic, opencv3 with -latomic. Could you change (and
test) those ones as well?

[snip]
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 6edb0b7fca..28fe4a6a92 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -184,7 +184,7 @@ endif
>  
>  # mips: uses __atomic_load_8
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -KODI_CXX_FLAGS += -latomic

 KODI_CXX_FLAGS is no longer set after this change, so I removed its use as well.


 Regards,
 Arnout

> +KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 44ad04bf7c..a5a97d974b 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -21,7 +21,7 @@ POPPLER_CONF_OPTS = \
>  	-DENABLE_GTK_DOC=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> +POPPLER_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
>  ifeq ($(BR2_PACKAGE_BOOST),y)
> diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
> index 5e7ee03651..11bb1f90b5 100644
> --- a/package/wampcc/wampcc.mk
> +++ b/package/wampcc/wampcc.mk
> @@ -13,7 +13,7 @@ WAMPCC_LICENSE_FILES = LICENSE
>  
>  # Uses __atomic_fetch_add_8
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> +WAMPCC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
>  $(eval $(cmake-package))
> 
