From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Dec 2012 12:41:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <20121227122130.38818d23@skate>
References: <cover.1356343037.git.yann.morin.1998@free.fr>
 <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
 <20121227122130.38818d23@skate>
Message-ID: <201212271241.42743.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 27 December 2012 Thomas Petazzoni wrote:
> On Mon, 24 Dec 2012 11:00:59 +0100, Yann E. MORIN wrote:
> > +#----------------------------------------------------------------------------
> > +# tvheadend is a little smuggler and thief! ;-)
> > +# During the ./configure, it downloads some files from the dvb-apps
> > +# package, so it has a list of pre-scanned tunner configurations.
> > +# For buildroot that has a few-unfortunate consequences:
> > +#  - the network may not be availabe at the time of build, if the
> > +#    user pre-downloaded the sources with 'make source'
> > +# So, here's what we do:
> > +#  - after the main archive download, we do download those files
> > +#  - after extract, we extract the required files
> > +
> > +TVHEADEND_DVBSCANS_VERSION  = 3fc7dfa68484
> > +TVHEADEND_DVBSCANS_SITE     = http://linuxtv.org/hg/dvb-apps/archive/
> > +TVHEADEND_DVBSCANS_DIR      = dvb-apps-$(TVHEADEND_DVBSCANS_VERSION)
> > +TVHEADEND_DVBSCANS_SOURCE   = $(TVHEADEND_DVBSCANS_DIR).tar.bz2
> > +
> > +define TVHEADEND_DOWNLOAD_DVBSCANS
> > +	$(call DOWNLOAD_WGET,$(TVHEADEND_DVBSCANS_SITE)/$(TVHEADEND_DVBSCANS_VERSION).tar.bz2,$(TVHEADEND_DVBSCANS_SOURCE))
> > +endef
> > +TVHEADEND_POST_DOWNLOAD_HOOKS        = TVHEADEND_DOWNLOAD_DVBSCANS
> > +
> > +define TVHEADEND_EXTRACT_DVBSCANS
> > +	mkdir -p $(@D)/data/dvb-scan
> > +	$(INFLATE.bz2) $(DL_DIR)/$(TVHEADEND_DVBSCANS_SOURCE)      |\
> > +	$(TAR) $(TAR_STRIP_COMPONENTS)=3 -C $(@D)/data/dvb-scan     \
> > +	       $(TAR_OPTIONS) -                                     \
> > +	       $(TVHEADEND_DVBSCANS_DIR)/util/scan/{atsc,dvb-{c,s,t}}
> > +endef
> > +TVHEADEND_POST_EXTRACT_HOOKS         = TVHEADEND_EXTRACT_DVBSCANS
> 
> I think this part should be moved to a separate package, say
> "dvb-apps", on which tvheadend would depend. It can install its stuff
> in $(STAGING_DIR), for example, and then you can symlink
> $(@D)/data/dvb-scan of tvheadend to the right directory in
> $(STAGING_DIR), or better, modify a bit tvheadend so that it can take
> an argument specifying where the dvb-data is to be found.

I knew this would raise eyebrows.
I'll see what I can come up with...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
