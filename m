From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Aug 2019 18:24:32 +0200
Subject: [Buildroot] [PATCH 1/1] support/cmake: Explicitly set
 CMAKE_SYSTEM
In-Reply-To: <20190317164817.13998-1-frank.vanbever@mind.be>
References: <20190317164817.13998-1-frank.vanbever@mind.be>
Message-ID: <20190803162432.GB26072@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Franck, All,

Thanks for your contribution. I was finally able to wrap my head around
this cmake stuff... ;-)

On 2019-03-17 17:48 +0100, Frank Vanbever spake thusly:
> Some packages test for CMAKE_SYSTEM explicitly.[1]
> 
> CMAKE_SYSTEM is comprised of CMAKE_SYSTEM_NAME and CMAKE_SYSTEM_VERSION.
> It defaults to CMAKE_SYSTEM_NAME if CMAKE_SYSTEM_VERSION is not set.[2]
> 
> At the point CMAKE_SYSTEM_NAME is set to "Linux" CMAKE_SYSTEM is already
> constructed. Setting it explicitly ensures that it is the correct value.

This is because we do set CMAKE_SYSTEM_NAME twice, in fact:

  - first in toolchainfile.cmake, so that we tell cmake to use the
    "Buildroot" platform,

  - second, in the Buildroot.cmake platform definition itself, so that
    we eventually behave like the Linux platform.

I haven't been able to really track down exacty _when_ CMAKE_SYSTEM is
indeed set, but I believe it is done after the toolchainfile.cmake file
is parsed, but before the Buildroot.cmake platofrm one is. And indeed,
that becomes too late.

So, I believe this change is correct, but...

We also set CMAKE_SYSTEM_VERSION to 1, and so the real CMAKE_SYSTEM
value should be set to Linux-1 if we were to follow the documentation to
the letter.

However, for Linux, the version does not matter, and in some situations
may even be harmful (that was reported in one of the commits that
introduce Buildroot.cmake andtoolchanfile.cmake).

So:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> [1] Fluidsynth https://github.com/FluidSynth/fluidsynth/blob/0cd44d00e1ec9a905d51163efde7b70ff8ae0ba3/CMakeLists.txt#L80
> [2] https://cmake.org/cmake/help/git-master/variable/CMAKE_SYSTEM.html#variable:CMAKE_SYSTEM
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
> ---
>  support/misc/Buildroot.cmake | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
> index 9f5f565255..761b6d7ae2 100644
> --- a/support/misc/Buildroot.cmake
> +++ b/support/misc/Buildroot.cmake
> @@ -1,5 +1,6 @@
>  # Impersonate a Linux system. Afterall, that's what we are...
>  set(CMAKE_SYSTEM_NAME Linux)
> +set(CMAKE_SYSTEM ${CMAKE_SYSTEM_NAME})
>  include(Platform/Linux)
>  
>  # Override problematic settings, to avoid RPATH against host lib directories.
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
