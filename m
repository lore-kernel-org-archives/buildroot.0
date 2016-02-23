From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 23 Feb 2016 09:34:31 +0200
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160222232144.61b99b32@free-electrons.com>
References: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
 <20160222232144.61b99b32@free-electrons.com>
Message-ID: <CALdGskLWXoRtKZdqYErn6w4QmcAxLroxtzxkMFYiRsPuH_O7Hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All

The suggestion from Romain to disable -fPIE as below works for both
architectures.  Can I submit a patch for this? Or do you want to wait for a
response from Alexey and Waldemar?

# Remove -fPIE -pie from CFLAGS
ifeq ($(BR2_STATIC_LIBS),y)
CUPS_CONF_OPTS += LSB_BUILD=y
endif

Regards

Olivier Schonken



On 23 February 2016 at 00:21, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Olivier,
>
> On Mon, 22 Feb 2016 21:05:00 +0200, Olivier Schonken wrote:
>
> > arm |                     cups-2.1.2 | NOK |
> >
> http://autobuild.buildroot.net/results/07ccca8f80c56ab0ff48bfee876885b1c8c3916e/
> > arc |                     cups-2.1.2 | NOK |
> >
> http://autobuild.buildroot.net/results/b169b939e38cb761319a92d2871f4f59ddb5c4ac/
> >
> > Both error cases looks like it has to do with uclibc not behaving as
> > expected at link time for the ippserver build (Both builds link
> statically
> > with position independent execution also set).  For the arm platform it
> > can't find the Scrt1.o file, and for the ARC compiler, __init_array_end
> is
> > undefined.
> >
> > I haven't considered all the options yet, but two that come to mind are
> > disabling cups support for uclibc type compilers, or else to disable the
> > cups test-framework.
>
> Disabling for uClibc is completely overkill: this problem only occurs
> on ARM with static linking and on ARC. CUPS builds perfectly fine on
> ARM/uClibc when dynamic linking is used.
>
> The problem is that CUPS forcefully uses PIE support, and:
>
>  1/ Our static-only toolchain for ARM that uses uClibc-ng does not
>     contain Scrt1.o, while a dynamic-linking enabled uClibc-ng ARM
>     toolchain does have it. Due to this, trying to link a minimal C
>     program with -fPIE -pie fails. I'm Cc'ing Waldemar, the uClibc-ng
>     maintainer, to get his input on this.
>
>  2/ PIE is not supported by the ARC architecture, and should not be
>     used. Unfortunately, the configure script of CUPS only does an
>     AC_TRY_COMPILE() test to verify the support of PIE in the compiler,
>     but on ARC, it only fails at link time, so the test should be an
>     AC_TRY_LINK(). Olivier, could you try to fix the cups stuff so that
>     we can autoreconf it properly, and therefore fix such issues in the
>     cups configure.ac ? I'm also Cc'ing Alexey from Synopsys, who can
>     give more details about the PIE issue on ARC.
>
> Thanks for your investigation!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160223/7ef394a3/attachment.html>
