From: =?UTF-8?Q?Mathias_De_Mar=C3=A9?= <mathias.demare@gmail.com>
Date: Fri, 19 Apr 2013 13:41:38 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
Message-ID: <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

wouldn't an alternative possibility be to change the CCACHE_COMPILERCHECK
to:
export CCACHE_COMPILERCHECK=%compiler% -v

You don't rely on the timestamp that way, but you still have a check. I
believe this resolves the clearing of ccache also (see also
http://lists.busybox.net/pipermail/buildroot/2012-March/051187.html ).

For my host gcc, this gives:
$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.6/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro
4.6.3-1ubuntu5' --with-bugurl=file:///usr/share/doc/gcc-4.6/README.Bugs
--enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr
--program-suffix=-4.6 --enable-shared --enable-linker-build-id
--with-system-zlib --libexecdir=/usr/lib --without-included-gettext
--enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.6
--libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--enable-gnu-unique-object --enable-plugin --enable-objc-gc
--disable-werror --with-arch-32=i686 --with-tune=generic
--enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu
--target=x86_64-linux-gnu
Thread model: posix
gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)

Greetings,
Mathias



On Fri, Apr 19, 2013 at 3:50 AM, Danomi Manchego <
danomimanchego123@gmail.com> wrote:

> All,
>
> Let me preface this by saying that I know that we are supposed to manually
> flush the ccache when changing toolchain configuration.  This post is not
> about that (I think) - it's about building different configurations, in
> different locations, on the same machine.  (Emphasis on "in different
> locations".)
>
> Recently, I found a case where ccache was being fooled during the building
> of kmod (a dependency of udev), in the following circumstance:
>
> 1. I compiled buildroot with O=cs2012, with a downloaded codesourcery
> 2012.03 toolchain.
>
>    Defconfig:
>       BR2_arm=y
>       BR2_CCACHE=y
>       BR2_TOOLCHAIN_EXTERNAL=y
>       BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>       BR2_PACKAGE_KMOD=y
>
> 2. I attempted to compile buildroot with O=cs2009, with a pre-installed
> codesourcery 2009q1 toolchain
>
>    Defconfig:
>       BR2_arm=y
>       BR2_CCACHE=y
>       BR2_TOOLCHAIN_EXTERNAL=y
>       BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/codesourcery/arm-2009q1-203-arm-none-linux-gnueabi"
>       BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-none-linux-gnueabi"
>       BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>       BR2_TOOLCHAIN_EXTERNAL_CXX=y
>       BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>       BR2_PACKAGE_KMOD=y
>
> 3. Then kmod build failed, due to "Unknown mandatory EABI object attribute
> 44".
>
> After examining ccache stats at each stage, I think what is happening is
> that when the compile line has only relative paths, and hashing on the
> compiler itself is disabled (as it is in buildroot's build of ccache), then
> the compile under the cs2009 directory cannot be distinguished from the
> compile in the cs2012 directory (i.e., the computed hash values are
> identical), so the cs2012 objects are used, leading to disaster.
>
> Another variation occurred when I compiled first using a 2010q1 cs
> toolchain (O=cs2010), which supports -Wno-unsused-result, followed by
> 2009q1, which does not.  When configure compiled its little programs to
> test the c-flags in cs2009, it pulled cs2010's object, and erroneously
> concluded that -Wno-unsused-result was supported.  The compile of the
> actual kmod source with -Wno-unsused-result then failed.
>
> As it turns out, ccache will include the current directory in the hash
> when the environment variable CCACHE_HASHDIR is defined.  I have confirmed
> that defining CCACHE_HASHDIR makes the above scenario compile correctly -
> different files get cached for the cs2012 and cs2009 builds, since the
> source files live in different locations.  So I think that I will probably
> force the behavior activated by CCACHE_HASHDIR for our project - similar to
> how the CCACHE_COMPILERCHECK selection is forced to "none".
>
> If others think that this is a good idea, then I would be happy to submit
> a patch to this effect.
>
> Danomi -
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130419/92a3a7a5/attachment.html>
