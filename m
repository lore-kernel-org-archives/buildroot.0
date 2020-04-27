From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:31:28 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <20200426192130.GD28666@scaer>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
 <20200426113639.GA5035@scaer>
 <20200426141309.61837b4f@windsurf.home>
 <20200426192130.GD28666@scaer>
Message-ID: <20200427213128.70d9e95f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Apr 2020 21:21:30 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > > Sorry, but this is still not correct: enable mbedtls, then enable uacme
> > > and ualpn: there is no crypto backend selectable in the choice...  
> > Do we need a choice in the first place ?  
> 
> We already have a few packages (libcurl, libssh, libssh2) that have a
> choice for the crypto backend, so why not for uacme?

Are they really needed? Don't we generally try to use automatic
dependencies when possible?

We also have plenty of packages without any choice, for example:

ifeq ($(BR2_PACKAGE_GNUTLS),y)
LIBNICE_CONF_OPTS += --with-crypto-library=gnutls
LIBNICE_DEPENDENCIES += gnutls
else
LIBNICE_CONF_OPTS += \
        --with-crypto-library=openssl \
        --with-openssl=$(STAGING_DIR)/usr
LIBNICE_DEPENDENCIES += openssl
endif

ifeq ($(BR2_PACKAGE_GNUTLS),y)
MSMTP_CONF_OPTS += --with-tls=gnutls
MSMTP_DEPENDENCIES += gnutls
else ifeq ($(BR2_PACKAGE_OPENSSL),y)
MSMTP_CONF_OPTS += --with-tls=openssl
MSMTP_DEPENDENCIES += openssl
else
MSMTP_CONF_OPTS += --with-tls=no
endif

etc, etc.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
