From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 12 Nov 2013 16:41:03 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <20131112225456.6012af43@skate>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <20131112225456.6012af43@skate>
Message-ID: <OF8F54CE46.FDE4E917-ON86257C21.007B8DFD-86257C21.007C9BCB@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/12/2013 
03:54:56 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 11/12/2013 03:55 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
> 
> Dear Matt Weber,
> 
> On Tue, 12 Nov 2013 14:31:45 -0600, Matt Weber wrote:
> > 
> > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> > ---
> >  package/omniorb/Config.in  |    9 +++++++++
> >  package/omniorb/omniorb.mk |    8 ++++++++
> >  2 files changed, 17 insertions(+), 0 deletions(-)
> > 
> > diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
> > index 6326688..22527fc 100644
> > --- a/package/omniorb/Config.in
> > +++ b/package/omniorb/Config.in
> > @@ -10,5 +10,14 @@ config BR2_PACKAGE_OMNIORB
> > 
> >       http://omniorb.sourceforge.net/
> > 
> > +if BR2_PACKAGE_OMNIORB
> > +
> > +config BR2_PACKAGE_OMNIORB_WITH_SERVICES
> > +        bool "COS Naming Service"
> > +        default y
> > +        help
> > +          omniORB COS Naming Service
> 
> Use tab for indentation (and one tab + two spaces for the help text).

Ack

> 
> > +define OMNIORB_ENABLE_SERVICES
> > +   $(SED) 's:SUBDIRS += lib:SUBDIRS += lib services:g' 
$(@D)/src/dir.mk
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_OMNIORB_WITH_SERVICES),y)
> > +   OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ENABLE_SERVICES
> > +endif
> 
> This is kind of weird, because the "services" directory is built in
> some condition:
> 
> ifndef EmbeddedSystem
> SUBDIRS += appl services
> endif
> 
> but you define EmbeddedSystem=1 in Buildroot:
> 
> echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
> 
> Is there a reason for defining EmbeddedSystem=1 ? The only difference
> will be that it's going to build the stuff in src/appl/, but looking at
> this directory, it doesn't seem like a huge amount of code compared to
> the overall size of omniORB.

Yeah, the EmbeddedSystems option trims down the build and doesn't build 
a bunch of host tools, extra libs, and apps that aren't required on the 
target. 
So for majority of the configuration it seems like the best option (used 
to trim
down src/, src/lib, src/lib/omniORB).  It also removed the example apps 
that 
don't cross-compile... 
So to add this option we just added back in the COS Naming service 
as an option instead of doing a complete build to get the app/lib.

Thanks,
Matt 
mlweber1 at rockwellcollins.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/8f17f651/attachment.html>
