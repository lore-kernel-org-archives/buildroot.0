From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 10 Feb 2016 14:32:06 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <20160210165700.7f97a29c@free-electrons.com>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
 <20160210165700.7f97a29c@free-electrons.com>
Message-ID: <2127002292.1917904.1455121926734.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message -----
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, February 10, 2016 1:57:00 PM
> Subject: Re: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC

> Dear Carlos Santos,
> 
> On Wed, 10 Feb 2016 13:25:49 -0200 (BRST), Carlos Santos wrote:
> 
>> > config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>> >        bool
>> >        default y if BR2_arm
>> >        default y if BR2_i386
>> >        default y if BR2_mipsel
>> >        default y if BR2_x86_64
>> 
>> These architecture checks would be superseded by the BR2_TOOLCHAIN_HAS_ATOMIC
>> boolean.
> 
> Indeed.
> 
>> >	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>> >        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>> > 
>> > *and* ensure protobuf gets linked with -latomic.
>> 
>> Hum, this requires a patch on configure.ac that that would hardly be accepted
>> upstream.
> 
> Why? If they use __atomic_*() built-ins, then they must link with
> libatomic if it exists, since __atomic_*() built-ins are not guaranteed
> to be available on all architectures if you don't link with libatomic.
> 
> Look for example at the Android NDK documentation, which says that you
> should link with libatomic when using <atomic> in C++ :
> 
>  http://developer.android.com/ndk/guides/cpp-support.html
> 
> (search for "atomic support").

The problem is the same you found on mpd (commit 84533029c70a4dffb2cd2e4f05e3903fd1b8fcd9) in branch master. With the patch in configure.ac I get this:

$ owerpc-e500v2-linux-gnuspe-ldd --root target/ target/usr/bin/protoc
        libprotobuf.so.9 => /usr/lib/libprotobuf.so.9 (0xdeadbeef)
        libatomic.so.1 => /lib/libatomic.so.1 (0xdeadbeef)
        libpthread.so.0 => /lib/libpthread.so.0 (0xdeadbeef)
        libc.so.6 => /lib/libc.so.6 (0xdeadbeef)
        ld.so.1 => /lib/ld.so.1 (0xdeadbeef)
        libz.so.1 => /usr/lib/libz.so.1 (0xdeadbeef)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0xdeadbeef)
        libm.so.6 => /lib/libm.so.6 (0xdeadbeef)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0xdeadbeef)
        libprotoc.so.9 => /usr/lib/libprotoc.so.9 (0xdeadbeef)

Without the patch protoc is not linked to libatomic.so.1.

Carlos Santos (Casantos)
DATACOM, P&D
