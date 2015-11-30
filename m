From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Mon, 30 Nov 2015 21:32:29 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: Your message of Sun, 29 Nov 2015 21:35:56 +0100.
 <20151129203556.GJ3630@free.fr>
Message-ID: <201511301232.tAUCWTLU006812@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann.

Thank you for your comment.

Building of gauche is based on autotools, so installation process
is embedded in it. I think this (in my patch) method will be more
straightforward and comprehensive way rather than tweeking configure.ac
or something like that.
What do you think ?

Regards,
Kawashima

"Yann E. MORIN" writes:
> Hiroshi, All,
> 
> On 2015-11-10 18:22 +0900, Hiroshi Kawashima spake thusly:
> > Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> > ---
> > diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> > index b887c6a..8406774 100644
> > --- a/package/gauche/gauche.mk
> > +++ b/package/gauche/gauche.mk
> > @@ -4,7 +4,8 @@
> >  #
> >  ##########################################################################
> ######
> >  
> > -GAUCHE_VERSION = 0.9.4
> > +GAUCHE_VERSION_MAJOR = 0.9
> > +GAUCHE_VERSION = $(GAUCHE_VERSION_MAJOR).4
> >  GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
> >  GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
> >  GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
> > @@ -23,10 +24,24 @@ endif
> >  # Detection of c99 support in configure fails without WCHAR. To enable
> >  # automatic detection of c99 support by configure, we need to enable
> >  # WCHAR in toolchain. But actually we do not need WCHAR at gauche
> > -# runtime. So reuesting WCHAR in toolchain just for automatic detection
> > +# runtime. So requesting WCHAR in toolchain just for automatic detection
> >  # will be overkill. To solve this, explicitly -std=gnu99 is specified
> >  # here.
> >  GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> >  
> > +define GAUCHE_REMOVE_UNNEEDED
> > +	for i in gauche-config gauche-install gauche-package ; do \
> > +		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> > +		rm -f $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GA
> UCHE_VERSION)/$(GNU_TARGET_NAME)/$$i ; \
> > +	done
> > +	for i in gencomp genstub precomp ; do \
> > +		rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(
> GAUCHE_VERSION)/lib/$$i ; \
> > +	done
> > +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_V
> ERSION)/aclocal.m4
> > +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_V
> ERSION)/template.*
> > +	rm -fr $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VE
> RSION)/include
> > +endef
> > +GAUCHE_POST_INSTALL_TARGET_HOOKS += GAUCHE_REMOVE_UNNEEDED
> 
> There's been some discussion around that patch, sorry for chiming in so
> late...
> 
> Rather than remove what is not wanted, why not just install what is
> required? If the number of actions to install is smaller than what we
> try to remove, then maybe it is better.
> 
> What's your opinon? Do you think that it's achievable?
> 
> Regards,
> Yann E. MORIN.
> 
> >  $(eval $(host-autotools-package))
> >  $(eval $(autotools-package))
============================================================
    Hiroshi Kawashima
