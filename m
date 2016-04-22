From: =?UTF-8?Q?Beno=c3=aet_Mauduit?= <bmauduit@beneth.fr>
Date: Fri, 22 Apr 2016 15:58:26 +0200
Subject: [Buildroot] [PATCH] yajl: fix build with uClibc
In-Reply-To: <1461219335.6388.20.camel@embedded.rocks>
References: <1461145087-63679-1-git-send-email-Vincent.Riera@imgtec.com>
 <1461219335.6388.20.camel@embedded.rocks>
Message-ID: <571A2E02.8010904@beneth.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente, J?rg,

On 04/21/2016 08:15 AM, J?rg Krause wrote:
> (...)
> 
> I'm not sure if it's worth, but I would prefer to fix the CMake build
> files of yajl by checking if libm is needed for isnan and it to the
> list of LIBS and let all executables link against LIBS. Thomas
> Petazzoni did this for an autotools package [3]. For CMake it would be
> something like this:
> 
>     # check if isnan needs libm
>     try_compile(ISNAN_NEEDS_LIBM, ...)
>     if (ISNAN_NEEDS_LIBM)
>       set(LIBS ${LIBS} m)
>     endif ()
> 
>     [..]
> 
>     TARGET_LINK_LIBRARIES(${testProg} yajl ${LIBS})
> 

I just encountered this build issue.
I end up with a patch like that, in yasl Top-level CMakeList.txt :

  # uclibc does not provide isnan() & isinf().
  # Symbol are in libm instead.
  INCLUDE(CheckLibraryExists)
  CHECK_LIBRARY_EXISTS(c isnan "" HAVE_LIBC_ISNAN)

  IF (NOT HAVE_LIBC_ISNAN)
    SET(CMAKE_SHARED_LINKER_FLAGS "-lm ${CMAKE_SHARED_LINKER_FLAGS}")
  ENDIF (NOT HAVE_LIBC_ISNAN)


It works with uClibc based toolchain.

But I am not sure about this patch for compatibility with other C
library. I have just test on my host (glibc) with a dummy CMakeList.txt,
and :

CHECK_LIBRARY_EXISTS(c isnan "" HAVE_LIBC_ISNAN)
>>
-- Looking for isnan in c
-- Looking for isnan in c - found

Anyway, looking at the man page for isnan & isinf, we are supposed to
link against libmath... (Link with -lm)

Regards,

-- 
Beno?t Mauduit
Mail : <bmauduit@beneth.fr>
XMPP : <bmauduit@im.beneth.fr>
