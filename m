From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Aug 2018 06:42:33 +0300
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <20180822222719.GB9365@scaer>
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
 <20180822220952.GA9365@scaer> <20180822222719.GB9365@scaer>
Message-ID: <87h8jlvjdi.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN writes:
> On 2018-08-23 00:09 +0200, Yann E. MORIN spake thusly:
>> On 2018-08-23 00:58 +0300, Baruch Siach spake thusly:
>> > Old version of cmake break cross-compilation when FindThreads is used
>> > because of a try_run call. Add a workaround that avoids try_run.
>> >
>> > cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920
>> >
>> > Should fix:
>> > http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
>> > http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/
>> >
>> > Cc: Scott Fan <fancp2007@gmail.com>
>> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> > ---
>> > Hi Peter, Yann,
>> >
>> > Can one of you test this fix on one of the affected autobuilders?
>> >
>> >   http://autobuild.buildroot.net/?reason=libssh-0.8.1
>>
>> My autobuilder does not have cmake installed, so will use or own
>> host-cmake, as can be seen in the failure on my autobuilder:
>>     http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/build-end.log
>>
>>     [...] /home/buildroot/autobuild/run/instance-3/output/host/bin/cmake [...]
>>
>> So I guess you can test on a machine that does not have cmake
>> installed.

Right. I assumed that Buildroot has the latest, newer than 3.10,
cmake. But this is evidently not true. Commit log of 5b57ae7ad197
(Revert "package/cmake: bump version to 3.10.0 and add license hash")
seems to indicate that we'll have to wait a while for the next cmake
version bump.

>> But I'll spin a test on my autobuilder in a moment, and report
>> back...

Thanks.

> Here are the results of the configure step, using the config from my
> autobuilder referenced above, and running 'make libssh-depends' first:

You meant to say 'make libssh-configure' here, right?

So I reproduced the build failure and the fix with host-cmake here as
well.

Thanks,
baruch

