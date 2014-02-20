From: Andrew Barnes <andy@outsideglobe.com>
Date: Thu, 20 Feb 2014 16:49:03 +0000
Subject: [Buildroot] [PATCH 1/1] Updated package download address. Added
	staging option so that applications that depend on rtai's
	headers may be built by buildroot. Re-directed the include
	dir to /usr/include/rtai.
In-Reply-To: <20140220173703.2a8b802b@skate>
References: <1392913567-4146-1-git-send-email-andy@outsideglobe.com>
 <20140220173703.2a8b802b@skate>
Message-ID: <1795639.hLW96TZBfD@eclipse>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thursday 20 February 2014 17:37:03 Thomas Petazzoni wrote:
> Dear Andrew Barnes,
> 
> Thanks for your patch!
> 
> It looks mostly good, except the way the commit log is formatted. As
> explained in
> http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog,
> the format of a git commit log should be:
> 
> =========================================================================
> topic: a brief summary under ~80 characters
> 
> One first paragraph here to explain some things. Notice how it must be
> separated from the commit title by an empty blank line.
> 
> A second paragraph that gives some more details about what is being
> done.
> 
> And yet another paragraph with more explanations.
> 
> Signed-off-by: John Doe <john.doe@buildroot.org>
> =========================================================================
> 
> This way, you can be a bit more verbose as to why the changes are
> necessary.

understood.

> 
> On Thu, 20 Feb 2014 16:26:07 +0000, Andrew Barnes wrote:
> > Signed-off-by: Andrew Barnes <andy@outsideglobe.com>
> > ---
> > 
> >  package/rtai/rtai.mk | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> > index c24fa41..72327b0 100644
> > --- a/package/rtai/rtai.mk
> > +++ b/package/rtai/rtai.mk
> > @@ -6,11 +6,20 @@
> > 
> >  RTAI_VERSION = 3.8.1
> >  RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
> > 
> > -RTAI_SITE    = http://www.rtai.org/RTAI/
> > +RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI/
> > +RTAI_INSTALL_STAGING = YES
> > +
> > +# The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of
> > rtai-config
> I would maybe say "due to the specificities of rtai-config".
> 

understood.

> > +define RTAI_POST_PATCH_FIXUP
> > +	(SED) 's%^staging=.*%staging=$(STAGING_DIR)%'
> > $(STAGING_DIR)/usr/bin/rtai-config +endef
> > +
> > +RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
> > 
> >  RTAI_DEPENDENCIES = linux
> >  
> >  RTAI_CONF_OPT = \
> > 
> > +	--includedir=/usr/include/rtai \
> > 
> >  	--with-linux-dir=$(LINUX_DIR) 	\
> >  	--disable-leds		      	\
> >  	--disable-rtailab		\
> 
> Maybe add a comment above RTAI_CONF_OPT, like:
> 
> # We need to pass a special --includedir here, otherwise RTAI installs
> # its headers in /usr/include, which conflicts with some kernel headers
> # installed in asm-<arch>. Therefore, we tell RTAI to install its
> # headers in a dedicated location.
> 

understood.

> Also, my understanding was that you tested these changes with RTAI 4.0,
> but here your patch is still using RTAI 3.8.1. Did you actually test
> these changes with RTAI 3.8.1 ?
> 
> Thanks!
> 
> Thomas

Technically no. I did it all with 4.0, but we agreed that changing the version 
number should be a separate patch. Although I don't think there would be a 
problem applying the same changes to 3.9 (I am very sure the project 
infrastructure is identical) I do see the need to test this first. I'm not 
quite in a position to test it at the moment.

what are the next steps, do I resubmit with changes in exactly the same way?  
i initially submitted?
