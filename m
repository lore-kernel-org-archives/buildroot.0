From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Dec 2012 12:21:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
References: <cover.1356343037.git.yann.morin.1998@free.fr>
 <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
Message-ID: <20121227122130.38818d23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 24 Dec 2012 11:00:59 +0100, Yann E. MORIN wrote:

> +#----------------------------------------------------------------------------
> +# tvheadend is a little smuggler and thief! ;-)
> +# During the ./configure, it downloads some files from the dvb-apps
> +# package, so it has a list of pre-scanned tunner configurations.
> +# For buildroot that has a few-unfortunate consequences:
> +#  - the network may not be availabe at the time of build, if the
> +#    user pre-downloaded the sources with 'make source'
> +# So, here's what we do:
> +#  - after the main archive download, we do download those files
> +#  - after extract, we extract the required files
> +
> +TVHEADEND_DVBSCANS_VERSION  = 3fc7dfa68484
> +TVHEADEND_DVBSCANS_SITE     = http://linuxtv.org/hg/dvb-apps/archive/
> +TVHEADEND_DVBSCANS_DIR      = dvb-apps-$(TVHEADEND_DVBSCANS_VERSION)
> +TVHEADEND_DVBSCANS_SOURCE   = $(TVHEADEND_DVBSCANS_DIR).tar.bz2
> +
> +define TVHEADEND_DOWNLOAD_DVBSCANS
> +	$(call DOWNLOAD_WGET,$(TVHEADEND_DVBSCANS_SITE)/$(TVHEADEND_DVBSCANS_VERSION).tar.bz2,$(TVHEADEND_DVBSCANS_SOURCE))
> +endef
> +TVHEADEND_POST_DOWNLOAD_HOOKS        = TVHEADEND_DOWNLOAD_DVBSCANS
> +
> +define TVHEADEND_EXTRACT_DVBSCANS
> +	mkdir -p $(@D)/data/dvb-scan
> +	$(INFLATE.bz2) $(DL_DIR)/$(TVHEADEND_DVBSCANS_SOURCE)      |\
> +	$(TAR) $(TAR_STRIP_COMPONENTS)=3 -C $(@D)/data/dvb-scan     \
> +	       $(TAR_OPTIONS) -                                     \
> +	       $(TVHEADEND_DVBSCANS_DIR)/util/scan/{atsc,dvb-{c,s,t}}
> +endef
> +TVHEADEND_POST_EXTRACT_HOOKS         = TVHEADEND_EXTRACT_DVBSCANS

I think this part should be moved to a separate package, say
"dvb-apps", on which tvheadend would depend. It can install its stuff
in $(STAGING_DIR), for example, and then you can symlink
$(@D)/data/dvb-scan of tvheadend to the right directory in
$(STAGING_DIR), or better, modify a bit tvheadend so that it can take
an argument specifying where the dvb-data is to be found.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
