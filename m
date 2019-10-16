From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 23:21:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: select at least one
 protocol
In-Reply-To: <CAFtSRGBYdsgrjBM90Z0Kc59RSKHD-x3xEdT1OjarmFfFO2Av8w@mail.gmail.com>
References: <20191015192303.28397-1-fontaine.fabrice@gmail.com>
 <20191016214115.136c32ca@windsurf.home>
 <CAFtSRGBYdsgrjBM90Z0Kc59RSKHD-x3xEdT1OjarmFfFO2Av8w@mail.gmail.com>
Message-ID: <CAPi7W82BEt0CH2t5ubMeG7QB1CDppJXqPpX_TGJ9soCh+=c5Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le mer. 16 oct. 2019 ? 23:05, Adrien Gallou?t <adrien@gallouet.fr> a ?crit :
>
> Hi,
>
> On Wed, Oct 16, 2019 at 9:41 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > I'd like to have the review of Adrien on this patch. Adrien, could you
> > comment? Also, I have my own comment, see below.
> >
> > On Tue, 15 Oct 2019 21:23:03 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > bird needs at least one protocol so select BGP if no other protocols are
> > > selected as BGP is already the default one
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/0b00948eed9bb8405b70f3f9112ecce99b365f35
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/bird/Config.in | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/package/bird/Config.in b/package/bird/Config.in
> > > index c2951c74c3..3baf43f98e 100644
> > > --- a/package/bird/Config.in
> > > +++ b/package/bird/Config.in
> > > @@ -1,6 +1,11 @@
> > >  config BR2_PACKAGE_BIRD
> > >       bool "bird"
> > >       depends on BR2_USE_MMU # fork()
> > > +     select BR2_PACKAGE_BIRD_BGP if !(BR2_PACKAGE_BIRD_BABEL || \
> > > +             BR2_PACKAGE_BIRD_BFD || BR2_PACKAGE_BIRD_MRT || \
> > > +             BR2_PACKAGE_BIRD_OSPF || BR2_PACKAGE_BIRD_PERF || \
> > > +             BR2_PACKAGE_BIRD_PIPE || BR2_PACKAGE_BIRD_RADV || \
> > > +             BR2_PACKAGE_BIRD_RIP || BR2_PACKAGE_BIRD_STATIC)
> >
> > This is not so nice. Perhaps we could do it like this:
> >
> > config BR2_PACKAGE_BIRD_AT_LEAST_ONE_PROTOCOL
> >         bool
> >
> > config BR2_PACKAGE_BIRD
> >         bool "bird"
> >         ...
> >         select BR2_PACKAGE_BIRD_BGP if !BR2_PACKAGE_BIRD_AT_LEAST_ONE_PROTOCOL
> >
> > if BR2_PACKAGE_BIRD
> >
> > config BR2_PACKAGE_BIRD_BGP
> >         bool "bgp"
> >         select BR2_PACKAGE_BIRD_AT_LEAST_ONE_PROTOCOL
> >
> > ...
> >
> > endif
> >
> > Does this work ?
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> I didn't test the patch yet, but so far I was ok with it.
> I may have missed something but the Kconfig doc is not really clear
> about the correct way to handle this.
>
> I'm still digging to find a clean way to fix all builds, as for
> example --with-protocols=perf will also fail..
> We can fix upstream or add some dependencies (perf alone doesn't make
> really sense).
From my understanding, a lot of (all ?) build failures are linked to
the following error:

bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b
obj/conf/cf-parse obj/conf/cf-parse.y
nest/config.Y:381.20-23: error: symbol LINK is used, but is not
defined as a token and has no rules
  381 |  | dev_proto CHECK LINK bool ';' { DIRECT_CFG->check_link = $4; }
      |                    ^~~~
make[1]: *** [obj/conf/cf-parse.tab.c] Error 1

This error is raised because of the following commit:
https://gitlab.labs.nic.cz/labs/bird/commit/e90dd656cc9126e1fbcc45fb77a10bf1baa2a1b5

This commit assumes that LINK is defined which is not always the case.
After more investigations, it seems that LINK is not defined by BFD,
MRT, PERF, PIPE, RPKI:
https://gitlab.labs.nic.cz/labs/bird/blob/master/proto/bfd/config.Y

So a best patch would be to force the selection of at least babel,
bgp, ospf, radv, rip or static (or fix nest/config.Y)
>
> Regards,
> Adrien
Best Regards,

Fabrice
