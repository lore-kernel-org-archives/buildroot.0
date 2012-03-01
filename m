From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2012 00:27:33 +0000
Subject: [Buildroot] uClibc missing symbols (undefined reference to
	`__fini_array_end')
In-Reply-To: <CAGDZK6Ho6M+p4gpxHTqz8F7Jnwzo3b4KSWavh4DJ_XSb5Dp5fw@mail.gmail.com>
References: <CAGDZK6Ho6M+p4gpxHTqz8F7Jnwzo3b4KSWavh4DJ_XSb5Dp5fw@mail.gmail.com>
Message-ID: <201203010027.33790.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 29 February 2012 13:34:38 ?ric ALBER wrote:
> I'm using buildroot on an ARM9 (Marvel Kirkwood). I have configured
> buildroot to generate gcc on the target. But if I want to use it (gcc on
> the target), I get linker errors when I try to link a shared library like
> libpython2.7.so
> I guess I have something wrong with my uClibc or gcc setup but I can't
> figure out what. I use buildroot 2012.02-rc3, uClibc 0.9.32.1, linux 3.2.6
> 
> # gcc -shared -lpython2.7 -o test.so test.o
> /usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.a(__uClibc_main.os):
> In function `__uClibc_fini':
> __uClibc_main.c:(.text+0x140): undefined reference to `__fini_array_end'
> __uClibc_main.c:(.text+0x144): undefined reference to `__fini_array_start'

 These symbols are defined by the linker script, to allow the source code
to find the addresses of the static constructors/destructors.  So it's
not surprising that these symbols are undefined when linking a shared
library, because then you're not using a linker script.

 What _is_ surprising is that it's trying to link against libc.a.  Since
you're building a shared library, I'd expect it to link against libc.so...
So can you run gcc with the -v option to see how the linker is called?
And with -Wl,-M to make the linker print the libraries it loads.

 You do get 
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.so
on your target, right?  It's copied in by target-finalize.

 (I'm trying to reproduce your build but it takes a while.  And anyway
I can't run it, unless I set up a qemu for it...)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
