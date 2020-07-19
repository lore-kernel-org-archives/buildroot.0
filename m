From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 18:17:21 +0200
Subject: [Buildroot] [PATCH] package/exiv2: fix compiler flags detection
In-Reply-To: <20200719143404.2542434-1-thomas.petazzoni@bootlin.com>
References: <20200719143404.2542434-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200719161721.GW18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-19 16:34 +0200, Thomas Petazzoni spake thusly:
> Add a patch, which has been submitted upstream, to properly detect the
> availability of compiler flags before using them.
> 
> This will fix the build of exiv2 on CPU architectures for which gcc
> doesn't implement -fcf-protection.
> +--- a/cmake/compilerFlags.cmake
> ++++ b/cmake/compilerFlags.cmake
> +@@ -1,4 +1,5 @@
> + # These flags applies to exiv2lib, the applications, and to the xmp code
> ++include(CheckCCompilerFlag)
> + 
> + if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
> +     if (${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
> +@@ -25,13 +26,16 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
> + 
> +         # This fails under Fedora, MinGW GCC 8.3.0 and CYGWIN/MSYS 9.3.0
> +         if (NOT (MINGW OR CMAKE_HOST_SOLARIS OR CYGWIN OR MSYS) )
> +-            if (COMPILER_IS_GCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
> +-                add_compile_options(-fstack-clash-protection -fcf-protection)
> +-            endif()
> +-
> +-            if( (COMPILER_IS_GCC   AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0) # Not in GCC 4.8
> +-            OR  (COMPILER_IS_CLANG AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 3.7) # Not in Clang 3.4.2
> +-            )
> ++	    check_c_compiler_flag(-fstack-clash-protection HAS_FSTACK_CLASH_PROTECTION)
> ++	    check_c_compiler_flag(-fcf-protection HAS_FCF_PROTECTION)
> ++	    check_c_compiler_flag(-fstack-protector-strong HAS_FSTACK_PROTECTOR_STRONG)
> ++	    if(HAS_FSTACK_CLASH_PROTECTION)
> ++                add_compile_options(-fstack-clash-protection)
> ++	    endif()
> ++	    if(GCC_HAS_FCF_PROTECTION)
> ++		add_compile_options(-fcf-protection)
> ++	    endif()
> ++	    if(GCC_HAS_FSTACK_PROTECTOR_STRONG)

You've used TABs in this file that otherwise uses spaces. Hence,
indentation is off; I've "fixed" that.

Additionally, the file uses CRLF, so I had to also fix that (not your
fault, patchowrk is picky about CRLF).

Applied to master with the two fixes, thanks.

Note also that he patch you sent upstream has the same TAB issue,
causing incorrect rendering of the diff:
    https://github.com/Exiv2/exiv2/pull/1252/commits/4a76388f7f03e8ec73730292aa6866eda83df4e7

Regards,
Yann E. MORIN.

> +                 add_compile_options(-fstack-protector-strong)
> +             endif()
> +         endif()
> +-- 
> +2.26.2
> +
> -- 
> 2.26.2
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
