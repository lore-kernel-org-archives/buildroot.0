From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Dec 2012 23:26:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 24 Dec 2012 11:00:59 +0100")
References: <cover.1356343037.git.yann.morin.1998@free.fr>
 <cover.1356343037.git.yann.morin.1998@free.fr>
 <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
Message-ID: <87d2xw78m1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/Config.in                   |    1 +
 Yann>  package/tvheadend/Config.in         |   20 +++++++++
 Yann>  package/tvheadend/tvheadend.config  |   13 ++++++
 Yann>  package/tvheadend/tvheadend.default |    6 +++
 Yann>  package/tvheadend/tvheadend.init    |   54 +++++++++++++++++++++++++
 Yann>  package/tvheadend/tvheadend.mk      |   76 +++++++++++++++++++++++++++++++++++
 Yann>  package/tvheadend/tvheadend.mkuser  |   52 ++++++++++++++++++++++++
 Yann>  7 files changed, 222 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/tvheadend/Config.in
 Yann>  create mode 100644 package/tvheadend/tvheadend.config
 Yann>  create mode 100644 package/tvheadend/tvheadend.default
 Yann>  create mode 100644 package/tvheadend/tvheadend.init
 Yann>  create mode 100644 package/tvheadend/tvheadend.mk
 Yann>  create mode 100755 package/tvheadend/tvheadend.mkuser

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index 3d556b2..bcf0009 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -682,6 +682,7 @@ source "package/tinyhttpd/Config.in"
 Yann>  source "package/tn5250/Config.in"
 Yann>  source "package/transmission/Config.in"
 Yann>  source "package/ttcp/Config.in"
 Yann> +source "package/tvheadend/Config.in"
 Yann>  source "package/udpcast/Config.in"
 Yann>  source "package/ulogd/Config.in"
 Yann>  source "package/ushare/Config.in"
 Yann> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..679ca13
 Yann> --- /dev/null
 Yann> +++ b/package/tvheadend/Config.in
 Yann> @@ -0,0 +1,20 @@
 Yann> +comment "tvheadend requires a toolchain with WCHAR"

We normally add ' support' - E.G. WCHAR support.

It also needs largefile support unless you override CFLAGS in the
Makefile:

Makefile:CFLAGS  += -D_FILE_OFFSET_BITS=64


 Yann> +++ b/package/tvheadend/tvheadend.default
 Yann> @@ -0,0 +1,6 @@
 Yann> +TVH_USER=tvheadend
 Yann> +TVH_GROUP=tvheadend
 Yann> +#TVH_ADAPTERS=
 Yann> +#TVH_HTTP_PORT=9981
 Yann> +#TVH_HTSP_PORT=9982
 Yann> +#TVH_DEBUG=1
 Yann> diff --git a/package/tvheadend/tvheadend.init b/package/tvheadend/tvheadend.init
 Yann> new file mode 100644
 Yann> index 0000000..b05ec81
 Yann> --- /dev/null
 Yann> +++ b/package/tvheadend/tvheadend.init
 Yann> @@ -0,0 +1,54 @@
 Yann> +#! /bin/sh
 Yann> +# Startup script inspired by the one in the package

