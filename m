From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Nov 2016 16:24:51 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <317178bd-364e-2c74-97eb-b9dc9bb91e66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 20:23, Arnout Vandecappelle wrote:
> http://autobuild.buildroot.net/results/1db64b4830f499621e44523e0ef68191505e2ce9
> arm / arm926ej-s	mpv-0.20.0	uclibc	
> 
>> > Checking for compiler support for usable thread synchronization built-ins : not found any of sync-builtins, stdatomic, atomic-builtins 
>  I guess it needs to depend on some atomic stuff? Needs investigation to find
> out what exactly is needed.

 This one is more annoying than expected.

 This toolchain actually does have both atomics and sync8, but it fails to link:

$ cat test.c
#include <stdint.h>
int main(int argc, char **argv)
{ int64_t test = 0;test = __atomic_add_fetch(&test, 1, __ATOMIC_SEQ_CST); return
0; }

$ ./host/usr/bin/arm-linux-gcc test.c
/gentoo/home2/arnout/br-out/arm-full/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/libgcc.a(linux-atomic-64bit.o):
In function `__check_for_sync8_kernelhelper':
/opt/toolchain-build/build/host-gcc-final-4.8.5/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/linux-atomic-64bit.c:59:
undefined reference to `__write'
collect2: error: ld returned 1 exit status

 Indeed, when I look at the source of linux-atomic-64bit.c:

/* Check that the kernel has a new enough version at load.  */
static void __check_for_sync8_kernelhelper (void)
{
  if (__kernel_helper_version < 5)
    {
      const char err[] = "A newer kernel is required to run this binary. "
                                "(__kernel_cmpxchg64 helper)\n";
      /* At this point we need a way to crash with some information
         for the user - I'm not sure I can rely on much else being
         available at this point, so do the same as generic-morestack.c
         write () and abort ().  */
      __write (2 /* stderr.  */, err, sizeof (err));
      abort ();
    }
};

 In gcc 4.9 and later, the __write is replaced with plain write.

 What do we do with this? Patch our gcc? Exclude atomics for ARM and gcc < 4.9?

 Note that I tried a few other packages that use atomics and didn't hit this
issue - probably because they don't use the 64-bit version.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout@mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
