From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:41:18 +0200
Subject: [Buildroot] [PATCH v2] libiio: new package
In-Reply-To: <1411033467-7919-1-git-send-email-paul.cercueil@analog.com>
References: <1411033467-7919-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20140921214118.69e7d5f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Thu, 18 Sep 2014 11:44:27 +0200, Paul Cercueil wrote:
> Libiio is a library to ease the development of software interfacing
> Linux Industrial I/O (IIO) devices.
> 
> http://wiki.analog.com/resources/tools-software/linux-software/libiio
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  package/Config.in        |  1 +
>  package/libiio/Config.in | 42 ++++++++++++++++++++++++++
>  package/libiio/libiio.mk | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 package/libiio/Config.in
>  create mode 100644 package/libiio/libiio.mk

Thanks. However, I tested your package, and it fails to build:

make[1]: entrant dans le r?pertoire ? /home/thomas/projets/buildroot/output/build/libiio-2014_R1/iiod ?
install --strip-program=/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-strip -D -s -m 0755 \
		iiod /home/thomas/projets/buildroot/output/target/usr/sbin/iiod
install -m 0755 iiod.sh /home/thomas/projets/buildroot/output/target/etc/init.d/iiod.sh
update-rc.d iiod.sh defaults 99 01
update-rc.d: /etc/init.d/iiod.sh: file does not exist
make[1]: *** [install] Erreur 1

First, the Makefile should not be calling update-rc.d, and also the
init script in /etc/init.d/ should not be named iiod.sh in Buildroot,
but directly S<number><name>.

Also, is the install command with stripping is not good for Buildroot:
we want to control whether stripping happens or not.


> +# Avahi support in libiio requires avahi-client,
> +# which needs avahi-daemon and dbus
> +ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
> +	LIBIIO_DEPENDENCIES += avahi
> +else
> +	LIBIIO_MAKE_OPTS += WITH_AVAHI=no
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),y)
> +	LIBIIO_MAKE_OPTS += WITH_LOCAL_BACKEND=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
> +	LIBIIO_DEPENDENCIES += libxml2
> +else
> +	LIBIIO_MAKE_OPTS += WITH_NETWORK_BACKEND=no
> +endif
> +
> +# Libiio can run without threads
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +	LIBIIO_MAKE_OPTS += WITH_PTHREAD=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
> +define LIBIIO_BUILD_IIOD
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod $(LIBIIO_MAKE_OPTS)
> +endef
> +define LIBIIO_INSTALL_IIOD
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/iiod install \
> +		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBIIO_TESTS),y)
> +define LIBIIO_BUILD_TESTS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests $(LIBIIO_MAKE_OPTS)
> +endef
> +define LIBIIO_INSTALL_TESTS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tests install \
> +		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
> +endef
> +endif

Now that I think of it, you could also do:

ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
LIBIIO_MAKE_DIRS += iiod
endif

ifeq ($(BR2_PACKAGE_LIBIIO_TESTS),y)
LIBIIO_MAKE_DIRS += tests
endif

> +define LIBIIO_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) libiio $(LIBIIO_MAKE_OPTS)
> +	$(LIBIIO_BUILD_IIOD)
> +	$(LIBIIO_BUILD_TESTS)

Replace those last two lines with:

	for d in $(LIBIIO_MAKE_DIRS); do \
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d $(LIBIIO_MAKE_OPTS) || break ; \
	done

> +define LIBIIO_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-sysroot \
> +		$(LIBIIO_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBIIO_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-lib \
> +		$(LIBIIO_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
> +	$(LIBIIO_INSTALL_IIOD)
> +	$(LIBIIO_INSTALL_TESTS)

And ditto here.

Note that the Makefile of libiio could make this a little bit nicer by
having a build and installation scheme that is easy to work with
several make targets.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
