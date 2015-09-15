From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2015 19:53:54 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <20150915093523.0597731f@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
 <20150915093523.0597731f@free-electrons.com>
Message-ID: <20150915175354.GA3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Cjw, All,

On 2015-09-15 09:35 +0200, Thomas Petazzoni spake thusly:
> On Tue, 15 Sep 2015 00:06:46 -0400, Cjw X wrote:
> > >>  # Compute GNU_TARGET_NAME
> > >> +ifeq ($(BR2_TOOLCHAIN_NO_VENDOR),y)
> > >> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(LIBC)$(ABI)
> > >
> > > Is it really mandatory to *not* have a vendor part of the tuple?
> > 
> > I've tried building arm-buildroot-none-eabi and
> > arm-buildroot-none-newlibeabi, both of which, based on my
> > understanding, should compile, but none of the tools build with that
> > target. Binutils doesn't compile, nor does gcc. I spent some time
> > looking at this, but never found an elegant solution.
> 
> Interesting. I guess we'll have to experiment a bit with this.
> 
> I'm adding Yann in Cc. Yann, have you experienced such thing when
> adding bare-metal/newlib support in Crosstool-NG? I've quickly looked
> at the Crosstool-NG code, and I don't see the vendor part of the tuple
> being skipped specifically for bare metal/newlib toolchains, but maybe
> I missed it.

In fact, that's not the 'vendor' part that is to be removed; it's the
'kernel' part.

A canonical tuple is usually a three-part tuple: arch-vendor-os. But in
the case of linux, the 'os' field is split in two: the 'kernel' and
'userland', like so:  arch-vendor-kernel-userland.

But really, the 'os' or 'userland' fields mostly denote the ABI being
used.

So we end up with things like:

  - targets for running Linux:
    - i386-blabla-linux-gnu
    - powerpc-unknown-linux-gnuspe
    - arm-none-linux-gnueabihf
    - and so on...

  - targets running bare-metal:
    - i386-blabla-elf
    - powerpc-unknown-spe
    - arm-none-eabihf
    - and so on...

So, for bare-metal:

  - tuples are made of only three-part (in fact the historical canonical
    form),

  - the part that is "omitted" from the four-part variant is not the
    vendor string; rather the 'kernel' and 'userland' fields are merged
    into one.

However, I'm not sure it is possible to run newlib as the C library
under Linux (i.e. as a replacement for glibc/uClibc/musl). IIRC, newlib
really targets kernel-less systems. It seems there are linux support
files in the newlib source, but I doubt tht is often tested or even
compeltely supported; a cursory look at the interwebs does not return
promissing results...

And in nay case, I'm afraid a lot of packages would not build against
newlib.

All that to say that I need to look at the patch, and I otherwise do not
see the point for having newlib in Buildroot...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