> ---8<---
>
> $ make libssh-configure
> umask 0022 && make -C /home/buildroot/dev/buildroot O=/home/buildroot/dev/O/. libssh-configure
> libssh-0.7.5.tar.xz: OK (md5: d3fc864208bf607ad87cdee836894feb)
> libssh-0.7.5.tar.xz: OK (sha256: 54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095)
>>>> libssh 0.7.5 Extracting
> xzcat /home/buildroot/src/libssh/libssh-0.7.5.tar.xz | tar --strip-components=1 -C /home/buildroot/dev/O/build/libssh-0.7.5   -xf -
>>>> libssh 0.7.5 Patching
>>>> libssh 0.7.5 Configuring
> (mkdir -p /home/buildroot/dev/O/build/libssh-0.7.5//buildroot-build && cd /home/buildroot/dev/O/build/libssh-0.7.5//buildroot-build && rm -f CMakeCache.txt && PATH="/home/buildroot/dev/O/host/bin:/home/buildroot/dev/O/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /home/buildroot/dev/O/host/bin/cmake /home/buildroot/dev/O/build/libssh-0.7.5/ -DCMAKE_TOOLCHAIN_FILE="/home/buildroot/dev/O/host/share/buildroot/toolchainfile.cmake" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON  -DWITH_STACK_PROTECTOR=OFF -DWITH_SERVER=OFF -DWITH_EXAMPLES=OFF -DTHREADS_PTHREAD_ARG=OFF -DWITH_ZLIB=ON -DWITH_GCRYPT=OFF )
> -- The C compiler identification is GNU 6.4.0
> -- Check for working C compiler: /home/buildroot/dev/O/host/bin/mipsel-linux-gcc
> -- Check for working C compiler: /home/buildroot/dev/O/host/bin/mipsel-linux-gcc -- works
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Performing Test WITH_FPIC
> -- Performing Test WITH_FPIC - Success
> -- Found ZLIB: /home/buildroot/dev/O/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/libz.so (found version "1.2.11")
> -- Found OpenSSL: /home/buildroot/dev/O/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so (found version "1.0.2p")
> -- Looking for pthread.h
> -- Looking for pthread.h - found
> -- Looking for pthread_create
> -- Looking for pthread_create - not found
> -- Looking for pthread_create in pthreads
> -- Looking for pthread_create in pthreads - not found
> -- Looking for pthread_create in pthread
> -- Looking for pthread_create in pthread - found
> -- Found Threads: TRUE
> -- Found PkgConfig: /home/buildroot/dev/O/host/bin/pkg-config (found version "0.28")
> -- Checking for module 'heimdal-gssapi'
> --   Package heimdal-gssapi was not found in the pkg-config search path.
> Perhaps you should add the directory containing `heimdal-gssapi.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'heimdal-gssapi', required by 'world', not found
> -- Could NOT find GSSAPI (missing:  GSSAPI_LIBRARIES GSSAPI_INCLUDE_DIR)
> -- Could NOT find NaCl (missing:  NACL_LIBRARIES NACL_INCLUDE_DIRS)
> -- Performing Test WITH_VISIBILITY_HIDDEN
> -- Performing Test WITH_VISIBILITY_HIDDEN - Success
> -- Looking for argp.h
> -- Looking for argp.h - found
> -- Looking for pty.h
> -- Looking for pty.h - found
> -- Looking for utmp.h
> -- Looking for utmp.h - found
> -- Looking for termios.h
> -- Looking for termios.h - found
> -- Looking for unistd.h
> -- Looking for unistd.h - found
> -- Looking for util.h
> -- Looking for util.h - not found
> -- Looking for libutil.h
> -- Looking for libutil.h - not found
> -- Looking for sys/time.h
> -- Looking for sys/time.h - found
> -- Looking for sys/param.h
> -- Looking for sys/param.h - found
> -- Looking for arpa/inet.h
> -- Looking for arpa/inet.h - found
> -- Looking for byteswap.h
> -- Looking for byteswap.h - found
> -- Looking for openssl/des.h
> -- Looking for openssl/des.h - found
> -- Looking for openssl/aes.h
> -- Looking for openssl/aes.h - found
> -- Looking for openssl/blowfish.h
> -- Looking for openssl/blowfish.h - found
> -- Looking for openssl/ecdh.h
> -- Looking for openssl/ecdh.h - found
> -- Looking for openssl/ec.h
> -- Looking for openssl/ec.h - found
> -- Looking for openssl/ecdsa.h
> -- Looking for openssl/ecdsa.h - found
> -- Looking for isblank
> -- Looking for isblank - found
> -- Looking for strncpy
> -- Looking for strncpy - found
> -- Looking for strtoull
> -- Looking for strtoull - found
> -- Looking for vsnprintf
> -- Looking for vsnprintf - found
> -- Looking for snprintf
> -- Looking for snprintf - found
> -- Looking for poll
> -- Looking for poll - found
> -- Looking for select
> -- Looking for select - found
> -- Looking for getaddrinfo
> -- Looking for getaddrinfo - found
> -- Looking for ntohll
> -- Looking for ntohll - not found
> -- Looking for htonll
> -- Looking for htonll - not found
> -- Looking for clock_gettime in rt
> -- Looking for clock_gettime in rt - found
> -- Looking for forkpty in util
> -- Looking for forkpty in util - found
> -- Looking for cfmakeraw
> -- Looking for cfmakeraw - found
> -- Looking for __strtoull
> -- Looking for __strtoull - not found
> -- Performing Test HAVE_GCC_THREAD_LOCAL_STORAGE
> -- Performing Test HAVE_GCC_THREAD_LOCAL_STORAGE - Success
> -- Performing Test HAVE_MSC_THREAD_LOCAL_STORAGE
> -- Performing Test HAVE_MSC_THREAD_LOCAL_STORAGE - Failed
> -- Performing Test HAVE_GCC_VOLATILE_MEMORY_PROTECTION
> -- Performing Test HAVE_GCC_VOLATILE_MEMORY_PROTECTION - Success
> -- Performing Test HAVE_GCC_NARG_MACRO
> -- Performing Test HAVE_GCC_NARG_MACRO - Success
> -- Performing Test HAVE_COMPILER__FUNC__
> -- Performing Test HAVE_COMPILER__FUNC__ - Success
> -- Performing Test HAVE_COMPILER__FUNCTION__
> -- Performing Test HAVE_COMPILER__FUNCTION__ - Failed
> -- Check if the system is big endian
> -- Searching 16 bit integer
> -- Looking for sys/types.h
> -- Looking for sys/types.h - found
> -- Looking for stdint.h
> -- Looking for stdint.h - found
> -- Looking for stddef.h
> -- Looking for stddef.h - found
> -- Check size of unsigned short
> -- Check size of unsigned short - done
> -- Using unsigned short
> -- Check if the system is big endian - little endian
> -- Could NOT find Doxygen (missing:  DOXYGEN_EXECUTABLE)
> -- Threads_FOUND=TRUE
> -- threads library: Threads_FOUND=TRUE
> -- libssh_threads_SRCS=pthread.c
> -- ********************************************
> -- ********** libssh build options : **********
> -- zlib support: ON
> -- libgcrypt support: OFF
> -- libnacl support: OFF
> -- SSH-1 support: OFF
> -- SFTP support: ON
> -- Server support : OFF
> -- GSSAPI support : 0
> -- Pcap debugging support : ON
> -- With static library: OFF
> -- Unit testing: OFF
> -- Client code Unit testing: OFF
> -- Public API documentation generation
> -- Benchmarks: OFF
> -- ********************************************
> -- Configuring done
> -- Generating done
> CMake Warning:
>   Manually-specified variables were not used by the project:
>
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTING
>     BUILD_TESTS
>     THREADS_PTHREAD_ARG
>
>
> -- Build files have been written to: /home/buildroot/dev/O/build/libssh-0.7.5/buildroot-build
>
> ---8<---
>
> The build step was then successfull, by the way...
>
> Regards,
> Yann E. MORIN.


--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
