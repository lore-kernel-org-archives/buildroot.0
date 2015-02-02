From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 2 Feb 2015 18:19:00 +0100
Subject: [Buildroot] board-specific autotools env customization
In-Reply-To: <20150202175455.5dd5c2e3@free-electrons.com>
References: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
 <20150202175455.5dd5c2e3@free-electrons.com>
Message-ID: <CAKAx1ciLEADv9bnxzLh-2m9hvuaVUnvWZcKqyGMRwBOaQVhLWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Mon, Feb 2, 2015 at 5:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Lionel Orry,
>
> On Mon, 2 Feb 2015 15:05:06 +0100, Lionel Orry wrote:
>
> > I would like to use a specific XXX_CONF_ENV variable to send ac_cv_...
> > variables to configure, but they are specific to my compiler. For my tests,
> > I currently write the XXX_CONF_ENV directly into the package .mk file, but
> > I would like to know if there is a better way. I already use the
> > recommended board/<company>/<board>/patches/ infrastructure, but this is
> > not a patch so I don't know where to put it...
> >
> > Any advice / best practice ?
>
> Well, only pass this <pkg>_CONF_ENV if you're using your specific
> compiler?

Indeed, but I was expecting to achieve this without modifying the .mk
file provided by buildroot.

>
> Maybe if you could be more specific and tell us which compiler / which
> environment variable you need to pass, we could give more hints.

Of course.

First, when I say it is specific to my compiler, I mean that it is
specific because it assumes some cached results for some './configure'
tests which are supposed to run on the target, and thus, when
cross-compiling, the maintainers of some autotools-based packages take
some assumptions which may not be right. I will precise my case below,
but I first wanted to say that this kind of situation could happen in
several packages present in buildroot, and for various
cross-compilers. It is not specific to *me*, it is an issue for
everyone using buildroot.

My case :
* I am cross-compiling the package zeromq (v4.0.4) on a Super-H target
using a pre-built toolchain from STMicroelectronics (STLinux 2.4).
* I noticed the configure script attempts to check for SO_KEEPALIVE
and other similar options existence, and it does so by compiling a
snippet, running it on the target and checking the output value,
excepted when cross-compiling (of course), where it cannot
automatically run the code. So the assumption taken by zeromq devs is
that this flag is not supported. But it is in fact supported (I
manually cross-compiled and ran the snippet on the target to be 100%
sure) and I would like to pass the right assumption to the configure
script, for example by setting "libzmq_so_keepalive=yes" in
ZEROMQ_CONF_ENV.
You will agree with me that the SO_KEEPALIVE flag availability is
dependent on the compiler you use, right? I try to do as few
modifications to the official buildroot as possible, but still I would
like zeromq to make use of this flag on my platform.

Aside note : in fact, in zeromq, the macros written for these flags
detection are wrong because they don't check if the value is set in
environment and always override them; so it is a bad example, but the
general question still arises, that would be interesting to have a
similar infrastructure like for patches, to pass user-specific
environments without messing with the .mk files...

I hope I was clear enough.

>
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
