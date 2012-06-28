From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Jun 2012 10:09:57 +0200
Subject: [Buildroot] Compiling grub on x86_64
In-Reply-To: <20120625100458.4a3e62c8@skate>
References: <4FE81898.4020606@mind.be> <20120625100458.4a3e62c8@skate>
Message-ID: <4FEC1155.4020008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/12 10:04, Thomas Petazzoni wrote:
> Hello,
>
> Le Mon, 25 Jun 2012 09:51:52 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
> >    I have an x86 project using and internal toolchain and grub as the boot loader.  We recently switched to x86_64 (for
> > syscall performance reasons).  Unfortunately, grub fails to even configure: the compiler can't generate executables.
> > It's missing -lgcc_s.  I guess this is because the toolchain is built without multilib support and grub uses the -m32
> > switch.
> >
> >    I'm unusually stumped at this point.  Building a toolchain with multilib support seems the easy way out, but that's a
> > bit heavy just to be able to compile grub.  A 64-bit build of grub will probably not work because BIOSes don't
> > understand 64-bit.  So the best thing I can come up with is to have a separate buildroot config just to build grub.
> > Does anyone have better ideas?
>
> No, it's a difficult problem. And the issue came up several times on
> the list already. How much effort would it be to also generate a
> multilib 32bits/64bits toolchain when x86_64 is used?

  It's certainly not trivial...  Here's a list of issues I can come up with:

* It requires a different implementation for internal, crosstool-NG and
external toolchains.
* For external toolchains, there should be a check if it is multilib or not.
* For external toolchains, the wrapper has to change a lot because
the -m32 may imply a different -march and -mtune.
* crosstool-NG itself has no support for multilib AFAICS.  Support would
have to be added.
* For internal toolchains, uClibc has to be built twice.
* Final gcc stage should be configured with the multilib paths.
* Are the multilib libraries installed to the target?  For grub this isn't
really needed, but if something else compiles with -m32...
* Are other libraries compiled with multilib variants?

>
> >    With this in mind, it's probably best to remove the BR2_x86_64 option from the grub config, or at least limit it to
> > external toolchains that may work (i.e. Sourcery).
>
> At least for now, yes, making sure that Grub can't be selected with
> internal toolchains on x86_64 seems like a good idea.

  Turns out that it currently also doesn't work with multilib external toolchains.
The wrapper sets --sysroot to a path which doesn't contain the 32-bit libs.


  For the time being, I guess grub should be disabled for all 64-bit configurations.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
