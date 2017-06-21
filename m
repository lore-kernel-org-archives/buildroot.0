From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 21 Jun 2017 21:35:42 +0200
Subject: [Buildroot] perl packages: intrusion of host LDFLAGS
In-Reply-To: <20170621140802.GS29444@argentina>
References: <20170621140802.GS29444@argentina>
Message-ID: <CAB0FRsvteh=V5D6SiUVccfahgp+Wbieus_+Mt1AyUaz2ebSysw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-21 16:08 GMT+02:00 Thomas De Schampheleire <
thomas.de_schampheleire@nokia.com>:

> Hi Fran?ois, all,
>
> We try to add and build the perl-encode package. Adding the package works
> fine
> with the scancpan script, but the build fails:
>
> "/home/tdescham/repo/contrib/buildroot/output/host/usr/bin/perl"
> "/home/tdescham/repo/contrib/buildroot/output/host/usr/lib/perl5/5.24.1/ExtUtils/xsubpp"
> -nolinenumbers -typemap "/home/tdescham/repo/contrib/
> buildroot/output/host/usr/lib/perl5/5.24.1/ExtUtils/typemap"  Byte.xs >
> Byte.xsc && mv Byte.xsc Byte.c
> /usr/bin/gcc -c  -I../Encode -fwrapv -fno-strict-aliasing -pipe
> -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
> -DVERSION=\"2.04\" -DXS_VERSION=\"2.04\" -fPIC "-I/home/tdescham/repo/
> contrib/buildroot/output/host/usr/i686-buildroot-linux-gnu/
> sysroot/usr/lib/perl5/5.24.1/i686-linux/CORE"   Byte.c
> /usr/bin/gcc -c  -I../Encode -fwrapv -fno-strict-aliasing -pipe
> -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
> -DVERSION=\"2.04\" -DXS_VERSION=\"2.04\" -fPIC "-I/home/tdescham/repo/
> contrib/buildroot/output/host/usr/i686-buildroot-linux-gnu/
> sysroot/usr/lib/perl5/5.24.1/i686-linux/CORE"   byte_t.c
> rm -f ../blib/arch/auto/Encode/Byte/Byte.so
> /home/tdescham/repo/contrib/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc
> -shared -O2 -L/usr/local/lib -fstack-protector-strong Byte.o byte_t.o  -o
> ../blib/arch/auto/Encode/Byte/Byte.so        \
>         \
>
> i686-pc-linux-gnu-gcc: ERROR: unsafe header/library path used in
> cross-compilation: '-L/usr/local/lib'
> make[2]: *** [Makefile:461: ../blib/arch/auto/Encode/Byte/Byte.so] Error 1
> make[2]: Leaving directory '/home/tdescham/repo/contrib/
> buildroot/output/build/perl-encode-2.90/Byte'
> make[1]: *** [Makefile:697: subdirs] Error 2
> make[1]: Leaving directory '/home/tdescham/repo/contrib/
> buildroot/output/build/perl-encode-2.90'
> make: *** [package/pkg-generic.mk:230: /home/tdescham/repo/contrib/
> buildroot/output/build/perl-encode-2.90/.stamp_built] Error 2
>
>
>
> Looking at the Makefile(s) generated from Makefile.PL in this package,
> there
> is:
> LDFLAGS =  -fstack-protector-strong -L/usr/local/lib
>
> which seem to be flags taken from the host gcc installation:
> /usr/local/lib is
> not correct anyway in Buildroot, and fstack-protector-strong is not known
> by the
> Sourcery x86 compiler I was using in Buildroot.
>
>
> I checked with another perl package (perl-net-dns) which is already
> included in
> Buildroot, and found that its Makefile _also_ includes that /usr/local/lib
> string, but it does not fail. I think this must be because it is not
> trying to
> do C compilations.
> Anyway, it gives me the impression that this needs to be handled in the
> perl
> package infrastructure, rather than at module level.
> I tried using a post-configure hook to remove the /usr/local/lib, but then
> bumped into the fstack-protector-strong which is not generic and can thus
> not be
> filtered out nicely.
>
>
> Do you have any suggestion on how to proceed?
>
>
Thomas,

First, `Encode` is a core module (ie. bundled/built with the Perl
distribution).
So, you don't need to build it as an external module.
Try the command : `perl -MEncode -e 1`

`perl-net-dns` is a pure Perl module (only *.pm files which need to be
copied on the target)

The command `grep -R BR2_STATIC_LIBS package/perl-*` find 15 Perl modules
which require C compilation.

I use `perl-digest-sha1` as example. The generated Makefile contains:
LDFLAGS =  -fstack-protector-strong -L/usr/local/lib
LDDLFLAGS = -shared
It seems that LDDLFLAGS is used but not LDFLAGS.

The current infrastructure works well when the module contains only one
Makefile.PL (at top level).

`Encode` contains also Makefile.PL in many sub-directories.
I think that options are not well transmited in sub-directory.

Fran?ois


> Thanks,
> Thomas
>
>
>
> --
> Thomas De Schampheleire
> Embedded Software Engineer
> Fixed Networks, Nokia
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170621/479c5c02/attachment.html>
