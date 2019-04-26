From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 26 Apr 2019 06:30:54 +0000
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
In-Reply-To: <ea5f11a1-a7cb-4cee-dfda-64d55d550d83@mind.be>
References: <20190418093902.41835-1-abrodkin@synopsys.com>
 <20190418114336.61f3f404@windsurf>
 <ea5f11a1-a7cb-4cee-dfda-64d55d550d83@mind.be>
Message-ID: <CY4PR1201MB01207D3F0C5E488EACEBA5DAA13E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Sunday, April 21, 2019 10:36 AM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Alexey Brodkin <abrodkin@synopsys.com>
> Cc: buildroot at busybox.net; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
> 
> 
> 
> On 18/04/2019 11:43, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Thu, 18 Apr 2019 12:39:02 +0300
> > Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> >
> >> perf uses its own build-system and doesn't respect externally set flags.
> >> Let's force it to use target flags as perf utility is nothing but
> >> an ordinary user-space application.
> >>
> >> This among other things is required to build perf for ARC700 for which
> >> we pass "-matomic" via TARGET_ABI, see [1] for more details.
> >>
> >> [1] https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__patchwork.ozlabs.org_patch_1087471_&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7b
> reS55ytWkhpk5R81I&m=eB4KQfsAGH4782y3faOnCUr3nb3xgbJBuMv3P9P6cxY&s=g7hFDq2PCWQQNFtfEGkCnU8PyqSm-NS-
> FzrkT4QMA8c&e=
> >>
> >> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> >> ---
> >>  package/linux-tools/linux-tool-perf.mk.in | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> >> index 80e00c3c56..e7565773c4 100644
> >> --- a/package/linux-tools/linux-tool-perf.mk.in
> >> +++ b/package/linux-tools/linux-tool-perf.mk.in
> >> @@ -19,6 +19,7 @@ PERF_MAKE_FLAGS = \
> >>  	JOBS=$(PARALLEL_JOBS) \
> >>  	ARCH=$(PERF_ARCH) \
> >>  	DESTDIR=$(TARGET_DIR) \
> >> +	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> >
> > The change is OK, but I believe that if -matomic is really a
> > core/important CFLAGS on ARC, then we should ideally pass it through
> > the toolchain wrapper, so that we are sure it is always passed.
> >
> > Arnout, what do you think?
> 
>  +1.
> 
>  Thomas, last year we made a beginning of deciding what should go through the
> wrapper and what through CFLAGS, but I'm not sure if we ever got to a conclusion?

So are we going to wait for some infrastructure changes or
shall we first fix the problem at hand with broken perf build to ARC700?

-Alexey
