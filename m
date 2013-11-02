From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 Nov 2013 20:45:33 +0100
Subject: [Buildroot] Problems with Python ctypes is not limited to
 Raspberry Pi platfform - tested on qemu vexpress
In-Reply-To: <CAMduVEdzrDhzbXv6buXJTXxB19fHbmee0Q4+qoA4Fsw3ECRmaQ@mail.gmail.com>
References: <CAMduVEdzrDhzbXv6buXJTXxB19fHbmee0Q4+qoA4Fsw3ECRmaQ@mail.gmail.com>
Message-ID: <5275565D.4060304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/10/13 23:53, Wojciech Zabolotny wrote:
[snip]
> 4. I have compiled the system with "make" (well, "make -j 12" doesn't
> work for current version of buildroot - it fails with following error
> messages:
> $ make -j 12
> [...]
>>>> host-automake 1.12.6 Building
> PATH=/tmp/rr/buildroot/output/host/bin:/tmp/rr/buildroot/output/host/usr/bin:/home/wzab/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> LD_LIBRARY_PATH="/tmp/rr/buildroot/output/host/usr/lib:"
> PKG_CONFIG="/tmp/rr/buildroot/output/host/usr/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/"
> PKG_CONFIG_LIBDIR="/tmp/rr/buildroot/output/host/usr/lib/pkgconfig"
> PERLLIB="/tmp/rr/buildroot/output/host/usr/lib/perl"  /usr/bin/make
> -j9  -C /tmp/rr/buildroot/output/build/host-automake-1.12.6/
> make[1]: Entering directory
> `/tmp/rr/buildroot/output/build/host-automake-1.12.6'
> make[1]: warning: -jN forced in submake: disabling jobserver mode.
> make[1]: *** read jobs pipe: No such file or directory.  Stop.
> make[1]: *** Waiting for unfinished jobs....
>    GEN      automake
>    GEN      t/ax/shell-no-trail-bslash
> make: *** [/tmp/rr/buildroot/output/build/host-automake-1.12.6/.stamp_built]
> Broken pipe
> )

  That's weird... The top-level Makefile has .NOTPARALLEL, so your -j12 
should be ignored...

[snip]
> # vi /usr/lib/python2.7/ctypes/util.py
>
> changing the mach_map dictionary:
>
>              mach_map = {
>                  'x86_64-64': 'libc6,x86-64',
>                  'ppc64-64': 'libc6,64bit',
>                  'sparc64-64': 'libc6,64bit',
>                  's390x-64': 'libc6,64bit',
>                  'ia64-64': 'libc6,IA-64',
>                  'armv7l-32':'libc0',
>                  }
>              abi_type = mach_map.get(machine, 'libc6')

  The problem with this, of course, is that it should be libc0 for uClibc 
but libc6 for glibc, and that what you have here only works for armv7l so 
something similar should be added for all other architectures.

  Instead, I think it's better to add a third fallback option (in case 
neither ldconfig nor gcc produce a result) that uses glob.glob to find a 
matching library in /usr/lib or /lib.


  Regards,
  Arnout

>
> and run Python again:
> # python
> Python 2.7.3 (default, Oct 30 2013, 23:17:05)
> [GCC 4.7.3] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>>>> import ctypes.util
>>>> ctypes.util.find_library('m')
> 'libm.so.0'
>>>>
>
> So after the above modification, find_library works.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
