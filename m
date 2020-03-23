From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Mar 2020 18:42:04 +0100
Subject: [Buildroot] Error building Python with musl in 2020.02
In-Reply-To: <1584956001741.25630@citrix.com>
References: <1584717125169.78577@citrix.com> <20200320223939.6d9972dc@gmx.net>
 <1584956001741.25630@citrix.com>
Message-ID: <20200323184204.4aab32ad@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Mon, 23 Mar 2020 09:33:21 +0000, Simon Rowe <Simon.Rowe@citrix.com> wrote:

> [Apologies for the top posting, stuck with web-based email]
>
> python3, defconfig attached. This config has been working with 2019.02, I loaded and re-saved it

Given defconfig still compiles fine here....

- ./build/python3-3.8.2/Modules/posixmodule.c:
  The usage of copy_file_range() is protected by HAVE_COPY_FILE_RANGE

- HAVE_COPY_FILE_RANGE is defined in pyconfig.h:
	$ grep HAVE_COPY_FILE_RANGE build/python3-3.8.2/pyconfig.h
#define HAVE_COPY_FILE_RANGE 1

- the buildroot compiled musl libc proviedes copy_file_range:

	$ nm -A host/x86_64-buildroot-linux-musl/sysroot/lib/libc.so | grep copy_file_range
host/x86_64-buildroot-linux-musl/sysroot/lib/libc.so:000000000001f4bd T copy_file_range

- the header file provides copy_file_range() (protected by _GNU_SOURCE)

	$ grep copy_file_range host/x86_64-buildroot-linux-musl/sysroot/usr/include/unistd.h
ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);

Please try a plain defconfig (without EXTERNALs), make sure no additional patches/config files
are used.....otherwise out of ideas...

Regards,
Peter

>
> Simon
>
> ________________________________________
> From: Peter Seiderer <ps.report@gmx.net>
> Sent: 20 March 2020 21:39
> To: Simon Rowe
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Error building Python with musl in 2020.02
>
> Hello Simon,
>
> On Fri, 20 Mar 2020 15:12:07 +0000, Simon Rowe <Simon.Rowe@citrix.com> wrote:
>
> > I'm getting the following error when trying out 2020.02 with the latest musl-based toolchain
> >
> >
> > /build/host/bin/x86_64-buildroot-linux-musl-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -std=c99 -Wextra -Wno-unused-result -Wno-unused-parameter -Wno-missing-field-initializers -Werror=implicit-function-declaration  -I./Include/internal  -I. -I./Include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -DPy_BUILD_CORE_BUILTIN  -c ./Modules/xxsubtype.c -o Modules/xxsubtype.o
> > ./Modules/posixmodule.c: In function 'os_copy_file_range_impl':
> > ./Modules/posixmodule.c:9704:15: error: implicit declaration of function 'copy_file_range'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
> >  9704 |         ret = copy_file_range(src, p_offset_src, dst, p_offset_dst, count, flags);
> >       |               ^~~~~~~~~~~~~~~
> >       |               sync_file_range
> > cc1: some warnings being treated as errors
> > Makefile:1938: recipe for target 'Modules/posixmodule.o' failed
> >
> >
> > Has anyone else seen this?
>
> Python or python3? Could you provide a .config or defconfig file
> for the failure?
>
> Regards,
> Peter
>
> >
> >
> > Simon
>
