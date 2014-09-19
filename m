From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 20 Sep 2014 00:49:53 +0200
Subject: [Buildroot] [PATCH] nsd: new package
In-Reply-To: <20140916224820.7cc2d38b@free-electrons.com>
References: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140916224820.7cc2d38b@free-electrons.com>
Message-ID: <20140919224952.GC19421@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Tue, Sep 16, 2014 at 10:48:20PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 15 Sep 2014 22:46:21 +0200, Eric Le Bihan wrote:
> > This package provides NSD, an authoritative only, high performance,
> > simple and open source name server.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> This looks good. Just a few questions below, not really critical.
>
> > +NSD_VERSION = 4.0.3
>
> There is a new version that has been released 4.1.0. Though I don't
> mind seeing the 4.0.3 being packaged in Buildroot for now, and then
> later if you have the time, a bump to 4.1.0.

I'll go for 4.1.0!

>
> > +NSD_SITE = http://www.nlnetlabs.nl/downloads/nsd/
> > +NSD_LICENSE = BSD-3c
> > +NSD_LICENSE_FILES = LICENSE
> > +
> > +NSD_DEPENDENCIES = libevent openssl
> > +
> > +NSD_CONF_OPT = \
> > +	--prefix=/ \
> > +	--datarootdir=/usr/share
>
> This is fairly unusual, especially the --prefix=/, so having a comment
> above would be useful.

If --prefix was set to /usr, the program was looking for stuff in
/usr/var/db. But this can be removed if using --with-dbfile and --datarootdir.

> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +NSD_CONF_OPT += --with-pidfile=/run/nsd/nsd.pid
> > +endif
>
> Ok, so for systemd the pidfile location is defined at compile time, but
> for sysv/busybox init, it's passed through the init script.

For SysV/Busybox, I'll use --with-pidfile=/var/run/nsd.pid and adapt the
script.

> > +define NSD_REMOVE_SAMPLE_CONF
> > +	$(RM) $(TARGET_DIR)/etc/nsd/nsd.conf.sample
> > +endef
> > +
> > +NSD_POST_INSTALL_TARGET_HOOKS += NSD_REMOVE_SAMPLE_CONF
>
> Is there a non sample file installed?

No, but I'll provide a minimal default configuration file.

> Also, when build testing, I faced an issue:
>
> checking for libevent... configure: error: Cannot find the libevent library.
> You can restart ./configure --with-libevent=no to use a builtin alternative.
> make: *** [/home/thomas/projets/buildroot/output/build/nsd-4.0.3/.stamp_configured] Erreur 1
>
> Configuration used is:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_NSD=y
>
> I see libevent being built. The config.log of nsd contains:
>
> configure:5427: checking for libevent
> configure:5453: error: Cannot find the libevent library.
> You can restart ./configure --with-libevent=no to use a builtin alternative.
>
> The same happens with OpenSSL:
>
> checking for SSL... configure: error: Cannot find the SSL libraries in /usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/sfw /usr/local /usr
>
> You probably need to pass --with-{libevent,ssl}=/some/path, but I
> haven't figured out which path (I haven't looked too much, only tested
> $(STAGING_DIR) and $(STAGING_DIR)/usr/lib).

And the correct answer is... --with-libevent=$(STAGING_DIR)/usr!

> Also, your package makes openssl and libevent mandatory dependencies of
> nsd, which is not the case: you can pass --with-libevent=no and
> --with-ssl=no and you can build without those dependencies. This is
> something we should support to allow building a more lightweight
> version of nsd.

I make libevent and openssl optional dependencies.

Thanks for the review!

Best regards,
ELB
