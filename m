From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 22:25:01 +0100
Subject: [Buildroot] [PATCH] qt5: use ccache for building host code
In-Reply-To: <20181104221220.5805582b@gmx.net>
References: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
 <20181104221220.5805582b@gmx.net>
Message-ID: <20181104222501.28e36390@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for looking at this patch!

On Sun, 4 Nov 2018 22:12:20 +0100, Peter Seiderer wrote:

> > +# This allows to use ccache when available
> > +define QT5BASE_CONFIGURE_HOSTCC
> > +	$(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
> > +	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
> > +	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX=$(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
> > +endef
> > +  
> 
> With this sed commands applied, a qmake host compile is always using ccache (same
> behavior already for the cross/target compile?)?

I'm not sure to understand what you mean here. This change ensures that
qmake is built with $(HOSTCC) / $(HOSTCXX) instead of gcc/g++.

HOSTCC is set to "gcc" and HOSTCXX to "g++", except when BR2_CCACHE=y,
in which case HOSTCC is "ccache gcc" and HOSTCXX is "ccache g++".

So basically, this patch ensures that qmake is built with what
Buildroot considers to be the "host compiler", which may or may not
have ccache enabled.

Does this answer your question, or perhaps I misunderstood it
completely ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
