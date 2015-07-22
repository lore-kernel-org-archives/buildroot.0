From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 11:48:06 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


> >       x86_64 |                   acpid-2.0.22 | NOK |
> http://autobuild.buildroot.net/results/83f9b5216aab22d2f3de69328457590b40d27fd4/
>
> musl build issue, there was a proposed patch to fix this, but I wasn't
> really happy with it. See http://patchwork.ozlabs.org/patch/497874/.
>

A revised patch was submitted to upstream - maintainer has requested a
couple more tweaks, hoping to get that done today.


> >        sparc |                 busybox-1.23.2 | NOK |
> http://autobuild.buildroot.net/results/16b2aaad834bc19b3e35604e9bbcab7b6c060307/
> >        sparc |                 busybox-1.23.2 | NOK |
> http://autobuild.buildroot.net/results/98bbb53c0fa8bedf52e8f4507e4b00e631470c25/
>
> Atomic issue. Gustavo?
>
> >        sparc |                libglib2-2.44.1 | NOK |
> http://autobuild.buildroot.net/results/530bd5b0c9a46c9d4aea249bb308b116806c43a4/
> >        sparc |                libglib2-2.44.1 | NOK |
> http://autobuild.buildroot.net/results/20f10276ee40cac4dda38904f784e72f479a5264/
> >        sparc |                libglib2-2.44.1 | NOK |
> http://autobuild.buildroot.net/results/908f7cd2434bc4235683c8cce079b839b783764a/
>
> Atomic problem. Gustavo?
>

I've been having a look at the atomic sparc problem. (there seem to be a
few other packages effected by it other than those listed above -
"libpthsem" is one; I think the ruby interpreter may also see the same
issue, but I've not checked it yet).

The problem is easily reproducible on buildroot toolchains as well as the
external ones. Doesn't matter if you're using uclibc or not.

libglib2 is trying to implement its own mutexes using GCC's atomic
functions. If I'm right, I think when the compiler encounters a case where
it cannot generate code for the required function, for whatever reason, it
falls back by issuing a call to an external library. This is supplied in
libatomic, which appears to be included with the toolchain (ie glibc). When
I hacked the libglib2 build to add -latomic the problem went away. I'd say
the same hack might apply to libtirpc (which is why busybox is failing as
it links this library).

It sounds like the kind of problem that should ordinarily be detected and
handled by the configure script (ie automake). It strikes me as strange
that the developer is supposed to know whether or not to link a library
depending on what kind of code the compiler generated, so there must be
something I'm missing.

Since the problem doesn't seem to occur on i386/x86_64 I'm wondering if
it's one of those cases where SPARC gcc is lagging ..

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/398faa61/attachment.html>
