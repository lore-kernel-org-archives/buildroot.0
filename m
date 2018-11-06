From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Nov 2018 10:19:35 -0600
Subject: [Buildroot] glibc link fails on x86_64 with fPIC error
In-Reply-To: <1541520575003-0.post@n4.nabble.com>
References: <1541520575003-0.post@n4.nabble.com>
Message-ID: <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Tue, Nov 6, 2018 at 10:09 AM mws <mike.w.shapiro+buildroot@gmail.com> wrote:
>
> I'm using buildroot-2018.08.2 to build for x86_64 using essentially the
> defaults for that release (glibc 2.27, gcc 7.3.0) but enabling glibc for the
> toolchain.  The toolchain build goes very well until it gets to glibc in the
> elf/ subdirectory at which point it blows up with an fPIC error on the link
> test shown below.
>

If looks like some of the hardening features are turned on like relro.
Would you mind doing a savedefconfig and provide that defconfig
(should be small so just inline here in a response is fine)?

> I've tried varying gcc version, binutils version to see if this is some
> defaults problem with no luck.  Has anyone else seen this before or have
> advice on fixing?  Fundamentally it seems like basic out-of-the-box x86_64 +
> glibc is not able to build with this buildroot release.
>
> ---
>
> buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc   -nostdlib -nostartfiles
> -r -o
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os
> '-Wl,-('
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/dl-allobjs.os
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/rtld-libc.a
> -lgcc '-Wl,-)' \
>
> -Wl,-Map,buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os.map
> buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc   -nostdlib -nostartfiles
> -shared -o
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/ld.so.new
> \
>           -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=both -Wl,-z,defs
> \
>
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os
> -Wl,--version-script=buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/ld.map
> \
>           -Wl,-soname=ld-linux-x86-64.so.2                      \
>           -Wl,-defsym=_begin=0
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os:
> In function `dl_main':
> rtld.c:(.text+0x25ab): undefined reference to `__open'
> rtld.c:(.text+0x2b19): undefined reference to `__access'
> rtld.c:(.text+0x442c): undefined reference to `__access'
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os:
> In function `lose.isra.5':
> dl-load.c:(.text+0x486a): undefined reference to `__close'
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os:
> In function `_dl_map_object_from_fd':
> dl-load.c:(.text+0x491c): undefined reference to `__GI___fxstat64'
> buildroot/host/lib/gcc/x86_64-buildroot-linux-gnu/7.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/librtld.os:
> relocation R_X86_64_PC32 against undefined symbol `__GI___fxstat64' can not
> be used when making a shared object; recompile with -fPIC
> buildroot/host/lib/gcc/x86_64-buildroot-linux-gnu/7.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> final link failed: Bad value
> collect2: error: ld returned 1 exit status
> make[4]: ***
> [buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/ld.so]
> Error 1
> make[3]: *** [elf/subdir_lib] Error 2
> make[2]: *** [all] Error 2
> make[1]: ***
> [buildroot/build/glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/.stamp_built]
> Error 2
> make: *** [_all] Error 2
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
