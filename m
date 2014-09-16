From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 22:48:20 +0200
Subject: [Buildroot] [PATCH] nsd: new package
In-Reply-To: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140916224820.7cc2d38b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 15 Sep 2014 22:46:21 +0200, Eric Le Bihan wrote:
> This package provides NSD, an authoritative only, high performance,
> simple and open source name server.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

This looks good. Just a few questions below, not really critical.

> +NSD_VERSION = 4.0.3

There is a new version that has been released 4.1.0. Though I don't
mind seeing the 4.0.3 being packaged in Buildroot for now, and then
later if you have the time, a bump to 4.1.0.

> +NSD_SITE = http://www.nlnetlabs.nl/downloads/nsd/
> +NSD_LICENSE = BSD-3c
> +NSD_LICENSE_FILES = LICENSE
> +
> +NSD_DEPENDENCIES = libevent openssl
> +
> +NSD_CONF_OPT = \
> +	--prefix=/ \
> +	--datarootdir=/usr/share

This is fairly unusual, especially the --prefix=/, so having a comment
above would be useful.

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +NSD_CONF_OPT += --with-pidfile=/run/nsd/nsd.pid
> +endif

Ok, so for systemd the pidfile location is defined at compile time, but
for sysv/busybox init, it's passed through the init script.

> +define NSD_REMOVE_SAMPLE_CONF
> +	$(RM) $(TARGET_DIR)/etc/nsd/nsd.conf.sample
> +endef
> +
> +NSD_POST_INSTALL_TARGET_HOOKS += NSD_REMOVE_SAMPLE_CONF

Is there a non sample file installed?

Also, when build testing, I faced an issue:

checking for libevent... configure: error: Cannot find the libevent library.
You can restart ./configure --with-libevent=no to use a builtin alternative.
make: *** [/home/thomas/projets/buildroot/output/build/nsd-4.0.3/.stamp_configured] Erreur 1

Configuration used is:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_NSD=y

I see libevent being built. The config.log of nsd contains:

configure:5427: checking for libevent
configure:5453: error: Cannot find the libevent library.
You can restart ./configure --with-libevent=no to use a builtin alternative.

The same happens with OpenSSL:

checking for SSL... configure: error: Cannot find the SSL libraries in /usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/sfw /usr/local /usr

You probably need to pass --with-{libevent,ssl}=/some/path, but I
haven't figured out which path (I haven't looked too much, only tested
$(STAGING_DIR) and $(STAGING_DIR)/usr/lib).

Also, your package makes openssl and libevent mandatory dependencies of
nsd, which is not the case: you can pass --with-libevent=no and
--with-ssl=no and you can build without those dependencies. This is
something we should support to allow building a more lightweight
version of nsd.

Then, at boot time, I get:

Starting Name Server Daemon: Could not open /etc/nsd/nsd.conf: No such file or directory
[1410900412] nsd[525]: error: could not read config: /etc/nsd/nsd.conf

We generally like to have a default configuration file installed, so
that the service works in a minimal way "out of the box".

Could you have a look at those issues?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
