From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 21 Dec 2016 07:18:54 +0100
Subject: [Buildroot] [musl] Re:  [musl] cortex-m support?
In-Reply-To: <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
 <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
Message-ID: <20161221061853.GB2915@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rob,
Rob Landley wrote,

> > I am wondering why you don't cc me or any uclibc related list? 
> 
> I cc'd the buildroot list, which only has uClibc-based cortex-m support
> at the moment. Why do you suppose I did that?

That is not completely true, OpenADK has support for it, too.
But I am not sure you declare OpenADK a real project.
It seems to me that in your definition of a open source project,
the people behind must either get money for their work or the
project needs millions of installations.
 
> Did you want me to send it to the uclibc.org mailing list which hasn't
> had a single post this month except your announcement of your fork's
> release? 

No, I would like to see your suggestions and patches on
the uClibc-ng mailing list:
http://mailman.uclibc-ng.org/cgi-bin/mailman/listinfo/devel/

> Has your fork solved the locales problem?
> 
>   http://lists.busybox.net/pipermail/uclibc/2015-June/049000.html

I don't support the binary locale package. I am not very interested
in locale support.
 
> Has your fork solved the nptl issue?
> 
>   http://lists.busybox.net/pipermail/uclibc/2008-September/020151.html
>   http://lists.busybox.net/pipermail/uclibc/2008-September/020169.html
>   http://lists.busybox.net/pipermail/uclibc/2008-September/020171.html
>   http://lists.busybox.net/pipermail/uclibc/2008-October/041201.html

Not sure. But in uClibc-ng there is Linuxthreads support for every
supported architecture (excluding METAG) and NPTL for the global
players. I added NPTL support from GNU libc recently, but Microblaze
seems indeed bitrotted inside GNU libc as nobody is doing any test
suite runs. 
https://sourceware.org/ml/libc-alpha/2016-07/msg00640.html

There is even missing DWARF2 support in GCC upstream, so I think it
is even not compile time tested.
 
>   http://lists.busybox.net/pipermail/uclibc/2006-March/014811.html
> 
> Do you have a sane "make defconfig" that lets people build uClibc
> without learning what over a hundred individual config options do and
> making decisions about whether or not they need each one? This issue
> doesn't even come _up_ with musl, it fundamentally avoids most of the
> structural problems that strangled uClibc development, by design.

I regulary cleanup needless options and keep good defaults.
The number of options get lower. I still like the idea of being able
to build a complete toolchain without thread support or other
stuff disabled. I will try to remove more options in the future.
 
> > You still believe uClibc projects should die?
> 
> No, I believe uClibc _already_ died. I believe this because I was there.

Yes, uClibc is dead. uClibc-ng is alive!
 
> But cortex-m still only supports pthreads in 2016 and even that's buggy
> in ways that were fixed out of tree quite a while ago. The release I
> fished this bugfix out of is a year old. I don't have their source
> control to see how old the fix really is, but emcraft's "preferred"
> kernel (https://github.com/emcraftsystems/linux-emcraft) forked off from
> mainline 7 years ago, and cortex-m support for Linux is their core
> business, so there's a guess how long ago somebody actually _using_ this
> might have noticed it.

So, may be you can prepare a patch for the uClibc-ng list?
Or do you want to see the bug open for another year? 
 
> In case you really _don't_ know the history, let me walk you through how
> the uClibc project died, going back through about ten years of
> accumulated scar tissue, and why three different maintainers before you
> failed to fix it. 

Thanks for the history walkthrough. Do you know why Bernhard is so
unresponsive and more about the time shortly after his last release?

> You came into a project I'd pushed for 10 years and started collecting
> trivial bugfixes without addressing any of the serious architectural
> issues (like needlessly duplicated per-architecture headers snapshot
> from ancient glibc versions, with a #define pretending to be glibc (musl
> doesn't) and declaring all sorts of stuff the library doesn't actually
> implement). And you're wondering why I have a more pessimistic outlook
> of your chances than you do?

You have to start somewhere, otherwise nothing happens.
 
> The big elephant in the development room was the NPTL code, and cortex-m
> is still using pthreads, not nptl, and WITHIN that pthreads mess is _old
> and _new versions of thread wait for supporting 2.2 kernels. (The
> menuconfig option has been replaced with _old and _new suffixes on the
> functions. Great.)

Linuxthreads.new is gone. uClibc-ng only support Linuxthreads and
NPTL.

> You've said that your reason for supporting uclibc-ng was for two
> architectures, ARC and Xtensa:
> 
>   http://www.openwall.com/lists/musl/2015/05/30/1
 
> That is why _you_ care. I personally think that adding support for those
> to musl-libc would be a far better use of your time, but it's not my job
> to tell you want to do. It's your hobby time. Do what you like with it.
> Just don't expect me to take you seriously after ten years of this.

That is not entirely right. I care for every supported uClibc-ng
architecture. uClibc-ng might be used for different use cases:
- old non mainstream architectures like lm32, avr32, cris, fr-v, ..
- noMMU systems like arm, coldfire, bfin, c6x, ..
- architectures not supported by any other C library like arc,
  xtensa, nds32, h8300, ..
- vintage unix hardware like SGI O2, Sparcstations, ...

See my table which architectures are not supported by musl/glibc:
http://uclibc-ng.org/wiki/matrix

Indeed Max has started a musl implementaton for Xtensa:
https://github.com/jcmvbkbc/musl-xtensa

The Synopsys people trying to add support for GNU libc.

But even then uClibc-ng is always a good choice for regression
testing and testing between the different C libraries.
 
> I cc'd buildroot. That is a real project, which still uses uClibc for
> the targets Rich hasn't gotten around to porting musl to yet. I cc'd
> them so they would be aware of the issue. I could have just sent it to
> the musl list, but chose to inform buildroot as well.

Other real projects use uClibc-ng, too. So may be next time you sent
it to our list directly ;)
 
best regards
 Waldemar
