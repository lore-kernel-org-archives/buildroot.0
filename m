From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 25 Oct 2019 17:01:45 -0700
Subject: [Buildroot] [PATCH] package/jitterentropy-library: fix build
 failure due to missing -fPIC
In-Reply-To: <CAGt4E5vU9C+2kO1crN4PeyuNyqr3NEi0qxRUbxFbrTjsThW3Jw@mail.gmail.com>
References: <20191023110605.23836-1-giulio.benetti@benettiengineering.com>
 <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be>
 <8736fgkdas.fsf@dell.be.48ers.dk>
 <2f610d45-59a6-da96-b32e-ed1ff8c2dfbd@mind.be>
 <87d0ekiq8p.fsf@dell.be.48ers.dk>
 <5cc9edf8-190b-b742-4986-e9b85d8531e8@mind.be>
 <CAGt4E5vU9C+2kO1crN4PeyuNyqr3NEi0qxRUbxFbrTjsThW3Jw@mail.gmail.com>
Message-ID: <CAGt4E5swbQrYUZ2zwdWTiOD2ori9Zu1fMocsAEtqJXUa-v2wfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 at 16:17, Markus Mayer <mmayer@broadcom.com> wrote:

> $ git diff
> diff --git a/package/jitterentropy-library/jitterentropy-library.mk
> b/package/jitterentropy-library/jitterentropy-library.mk
> index 75c770f..3db04b2 100644
> --- a/package/jitterentropy-library/jitterentropy-library.mk
> +++ b/package/jitterentropy-library/jitterentropy-library.mk
> @@ -22,7 +22,7 @@ JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
>  endif
>
>  define JITTERENTROPY_LIBRARY_BUILD_CMDS
> -       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>                 $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
>  endef

I submitted a proper patch for this.

http://lists.busybox.net/pipermail/buildroot/2019-October/263865.html

Regards,
-Markus

> This is the error without the above change:
>
> >>> jitterentropy-library 2.2.0 Building
> PATH="/local/users/mmayer/buildroot/output/arm64/host/bin:/local/users/mmayer/buildroot/output/arm64/host/sbin:/home/mm940762/bin:/home/mm940762/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> PATH="/local/users/mmayer/buildroot/output/arm64/host/bin:/local/users/mmayer/buildroot/output/arm64/host/sbin:/home/mm940762/bin:/home/mm940762/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> AR="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ar"
> AS="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-as"
> LD="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ld"
> NM="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-nm"
> CC="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gcc"
> GCC="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gcc"
> CPP="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-cpp"
> CXX="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-g++"
> FC="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gfortran"
> F77="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gfortran"
> RANLIB="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ranlib"
> READELF="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-readelf"
> STRIP="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-strip"
> OBJCOPY="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-objcopy"
> OBJDUMP="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-objdump"
> AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
> CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
> CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
> CPPFLAGS_FOR_BUILD="-I/local/users/mmayer/buildroot/output/arm64/host/include
> -DNDEBUG" CFLAGS_FOR_BUILD="-O2
> -I/local/users/mmayer/buildroot/output/arm64/host/include -DNDEBUG"
> CXXFLAGS_FOR_BUILD="-O2
> -I/local/users/mmayer/buildroot/output/arm64/host/include -DNDEBUG"
> LDFLAGS_FOR_BUILD="-L/local/users/mmayer/buildroot/output/arm64/host/lib
> -Wl,-rpath,/local/users/mmayer/buildroot/output/arm64/host/lib"
> FCFLAGS_FOR_BUILD=""
> DEFAULT_ASSEMBLER="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-as"
> DEFAULT_LINKER="/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ld"
> CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  "
> CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os  " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os
> " PKG_CONFIG="/local/users/mmayer/buildroot/output/arm64/host/bin/pkg-config"
> STAGING_DIR="/local/users/mmayer/buildroot/output/arm64/host/aarch64-buildroot-linux-gnu/sysroot"
> INTLTOOL_PERL=/usr/local/bin/perl ROOTDIR=../.. LINUXDIR=linux-stb-4.9
> PKG_CONFIG="/local/users/mmayer/buildroot/output/arm64/host/bin/pkg-config"
> /usr/bin/make -j33 -C
> /local/users/mmayer/buildroot/output/arm64/build/jitterentropy-library-2.2.0
> /local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gcc
> -shared -Wl,-soname,libjitterentropy.so.2 -o libjitterentropy.so.2.2.0
> jitterentropy-base.o  -Wl,-z,relro,-z,now  -lrt
> /local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ar
> rcs libjitterentropy.a jitterentropy-base.o
> jitterentropy
> /bin/bash: jitterentropy: command not found
> package/pkg-generic.mk:238: recipe for target
> '/local/users/mmayer/buildroot/output/arm64/build/jitterentropy-library-2.2.0/.stamp_built'
> failed
> make[1]: *** [/local/users/mmayer/buildroot/output/arm64/build/jitterentropy-library-2.2.0/.stamp_built]
> Error 127
> Makefile:25: recipe for target '_all' failed
> make: *** [_all] Error 2
>
> Regards,
> -Markus
