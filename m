From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 12:00:51 +0100
Subject: [Buildroot] [PATCH/next 06/54] package/kodi: bump version to
 19.0-Matrix
In-Reply-To: <20210220085913.888324-7-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
 <20210220085913.888324-7-bernd.kuhls@t-online.de>
Message-ID: <20210220110051.GJ2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

Here's a very quick, very superficial, and very incomplete review...

On 2021-02-20 09:58 +0100, Bernd Kuhls spake thusly:
> Rebased patch 0001.
> 
> Removed patch 0002, not needed anymore due to use of system ffmpeg
> package.
> 
> Added patch 0002 which fixes an issue with wayland detection.
> 
> Added patch 0003 to fix build with gcc-4.9, gcc-4.8 stays broken.
> 
> Switch from python2 to python3, reworked dependencies.

Yeah, at long last! Woot! :-)

> diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> index 5abb77e777..cbfb97e4f3 100644
> --- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> +++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> @@ -8,18 +8,21 @@ When cross-compiling, the location at build time of the libraries is
>  not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
>  is here to handle this difference, so use it in kodi-config.cmake.
>  
> +Upstream status: Rejected (PR 17616)

It's not that they rejeted it: they even applied it nitially. However,
it breaks the build, so they reverted it. So, stating "rejected
upstream" is misleading.

So, it would be nice that we eventualyl get a patch that is
upstreamable...

[--SNIP--]
> diff --git a/package/kodi/0002-Revert-cmake-FindWaylandpp-bail-out-if-we-cannot-fin.patch b/package/kodi/0002-Revert-cmake-FindWaylandpp-bail-out-if-we-cannot-fin.patch
> new file mode 100644
> index 0000000000..0482d60d12
> --- /dev/null
> +++ b/package/kodi/0002-Revert-cmake-FindWaylandpp-bail-out-if-we-cannot-fin.patch
> @@ -0,0 +1,41 @@
> +From 99bc697c3849f3a093fcf6673f48d0ea3eeb3bf0 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 1 Nov 2020 18:05:00 +0100
> +Subject: [PATCH] Revert "[cmake] FindWaylandpp: bail out if we cannot find
> + waylandpp via pkg-config"
> +
> +This reverts commit 767ff84dd222ff19996889942abf239d93fd940b.

Why? Please be mopre explicit: we'll have to maintain that patch, so we
must now what breaks and why.

[--SNIP--]
> +ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
> +KODI_DEPENDENCIES += libudfread
> +endif

There's no configure option to drive this feature?

At least, I think we should unconditionally disable using the internal
copy, as it will be downloaded at build time: -DENABLE_INTERNAL_UDFREAD=OFF

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
