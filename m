From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 4 Feb 2015 08:52:56 +0100
Subject: [Buildroot] board-specific autotools env customization
In-Reply-To: <54D08CB7.7040801@mind.be>
References: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
 <20150202175455.5dd5c2e3@free-electrons.com>
 <CAKAx1ciLEADv9bnxzLh-2m9hvuaVUnvWZcKqyGMRwBOaQVhLWQ@mail.gmail.com>
 <54D08CB7.7040801@mind.be>
Message-ID: <CAKAx1cg32iH0XEby8hPoQq1nm2DutdtDROE5nBWsXMi1mO93qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Feb 3, 2015 at 9:54 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Lionel,
>
> On 02/02/15 18:19, Lionel Orry wrote:
> [snip]
> > First, when I say it is specific to my compiler, I mean that it is
> > specific because it assumes some cached results for some './configure'
> > tests which are supposed to run on the target, and thus, when
> > cross-compiling, the maintainers of some autotools-based packages take
> > some assumptions which may not be right. I will precise my case below,
> > but I first wanted to say that this kind of situation could happen in
> > several packages present in buildroot, and for various
> > cross-compilers. It is not specific to *me*, it is an issue for
> > everyone using buildroot.
>
>  It is indeed not specific to you, but applies to all cross-compiling users of
> zeromq.
>
> >
> > My case :
> > * I am cross-compiling the package zeromq (v4.0.4) on a Super-H target
> > using a pre-built toolchain from STMicroelectronics (STLinux 2.4).
> > * I noticed the configure script attempts to check for SO_KEEPALIVE
> > and other similar options existence, and it does so by compiling a
> > snippet, running it on the target and checking the output value,
> > excepted when cross-compiling (of course), where it cannot
> > automatically run the code. So the assumption taken by zeromq devs is
> > that this flag is not supported. But it is in fact supported (I
> > manually cross-compiled and ran the snippet on the target to be 100%
> > sure) and I would like to pass the right assumption to the configure
> > script, for example by setting "libzmq_so_keepalive=yes" in
> > ZEROMQ_CONF_ENV.
> > You will agree with me that the SO_KEEPALIVE flag availability is
> > dependent on the compiler you use, right? I try to do as few
> > modifications to the official buildroot as possible, but still I would
> > like zeromq to make use of this flag on my platform.
>
>  In fact, this flag is not dependent on the toolchain you use, but only on the
> kernel version (and of course your toolchain should also define the flag).
> That's why it runs the code, to find out if the kernel really supports it.
> SO_KEEPALIVE was introduced a really long time ago so you're safe to set
> libzmq_so_keepalive=yes unconditionally in ZEROMQ_CONF_ENV. And in fact, many of
> the other flags that zeromq checks for are also always available in Linux.
>
>  So we would really appreciate if you could check the various flags that zeromq
> tries to run and set them to yes if they are available, and send a patch to the
> mailing list. I've already checked libzmq_cv_sock_cloexec: SOCK_CLOEXEC was
> introduced in 2.6.27 so we can also assume that it's always available. Which
> kernel version do you run?
>

I have this list in here (there are 6 flags, 5 of them are available)
for my compiler, so I could make this patch. It won't do anything
useful until the acinclude.m4 is patched though, so I suppose the
first step is to fix acinclude.m4.

I use a 2.6.32 based kernel.

For reference, with my current compiler :
* compiler version : sh4-linux-gcc (GCC) 4.7.3 20130514
(STMicroelectronics/Linux Base 4.7.3-124)
* SOCK_CLOEXEC : available
* SO_KEEPALIVE : available
* TCP_KEEPCNT : available
* TCP_KEEPIDLE : available
* TCP_KEEPINTVL : available
* TCP_KEEPALIVE : not available

>
>
> > Aside note : in fact, in zeromq, the macros written for these flags
> > detection are wrong because they don't check if the value is set in
> > environment and always override them; so it is a bad example, but the
>
>  Yeah, indeed, you should also patch acinclude.m4 to correctly use a cache
> variable with AC_CACHE_VAL and AC_CACHE_CHECK. And that patch should be sent
> upstream of course.
>

I totally agree. But I'm still quite bad at autotools stuff and I
don't know how to use AC_CACHE_xxx macros
but I'll try to do it anyway. Any hints appreciated, the most clean
the patch is, the more chances it will have to hit upstream...

>
> > general question still arises, that would be interesting to have a
> > similar infrastructure like for patches, to pass user-specific
> > environments without messing with the .mk files...
>
>  We will do that when there is a situation where this would be useful. But most
> of our bases are covered already. We can check on the kernel version, the type
> of C library, various components of the toolchain. We are indeed missing a check
> for e.g. C/C++11 availability, but that will come at some point.

Thanks for the precisions.

>
>
>  Regards,
>  Arnout
>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Cheers,
Lionel
