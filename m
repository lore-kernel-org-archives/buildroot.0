From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 15 Aug 2017 17:59:00 -0400
Subject: [Buildroot] can't build qt5webkit for raspberry pi 3
In-Reply-To: <a6c22850-0224-c263-123d-197392f48615@mind.be>
References: <20170815114148.42777e85@brock-desktop>
 <20170815210235.3uvthq2bk5zoxluo@gportay>
 <a6c22850-0224-c263-123d-197392f48615@mind.be>
Message-ID: <20170815215900.bsskjbqwncdj2wyz@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Aug 15, 2017 at 11:24:54PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 15-08-17 23:02, Ga?l PORTAY wrote:
> > Hello Brock,
> > 
> > On Tue, Aug 15, 2017 at 11:41:48AM -0600, Brock Williams wrote:
> >> I'm not able to build qt5webkit for a pi 3 from master.  It works for pi
> >> 2. Here is the error:
> >>
> >> In file included from ./config.h:30:0,
> >>                  from wtf/CurrentTime.cpp:34:
> >> ./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
> >>  #    error "Not supported ARM architecture"
> >>       ^~~~~
> >>
> >> I've attached the defconfig that we are using.  This is based on the
> >> raspberrypi3_defconfig with what I think is just the minimum to build
> >> qt5webkit added.  For now we have just configured
> >> the build down to the pi 2 cpu settings.
> >>
> >> Brock
> >>
> > The CPU of rpi3 has moved from cortex-a8 (armv7) to cortex-a53 (armv8) in the
> > raspberrypi3_defconfig. And Qt WebKit do not support for armv8.
> 
>  So we should add arch dependencies to qt5webkit, I guess. Are there more arches
> that are excluded (but still allowed by jscore, so only arm, x86, mipsel)?
> 

I am compiling for rpi3. The fix seems to work. I will test it on the target
when the image is ready.

QtWebKit supposed to be supported on these architecture.

	$ git grep '/\* CPU(.*).*\*/' Source/WTF/wtf/Platform.h
	Source/WTF/wtf/Platform.h:/* CPU() - the target CPU architecture */
	Source/WTF/wtf/Platform.h:/* CPU(ALPHA) - DEC Alpha */
	Source/WTF/wtf/Platform.h:/* CPU(HPPA) - HP PA-RISC */
	Source/WTF/wtf/Platform.h:/* CPU(IA64) - Itanium / IA-64 */
	Source/WTF/wtf/Platform.h:/* CPU(MIPS64) - MIPS 64-bit */
	Source/WTF/wtf/Platform.h:/* CPU(MIPS) - MIPS 32-bit */
	Source/WTF/wtf/Platform.h:/* CPU(PPC) - PowerPC 32-bit */
	Source/WTF/wtf/Platform.h:/* CPU(PPC64) - PowerPC 64-bit */
	Source/WTF/wtf/Platform.h:/* CPU(SH4) - SuperH SH-4 */
	Source/WTF/wtf/Platform.h:/* CPU(SPARC32) - SPARC 32-bit */
	Source/WTF/wtf/Platform.h:/* CPU(SPARC64) - SPARC 64-bit */
	Source/WTF/wtf/Platform.h:/* CPU(SPARC) - any SPARC, true for CPU(SPARC32) and CPU(SPARC64) */
	Source/WTF/wtf/Platform.h:/* CPU(S390X) - S390 64-bit */
	Source/WTF/wtf/Platform.h:/* CPU(S390) - S390 32-bit */
	Source/WTF/wtf/Platform.h:/* CPU(X86) - i386 / x86 32-bit */
	Source/WTF/wtf/Platform.h:/* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
	Source/WTF/wtf/Platform.h:/* CPU(ARM) - ARM, any version*/
	Source/WTF/wtf/Platform.h:/* CPU(ARM_FEATURE_UNALIGNED) - ARM instruction set supports unaligned access */
	Source/WTF/wtf/Platform.h:/* CPU(ARM_TRADITIONAL) - Thumb2 is not available, only traditional ARM (v4 or greater) */
	Source/WTF/wtf/Platform.h:/* CPU(ARM_THUMB2) - Thumb2 instruction set is available */
	Source/WTF/wtf/Platform.h:/* CPU(AARCH64) - AArch64 */

The issue comes from the fact we have __ARM_ARCH_8A__ defined but not
__aarch64__ (because we have an armv8/32bits; and not an armv8/64bits).

__ARM_ARCH_8A__ is never catched in an #ifdef/endif in Platform.h. __aarch64__
and __ARM_ARCH_[4-7]x__ are caught.

Regards,
Gael
