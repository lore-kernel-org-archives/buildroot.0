From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 14:59:10 +0100
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: <5642598B.2000509@mind.be>
References: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
 <5642598B.2000509@mind.be>
Message-ID: <20151111145910.795b029f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Hiroshi,

On Tue, 10 Nov 2015 21:54:35 +0100, Arnout Vandecappelle wrote:

> > +define GAUCHE_REMOVE_UNNEEDED
> > +	for i in gauche-config gauche-install gauche-package ; do \
> > +		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> > +		rm -f $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/$(GNU_TARGET_NAME)/$$i ; \
> > +	done
> > +	for i in gencomp genstub precomp ; do \
> > +		rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/lib/$$i ; \
> > +	done
> > +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/aclocal.m4
> > +	rm -f $(TARGET_DIR)/usr/share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/template.*
> > +	rm -fr $(TARGET_DIR)/usr/lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/include
> 
>  This cleanup is quite complicated and I wonder if it is really worth it. For
> space, the impact is really small compared to the 3MB of libs and .scm files
> installed by the package. Even the ones in /usr/bin I'm not sure if it's worth
> to remove them.
> 
>  Thomas, what do you think?

I also think it is quite noisy, at least the way it is written. However
I like to have on the target only what's needed.

Hiroshi, do we really need to be so fine-grained when removing things?

Maybe we could do:

GAUCHE_FILES_TO_CLEANUP = \
	$(foreach p,gauche-config gauche-install gauche-package,\
		bin/$(p) lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/$(GNU_TARGET_NAME)/$(p)) \
	$(foreach p,gencomp genstub precomp,\
		share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/lib/$(p)) \
	share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/aclocal.m4 \
	share/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/template.* \
	lib/gauche-$(GAUCHE_VERSION_MAJOR)/$(GAUCHE_VERSION)/include

And then use that variable:

	$(foreach p,$(GAUCHE_FILES_TO_CLEANUP),\
		$(RM) -rf $(TARGET_DIR)/usr/$(p)$(sep))

But it's not significantly better :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
