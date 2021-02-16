From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 22:21:00 +0100
Subject: [Buildroot] [PATCHv2 5/7] package/flare-engine: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210212135451.22786-6-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-6-patrickdepinguin@gmail.com>
Message-ID: <09c1e01d-53fa-15a7-0342-c88e448bf415@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 14:54, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> flare-engine set CMAKE_BUILD_TYPE=RelWithDebInfo to avoid '-pg' for
> profiling.
> 
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> longer be necessary. Users that do not wish to have profiling information,
> just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value), and those that
> enable BR2_ENABLE_RUNTIME_DEBUG will get profiling.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/flare-engine/flare-engine.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
> index e2f3eefa28..7022eac7ae 100644
> --- a/package/flare-engine/flare-engine.mk
> +++ b/package/flare-engine/flare-engine.mk
> @@ -14,11 +14,6 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
>  # Don't use /usr/games and /usr/share/games
>  FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
>  
> -# Don't use the default Debug type as it adds -pg (gprof)
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> -FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo

 NACK to this one. This is required to fix a build issue:

commit aa9d77c8518c5245b4e220d5f15e7c3733aa78be
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Sun Nov 18 22:34:39 2018

    flare-engine: fix debug build

    If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
    as Debug will add -pg (gprof) which is not always available on toolchain

    Fixes:
      -
http://autobuild.buildroot.org/results/a12ae622a44bbe025c3a8b7e8e4c253b52927ae8


 Unless you have a way to know that the toolchain has the profiling library,
this has to be kept.

 And anyway, profiling has little to do with runtime debugging IMHO.

 Regards,
 Arnout

> -endif
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  # CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
>  # BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
> 
