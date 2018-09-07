From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 7 Sep 2018 14:03:49 +0200
Subject: [Buildroot] ADEOS patch and kernel override
In-Reply-To: <20180907133121.29434851@windsurf.home>
References: <CAOf5uwmrFw_fKozkMn+5gVoehBig8g2PhE-ivg0GSv+PNcHfsA@mail.gmail.com>
 <20180907133121.29434851@windsurf.home>
Message-ID: <CAOf5uwnMCSK=NHTK3ewcKXOyF5ZfeCDx7cnTENOi9SYM2ztA-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Fri, Sep 7, 2018 at 1:31 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Michael,
>
> On Fri, 7 Sep 2018 12:44:43 +0200, Michael Nazzareno Trimarchi wrote:
>
> > I'm trying to understand if I can override the kernel and let apply
> > the adeos patch on top of it. Seems that PREHOOK is not called
> > in the linux kernel override directory. Is there some semantic to use?
>
> When you said "override the kernel", I will assume you talking about
> using LINUX_OVERRIDE_SRCDIR. If that is the case, then no, Buildroot
> will not patch it for you.
>
> Let me give a few more details about this, and explain why it is done
> like this.
>
> In a normal situation (i.e without OVERRIDE_SRCDIR), a package goes
> through the following steps:
>
>  (1) download
>  (2) extract
>  (3) patch
>  (4) configure
>  (5) build
>  (6) install
>
> When you switch to using OVERRIDE_SRCDIR for that package, the first
> three steps are skipped and replaced by a "rsync" step, while the three
> last steps remain the same:
>
>  (1) rsync
>  (2) configure
>  (3) build
>  (4) install
>
> The reason is that if you do an override source directory:
>
>  * Buildroot has no idea what is the state of the source code in here,
>    so it has no idea if the patches it has will apply. Most likely not.
>
>  * More importantly, it means that you own/control the source code,
>    so you can simply apply whatever changes are needed on the source
>    code located in the OVERRIDE_SRCDIR location.
>
> Does that help ?
>
Thomas is perfect description and I can see from the Makefile and make
sense. So patch should be done as a script over the kernel override. I
will proceed this way

Michael

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
