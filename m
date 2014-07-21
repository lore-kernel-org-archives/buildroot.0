From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 21 Jul 2014 09:39:05 +0000
Subject: [Buildroot] [PATCH 2/2] perf: Don't build backtrace for ARC
In-Reply-To: <CAAXf6LWKMo_fM0C7f0XL41L=5OiKjsfN1mXt0h68QM0UC2Nk3g@mail.gmail.com>
References: <1390914658-18198-1-git-send-email-mjonker@synopsys.com>
 <CAAXf6LWJqKV-FFUXycBMNvOFZ+CyosFMPb9khmr9x9=Ug6q7xQ@mail.gmail.com>
 <CAAXf6LWKMo_fM0C7f0XL41L=5OiKjsfN1mXt0h68QM0UC2Nk3g@mail.gmail.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CF6175@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Call to backtrace() function fails for ARC, because for some reason unwinder from libgcc returns early. Thus usage of backtrace() should be disabled in perf explicitly, because build system only checks for existence of this call and since it is there it tries to use. However at runtime the output will not be the one expected: it will contain only several functions from the top of stack, instead of the complete backtrace.

> -----Original Message-----
> From: Thomas De Schampheleire [mailto:patrickdepinguin at gmail.com]
> Sent: 19 July 2014 00:24
> To: Anton Kolesov
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 2/2] perf: Don't build backtrace for ARC
> 
> Anton,
> 
> Same for this mail, thanks.
> 
> On Fri, Jul 18, 2014 at 10:16 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
> > Hi Mischa,
> >
> > On Tue, Jan 28, 2014 at 2:10 PM, Mischa Jonker
> > <Mischa.Jonker@synopsys.com> wrote:
> >> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> >> ---
> >>  package/perf/perf.mk |    4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> >> index ffe18bc..5628ba5 100644
> >> --- a/package/perf/perf.mk
> >> +++ b/package/perf/perf.mk
> >> @@ -22,6 +22,10 @@ PERF_MAKE_FLAGS = \
> >>         WERROR=0 \
> >>         ASCIIDOC=
> >>
> >> +ifeq ($(BR2_arc),y)
> >> +       PERF_MAKE_FLAGS += NO_BACKTRACE=1
> >> +endif
> >> +
> >>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> >>         PERF_DEPENDENCIES += elfutils
> >>  else
> >
> >
> > Could you give more details as to why this is needed?
> > I see no autobuild failures for perf on ARC, so what is the problem here?
> > If this patch is still needed, I think the commit message should be
> > expanded for that.
> >
> > Thanks,
> > Thomas

Anton
