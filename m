From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jul 2016 15:59:26 +0200
Subject: [Buildroot] [PATCH] cmake: bump version to 3.6.0
In-Reply-To: <1468490810-62781-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468490810-62781-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160714135926.GA3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-07-14 11:06 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
[--SNIP--]
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 7a80c1b..25eafe8 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CMAKE_VERSION_MAJOR = 3.5
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
> +CMAKE_VERSION_MAJOR = 3.6
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0

This is causing a lot of build failures:
    http://autobuild.buildroot.org/?reason=host-cmake-3.6.0

There are various tyes of failures:

  - incorrect openssl used:

    http://autobuild.buildroot.org/results/193/193e88df98230554e304a8c550e5ded97e3a4177

    -- Found OpenSSL: /home/buildroot/build/instance-1/output/host/usr/xtensa-buildroot-lin
    ux-uclibc/sysroot/usr/lib/libssl.so;/home/buildroot/build/instance-1/output/host/usr/xt
    ensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so (found version "1.0.2h")

    Clearly, this is finding the target openssl when we are building the
    host-cmake. That's wrong.

  - a weird error while configuring its bundled libcurl:

    http://autobuild.buildroot.org/results/f8c/f8c335440e3132ee7e01fadd03c4d18e0de767ba

    -- Check size of curl_off_t
    -- Check size of curl_off_t - failed
    -- Check size of socklen_t
    -- Check size of socklen_t - failed
    CMake Error at Utilities/cmcurl/CMakeLists.txt:1042 (message):
      Check for sizeof socklen_t failed, see CMakeFiles/CMakerror.log

    If cmake insists on having curl+ssl support (what for, for g*d's
    sake?) we should add a host-libcurl and make host-cmake depend on it
    and on host-openssl.

  - another weird build issue:

    http://autobuild.buildroot.org/results/89f/89fd8085da9cacf612a6aea585eb1ad6941f146b

    /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:
    Assembler messages:
    /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:761: Error: incorrect register `%rdx' used with `l' suffix
    /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:765: Error: incorrect register `%rcx' used with `l' suffix
    Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/build.make:950: recipe for target 'Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/multi.c.o' failed

    This one looks like again like it is confusing host and target, and
    using the wrong compiler and/or assembler.

  - yet again another weird build issue:

    http://autobuild.buildroot.org/results/85f/85f5e9329047c9d40f7fd35c645835d83a5fcef3/

    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:
    Assembler messages: /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1167: Error: junk at end of line, first unrecognized character is `%'
    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1167: Error: junk at end of line, first unrecognized character is `%'
    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
    /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
    make[4]: *** [Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/ftp.c.o] Error 1
    make[4]: *** Waiting for unfinished jobs....

Regards,
Yann E. MORIN.

>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3c
>  CMAKE_LICENSE_FILES = Copyright.txt
> -- 
> 2.7.3
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
