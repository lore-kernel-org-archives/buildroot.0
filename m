From: Koen Martens <gmc@sonologic.nl>
Date: Mon, 19 Jun 2017 21:51:18 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxconsoletools: new package
In-Reply-To: <20170619214458.7fe41175@windsurf.home>
References: <201706191656.v5JGuLc9093352@mx1.sonologic.net>
 <20170619214458.7fe41175@windsurf.home>
Message-ID: <20170619195117.GA31831@sunra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks, also for the small corrections. I must've missed a few things.
This was my first attempt at contributing, from which I've learned quite
a lot. So hopefully, I'll be able to contribute some more things in the
near future and get it right the first time. It'll mostly be in the
category 'old and ancient', given the kind of ancient hardware I'm
currently working on :)

- Koen

On Mon, Jun 19, 2017 at 09:44:58PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 19 Jun 2017 18:55:06 +0200, Koen Martens wrote:
> > Linuxconsoletools contains the inputattach utility
> > to attach legacy serial devices to the Linux kernel
> > input layer and joystick utilities to calibrate and
> > test joysticks and joypads.
> > 
> > The buildroot package adds options to build only certain
> > tools.
> > 
> > website: http://sf.net/projects/linuxconsole/
> > 
> > Signed-off-by: Koen Martens <gmc@sonologic.nl>
> 
> Thanks, I've applied, after doing a few minor tweaks. See below.
> 
> > diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
> > new file mode 100644
> > index 0000000..08a4af3
> > --- /dev/null
> > +++ b/package/linuxconsoletools/Config.in
> > @@ -0,0 +1,34 @@
> > +config BR2_PACKAGE_LINUXCONSOLETOOLS
> > +	bool "linuxconsoletools"
> > +	default n
> 
> There was still a useless "default n" here, so I've dropped.
> 
> > +	help
> > +	  Linuxconsoletools contains the inputattach utility
> > +	  to attach legacy serial devices to the Linux kernel
> > +	  input layer and joystick utilities to calibrate and
> > +	  test joysticks and joypads.
> > +	  
> 
> There was a trailing tab character on this line, which I dropped.
> 
> > +	  http://sf.net/projects/linuxconsole/
> > +ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
> > +LINUXCONSOLETOOLS_MAKE_OPTS += ENABLE_FORCEFEEDBACK=1
> > +LINUXCONSOLETOOLS_MAKE_OPTS += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
> 
> I've put these in a single assignment:
> 
> +LINUXCONSOLETOOLS_MAKE_OPTS += \
> +       ENABLE_FORCEFEEDBACK=1 \
> +       SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
> 
> 
> > +LINUXCONSOLETOOLS_DEPENDENCIES += sdl
> > +endif
> > +
> > +LINUXCONSOLETOOLS_MAKE_OPTS += CC=$(TARGET_CC)
> > +LINUXCONSOLETOOLS_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS)"
> 
> Both of those lines are not needed: CC and CFLAGS are already part of
> $(TARGET_CONFIGURE_OPTS), which you pass in the build and install
> commands.
> 
> Committed with those minor issues fixed. Thanks a lot for this
> contribution!
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
