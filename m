From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 16:30:37 -0500
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <52322C8E.7010501@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
 <52322C8E.7010501@mind.be>
Message-ID: <OFD093CE04.A9291FB9-ON86257BE4.007504CF-86257BE4.00762929@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 09/12/2013 04:05:18 PM:

> On 11/09/13 04:03, rjbarnet at rockwellcollins.com wrote:
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> > 09/08/2013 08:15:28 AM:
> >
> >  >
> >  > Signed-off-by: Thomas Petazzoni 
<thomas.petazzoni@free-electrons.com>
> >  > ---
> >  >  Config.in   |  6 ++++--
> >  >  Makefile    | 29 +++++++++++++++++++++++++----
> >  >  docs/manual/manual.mk |  2 +-
> >
> > One idea that I have, is for the make file that is genreated for the 
an
> > external output directory, if we could preserve the the value of
> > BR2_EXTERNAL
> > as follows.
> 
>   Thomas's patch already does that, because BR2_EXTERNAL is stored in 
the 
> config file.
> 

I don't believe it gets stored in the config since Config.in pulls
the variable in from the shell's or make's environment. 

+config BR2_EXTERNAL
+       string
+       option env="BR2_EXTERNAL"

In order to utilize the BR2_EXTERNAL feature I must have BR2_EXTERNAL
either exported into my environment or be called as 

'make BR2_EXTERNAL=/some/path <target>'


When utilizing the BR2_EXTERNAL I usual want to use some defconfig from
my BR2_EXTERNAL so it adding it the makefile that is generated in your 
build directory when specifying O= would be extermely useful as that 
way I can switch shells and my definition of BR2_EXTERNAL would still 
be present.

'make O=/build/path BR2_EXTERNAL=/path/to/external defconfig'

> > I don't think my logic is fully there but there is more of a
> > sudo implementation:
> >
> > diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> > --- a/support/scripts/mkmakefile
> > +++ b/support/scripts/mkmakefile
> > @@ -27,6 +27,7 @@ makedir := \$(dir \$(call 
lastword,\$(MAKEFILE_LIST)))
> >
> >   MAKEARGS := -C $1
> >   MAKEARGS += O=\$(if \$(patsubst
> > /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$(makedir))
> > +MAKEARGS += BR2_EXTERNAL=\$(realpath \$(BR2_EXTERNAL))
> >
> >   MAKEFLAGS += --no-print-directory
> >
> > Again this is only a suggestion but otherwise I'll ack the patchset.
> >

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/e06f840b/attachment.html>
