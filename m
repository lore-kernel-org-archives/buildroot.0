From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 20:54:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/brltty: explicitly check if
 ioperm is available
In-Reply-To: <87o9mh9w5t.fsf@home.blind.guru>
References: <20171229140641.13882-1-mlang@blind.guru>
 <20171229140641.13882-2-mlang@blind.guru>
 <20171229171959.419ba4ae@windsurf.lan>
 <87o9mh9w5t.fsf@home.blind.guru>
Message-ID: <20171229205455.561578ef@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 20:22:22 +0100, Mario Lang wrote:

> > This seems weird. What happens then when ioperm() is not available ?
> > Which ports_package is used ?  
> 
> "none", which is exactly what we want.  Patch already accepted by upstream.
> The "ports package" is to support Braille displays connected via the
> parallel port, which basically no longer exist these days.  All relevant
> models work via USB, Bluetooth or plain serial ports these days.
> 
> >> -BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> >> +BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
> >>  
> >>  BRLTTY_CONF_OPTS = \
> >>  	--disable-java-bindings \
> >> @@ -24,6 +24,12 @@ BRLTTY_CONF_OPTS = \
> >>  	--without-mikropuhe --without-speechd --without-swift \
> >>  	--without-theta --without-viavoice
> >>  
> >> +define BRLTTY_AUTOCONF
> >> +	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
> >> +endef
> >> +
> >> +BRLTTY_PRE_CONFIGURE_HOOKS += BRLTTY_AUTOCONF  
> >
> > Please use BRLTTY_AUTORECONF = YES instead.  
> 
> brltty doesn't work with autoreconf.  It has its own autogen script,
> which basically does some dependency calculations (with tcl, a dep I'd
> like to avoid) and a plain autoconf.  So I copied that behaviour, since
> autoreconf fails with problems about autoheaders.

OK, thanks for those explanations!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
