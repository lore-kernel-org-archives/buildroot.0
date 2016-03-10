From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Mar 2016 12:37:25 +0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_CFLAGS flags to
 configure with --enable-cxx-flags
In-Reply-To: <56DF5EBF.20409@mind.be>
References: <1433169427-7527-1-git-send-email-jcmvbkbc@gmail.com>
 <20160109220852.GE3444@free.fr> <56DF5EBF.20409@mind.be>
Message-ID: <CAMo8BfKG3bf9EA+Xi3C2R=8JLZV7EO0o9R_r4depM3dMYPrs+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Yann,

On Wed, Mar 9, 2016 at 2:22 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 01/09/16 23:08, Yann E. MORIN wrote:
>> On 2015-06-01 17:37 +0300, Max Filippov spake thusly:
>>>
>>> Currently only TARGET_ABI flags are passed to the final compiler
>>> configure script and only when building for Xtensa. Since libstdc++ is a
>>> normal library it should be built with full TARGET_CFLAGS on all
>>> targets.
>>>
>>> Pass TARGET_CFLAGS flags to gcc-final configure script for all targets
>>> in the --enable-cxx-flags parameter.
>>>
>>> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>
>>
>> So, I finally had a look at this patch. I've tested it to build a
>> gcc-4.9 + glibc-2.21 + binutils-2.24 toolchain with C++ support, which
>> then was used to suessfully build Qt5base (which is quite a heavy C++
>> user).
>>
>> However, I'd like to understand what this is all about.
>>
>> In gcc.mk, we do:
>>
>>      GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>>      [...]
>>      HOST_GCC_COMMON_CONF_ENV +=
>> CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>>
>> So it looks like we were already passing the proper CXXFLAGS to gcc (we
>> only filter-out problematic flags, like -Os on broken gcc-4.5 for PPC).
>>
>> So, what are we supposed to gain/loose with this change?
>>
>> As a side note, we should not have to pass TARGET_ABI either, since it
>> is part of TARGET_CFLAGS and as shown above, it is already part of the
>> CFLAGS_FOR_TARGET that we pass gcc.
>>
>> Any explanations? Something that I missed?
>
>
>  I checked in the gcc source and also couldn't find a reason why the
> CXXFLAGS_FOR_TARGET wouldn't work. Since you haven't replied to this, I've
> marked your patch as rejected in patchwork. If you do still fel it is
> warranted, please repost with a satisfactory explanation.

Sorry, took me too long to answer the first mail.

AFAICS neither gcc-4.8.x nor gcc-4.9.x propagate CXXFLAGS_FOR_TARGET
to CXXFLAGS for builds of libstdc++. gcc-5.x however does.
Compare the following build log excerpts for libstdc++ of gcc-4.8, gcc-4.9 and
gcc-5 (I've reverted 2dcab526a97d and c44cf2cc97df before running these builds):

gcc-4.8:
make[3]: Entering directory
'/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/xtensa-buildroot-linux-uclibc/libstdc++-v3'
/usr/bin/make "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc"
"CC_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/./gcc/xgcc
-B/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/./gcc/"
"CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"CXXFLAGS=-O2 -I/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include
-D_GNU_SOURCE" "CFLAGS_FOR_BUILD=-O2
-I/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"CFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"INSTALL=/usr/bin/install -c" "INSTALL_DATA=/usr/bin/install -c -m
644" "INSTALL_PROGRAM=/usr/bin/install -c"
"INSTALL_SCRIPT=/usr/bin/install -c" "LDFLAGS="
"LIBCFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"LIBCFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"MAKE=/usr/bin/make"
"MAKEINFO=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/missing
makeinfo --split-size=5000000 --split-size=5000000 " "SHELL=/bin/bash"
"RUNTESTFLAGS="
"exec_prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"infodir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/share/info"
"libdir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/lib"
"includedir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"tooldir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc"
"gxx_include_dir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/include/c++/4.8.5"
"AR=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ar"
"AS=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/./gcc/as"
"LD=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/./gcc/collect-ld"
"RANLIB=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ranlib"
"NM=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.8.5/build/./gcc/nm"
"NM_FOR_BUILD="
"NM_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/nm"
"DESTDIR=" "WERROR=" all-recursive

gcc-4.9:
make[3]: Entering directory
'/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/xtensa-buildroot-linux-uclibc/libstdc++-v3'
/usr/bin/make "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc"
"CC_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/./gcc/xgcc
-B/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/./gcc/"
"CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"CXXFLAGS=-O2 -I/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include
-D_GNU_SOURCE" "CFLAGS_FOR_BUILD=-O2
-I/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"CFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"INSTALL=/usr/bin/install -c" "INSTALL_DATA=/usr/bin/install -c -m
644" "INSTALL_PROGRAM=/usr/bin/install -c"
"INSTALL_SCRIPT=/usr/bin/install -c" "LDFLAGS="
"LIBCFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"LIBCFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"MAKE=/usr/bin/make"
"MAKEINFO=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/missing
makeinfo --split-size=5000000 --split-size=5000000 " "SHELL=/bin/bash"
"RUNTESTFLAGS="
"exec_prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"infodir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/share/info"
"libdir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/lib"
"includedir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"tooldir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc"
"gxx_include_dir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/include/c++/4.9.3"
"AR=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ar"
"AS=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/./gcc/as"
"LD=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/./gcc/collect-ld"
"RANLIB=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ranlib"
"NM=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-4.9.3/build/./gcc/nm"
"NM_FOR_BUILD="
"NM_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/nm"
"DESTDIR=" "WERROR=" all-recursive

gcc-5:
make[3]: Entering directory
'/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/xtensa-buildroot-linux-uclibc/libstdc++-v3'
/usr/bin/make "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc"
"CC_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/./gcc/xgcc
-B/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/./gcc/"
"CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"CXXFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2
-D_GNU_SOURCE" "CFLAGS_FOR_BUILD=-O2
-I/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"CFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"INSTALL=/usr/bin/install -c" "INSTALL_DATA=/usr/bin/install -c -m
644" "INSTALL_PROGRAM=/usr/bin/install -c"
"INSTALL_SCRIPT=/usr/bin/install -c" "LDFLAGS="
"LIBCFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"LIBCFLAGS_FOR_TARGET=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g2"
"MAKE=/usr/bin/make"
"MAKEINFO=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/missing
makeinfo --split-size=5000000 --split-size=5000000 " "SHELL=/bin/bash"
"RUNTESTFLAGS="
"exec_prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"infodir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/share/info"
"libdir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/lib"
"includedir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/include"
"prefix=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr"
"tooldir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc"
"gxx_include_dir=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/include/c++/5.3.0"
"AR=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ar"
"AS=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/./gcc/as"
"LD=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/./gcc/collect-ld"
"RANLIB=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/ranlib"
"NM=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/build/host-gcc-final-5.3.0/build/./gcc/nm"
"NM_FOR_BUILD="
"NM_FOR_TARGET=/home/jcmvbkbc/tmp/br/build-gdb-binutils-update-dc233c/host/usr/xtensa-buildroot-linux-uclibc/bin/nm"
"DESTDIR=" "WERROR=" all-recursive

With --enable-cxx-flags="$(TARGET_CFLAGS)" in the
HOST_GCC_FINAL_CONF_OPTS make invocation lines are the same,
but makefiles in libstdc++ differ by the EXTRA_CXX_FLAGS.

OTOH since flags propagation is fixed in gcc-5.x maybe backporting
that fix is the right thing?

-- 
Thanks.
-- Max
