From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 26 Mar 2020 16:50:04 +0100
Subject: [Buildroot] Error building Python with musl in 2020.02
In-Reply-To: <1585215897497.45733@citrix.com>
References: <1584717125169.78577@citrix.com> <20200320223939.6d9972dc@gmx.net>
 <1584956001741.25630@citrix.com> <20200323184204.4aab32ad@gmx.net>
 <1585215897497.45733@citrix.com>
Message-ID: <20200326165004.015bff28@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

re-add CC: buildroot at busybox.net

On Thu, 26 Mar 2020 09:44:57 +0000, Simon Rowe <Simon.Rowe@citrix.com> wrote:

> Thanks for looking at this Peter, I did a cleanup of my work directory and a rebuild worked. Must have has some stale junk, sorry for the noise,

That's good news ;-), thanks for the feedback...

Regards,
Peter

>
> Simon
> ________________________________________
> From: Peter Seiderer <ps.report@gmx.net>
> Sent: 23 March 2020 17:42
> To: Simon Rowe
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Error building Python with musl in 2020.02
>
> Hello Simon,
>
> On Mon, 23 Mar 2020 09:33:21 +0000, Simon Rowe <Simon.Rowe@citrix.com> wrote:
>
> > [Apologies for the top posting, stuck with web-based email]
> >
> > python3, defconfig attached. This config has been working with 2019.02, I loaded and re-saved it
>
> Given defconfig still compiles fine here....
>
> - ./build/python3-3.8.2/Modules/posixmodule.c:
>   The usage of copy_file_range() is protected by HAVE_COPY_FILE_RANGE
>
> - HAVE_COPY_FILE_RANGE is defined in pyconfig.h:
>         $ grep HAVE_COPY_FILE_RANGE build/python3-3.8.2/pyconfig.h
> #define HAVE_COPY_FILE_RANGE 1
>
> - the buildroot compiled musl libc proviedes copy_file_range:
>
>         $ nm -A host/x86_64-buildroot-linux-musl/sysroot/lib/libc.so | grep copy_file_range
> host/x86_64-buildroot-linux-musl/sysroot/lib/libc.so:000000000001f4bd T copy_file_range
>
> - the header file provides copy_file_range() (protected by _GNU_SOURCE)
>
>         $ grep copy_file_range host/x86_64-buildroot-linux-musl/sysroot/usr/include/unistd.h
> ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
>
> Please try a plain defconfig (without EXTERNALs), make sure no additional patches/config files
> are used.....otherwise out of ideas...
>
> Regards,
> Peter
