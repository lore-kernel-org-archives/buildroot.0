From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Oct 2019 20:48:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: fix build without babel,
 bgp, ospf, radv, rip or static
In-Reply-To: <20191025202305.7bf3ee33@windsurf.dhcp.lyon.intranet>
References: <20191019083404.20638-1-fontaine.fabrice@gmail.com>
 <20191025202305.7bf3ee33@windsurf.dhcp.lyon.intranet>
Message-ID: <CAPi7W82nDKwZ6eFJqq_4YTUMvoEvffKNSDAck8SuMadi5om0Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le ven. 25 oct. 2019 ? 20:23, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Adrien,
>
> On Sat, 19 Oct 2019 10:34:04 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/0b00948eed9bb8405b70f3f9112ecce99b365f35
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Adrien, do you have some feedback on the below patch from Fabrice
> fixing build issues in bird ?
For information, I submitted this patch and it was merged a few days ago:
https://gitlab.labs.nic.cz/labs/bird/commit/f9eb9b4cab65b850c61738dd56632bae0e7329ca
I can send a v2 if needed.
>
> Thanks!
>
> Thomas
>
> > ---
> >  ...x-build-without-babel-bgp-ospf-radv-.patch | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 package/bird/0001-nest-config.Y-fix-build-without-babel-bgp-ospf-radv-.patch
> >
> > diff --git a/package/bird/0001-nest-config.Y-fix-build-without-babel-bgp-ospf-radv-.patch b/package/bird/0001-nest-config.Y-fix-build-without-babel-bgp-ospf-radv-.patch
> > new file mode 100644
> > index 0000000000..d27b87ca3f
> > --- /dev/null
> > +++ b/package/bird/0001-nest-config.Y-fix-build-without-babel-bgp-ospf-radv-.patch
> > @@ -0,0 +1,47 @@
> > +From 16d4ba934e4e7458d9437f45faef5774c358e979 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sat, 19 Oct 2019 10:16:23 +0200
> > +Subject: [PATCH] nest/config.Y: fix build without babel, bgp, ospf, radv, rip
> > + or static
> > +
> > +Build without babel, bgp, ospf, radv, rip or static fails on:
> > +
> > +bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b
> > +obj/conf/cf-parse obj/conf/cf-parse.y
> > +nest/config.Y:381.20-23: error: symbol LINK is used, but is not
> > +defined as a token and has no rules
> > +  381 |  | dev_proto CHECK LINK bool ';' { DIRECT_CFG->check_link = $4; }
> > +      |                    ^~~~
> > +make[1]: *** [obj/conf/cf-parse.tab.c] Error 1
> > +
> > +This error is raised because of the following commit:
> > +https://gitlab.labs.nic.cz/labs/bird/commit/e90dd656cc9126e1fbcc45fb77a10bf1baa2a1b5
> > +
> > +This commit assumes that LINK is defined which is not always the case.
> > +Indeed, it seems that LINK is not defined by BFD, MRT, PERF, PIPE, RPKI
> > +
> > +To fix this issue, add CF_KEYWORDS(LINK) in nest/config.py
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/0b00948eed9bb8405b70f3f9112ecce99b365f35
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + nest/config.Y | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/nest/config.Y b/nest/config.Y
> > +index c62501a3..44f392dd 100644
> > +--- a/nest/config.Y
> > ++++ b/nest/config.Y
> > +@@ -75,6 +75,7 @@ CF_KEYWORDS(BGP, PASSWORDS, DESCRIPTION, SORTED)
> > + CF_KEYWORDS(RELOAD, IN, OUT, MRTDUMP, MESSAGES, RESTRICT, MEMORY, IGP_METRIC, CLASS, DSCP)
> > + CF_KEYWORDS(TIMEFORMAT, ISO, SHORT, LONG, ROUTE, PROTOCOL, BASE, LOG, S, MS, US)
> > + CF_KEYWORDS(GRACEFUL, RESTART, WAIT, MAX, FLUSH, AS)
> > ++CF_KEYWORDS(LINK)
> > +
> > + /* For r_args_channel */
> > + CF_KEYWORDS(IPV4, IPV4_MC, IPV4_MPLS, IPV6, IPV6_MC, IPV6_MPLS, IPV6_SADR, VPN4, VPN4_MC, VPN4_MPLS, VPN6, VPN6_MC, VPN6_MPLS, ROA4, ROA6, FLOW4, FLOW6, MPLS, PRI, SEC)
> > +--
> > +2.23.0
> > +
>
>
>
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