It would be good to mention 'tvheadend' here.


 Yann> +++ b/package/tvheadend/tvheadend.mk
 Yann> @@ -0,0 +1,76 @@
 Yann> +#############################################################
 Yann> +#
 Yann> +# tvheadend
 Yann> +#
 Yann> +##############################################################
 Yann> +
 Yann> +TVHEADEND_VERSION           = v3.3
 Yann> +TVHEADEND_SITE              = http://github.com/tvheadend/tvheadend/tarball/$(TVHEADEND_VERSION)
 Yann> +TVHEADEND_LICENSE           = GPLv3+
 Yann> +TVHEADEND_LICENSE_FILES     = LICENSE
 Yann> +TVHEADEND_DEPENDENCIES      = host-pkgconf openssl python
 Yann> +
 Yann> +ifeq ($(BR2_PACKAGE_AVAHI),y)
 Yann> +TVHEADEND_DEPENDENCIES     += avahi
 Yann> +endif
 Yann> +
 Yann> +#----------------------------------------------------------------------------
 Yann> +# tvheadend is a little smuggler and thief! ;-)
 Yann> +# During the ./configure, it downloads some files from the dvb-apps
 Yann> +# package, so it has a list of pre-scanned tunner configurations.
 Yann> +# For buildroot that has a few-unfortunate consequences:
 Yann> +#  - the network may not be availabe at the time of build, if the
 Yann> +#    user pre-downloaded the sources with 'make source'
 Yann> +# So, here's what we do:
 Yann> +#  - after the main archive download, we do download those files
 Yann> +#  - after extract, we extract the required files
 Yann> +
 Yann> +TVHEADEND_DVBSCANS_VERSION  = 3fc7dfa68484
 Yann> +TVHEADEND_DVBSCANS_SITE     = http://linuxtv.org/hg/dvb-apps/archive/
 Yann> +TVHEADEND_DVBSCANS_DIR      = dvb-apps-$(TVHEADEND_DVBSCANS_VERSION)
 Yann> +TVHEADEND_DVBSCANS_SOURCE   = $(TVHEADEND_DVBSCANS_DIR).tar.bz2
 Yann> +
 Yann> +define TVHEADEND_DOWNLOAD_DVBSCANS
 Yann> +	$(call DOWNLOAD_WGET,$(TVHEADEND_DVBSCANS_SITE)/$(TVHEADEND_DVBSCANS_VERSION).tar.bz2,$(TVHEADEND_DVBSCANS_SOURCE))
 Yann> +endef
 Yann> +TVHEADEND_POST_DOWNLOAD_HOOKS        = TVHEADEND_DOWNLOAD_DVBSCANS
 Yann> +
 Yann> +define TVHEADEND_EXTRACT_DVBSCANS
 Yann> +	mkdir -p $(@D)/data/dvb-scan
 Yann> +	$(INFLATE.bz2) $(DL_DIR)/$(TVHEADEND_DVBSCANS_SOURCE)      |\
 Yann> +	$(TAR) $(TAR_STRIP_COMPONENTS)=3 -C $(@D)/data/dvb-scan     \
 Yann> +	       $(TAR_OPTIONS) -                                     \
 Yann> +	       $(TVHEADEND_DVBSCANS_DIR)/util/scan/{atsc,dvb-{c,s,t}}
 Yann> +endef
 Yann> +TVHEADEND_POST_EXTRACT_HOOKS         = TVHEADEND_EXTRACT_DVBSCANS
 Yann> +
 Yann> +#----------------------------------------------------------------------------
 Yann> +# To run tvheadend, we need:
 Yann> +#  - a non-root user to be safe, with its owned ${HOME}
 Yann> +#  - a startup script, and its config file
 Yann> +#  - a default DB with a tvheadend admin
 Yann> +TVHEADEND_MKUSER = TARGET_DIR=$(TARGET_DIR) INSTALL=$(INSTALL) package/tvheadend/tvheadend.mkuser
 Yann> +define TVHEADEND_CREATE_USER
 Yann> +	$(TVHEADEND_MKUSER) mk_user
 Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.config  $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 Yann> +endef
 Yann> +TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_CREATE_USER
 Yann> +
 Yann> +define TVHEADEND_PERMISSIONS
 Yann> +	/home/tvheadend                                d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
 Yann> +	/home/tvheadend/.hts                           d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
 Yann> +	/home/tvheadend/.hts/tvheadend                 d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
 Yann> +	/home/tvheadend/.hts/tvheadend/accesscontrol   d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
 Yann> +	/home/tvheadend/.hts/tvheadend/accesscontrol/1 f 0600 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
 Yann> +endef

I'm not really happy about the user handling here. I think we should
either just add a static tvheadend user to system/skeleton/etc/passwd
like we've done for ssh/hal/dbus/.., or come up with some generic
infrastructure to handle it per package (like _PERMISSIONS) instead of
something tvheadend specific.

We also normally don't touch /home. Can't tvheadend run as system daemon
(still as a seperate user) instead?

 Yann> +
 Yann> +define TVHEADEND_INSTALL_SYSV_STARTUP_FILES
 Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.default $(TARGET_DIR)/etc/default/tvheadend
 Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.init    $(TARGET_DIR)/etc/init.d/S99tvheadend

I personally prefer to keep the same names both in package/ and
output/target (so S99tvheadend). Makes it easier to find the
corresponding source files.

-- 
Bye, Peter Korsgaard
