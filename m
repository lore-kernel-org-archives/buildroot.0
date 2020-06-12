From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jun 2020 07:31:55 +0200
Subject: [Buildroot] [PATCH v2] package/dbusbroker: new package
In-Reply-To: <20200610232428.201616-1-nolange79@gmail.com>
References: <20200610232428.201616-1-nolange79@gmail.com>
Message-ID: <20200612053155.GU13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

Thanks for this new improved version. :-)

I still have a few concerns about it, see below...

On 2020-06-11 01:24 +0200, Norbert Lange spake thusly:
> Add dbus-broker, which is a drop-in replacement
> for the dbus-daemon.

Sorry, but this commit log is far from enough. See below for all the
pieces I find are missing.

A commit log is not here to describe what is being done, but why it
is being done. It is here so that the others can understand it. The
more details you can add (up to a certain externt, of course!), the
easier the patch can be reviewed, especially when there are
misundersstanding like what I provided in my own submission.

> Its possible to use this package standalone (without the dbus
> package - if buildroot's systemd would not depend on dbus).
> 
> This is sufficient to provide systemd's (d)bus functionality.
> To allow standalone usage, the necessary config files are
> copied and adopted over from dbus.

As I explained previously, if you want to make systemd use dbus-broker,
you change the systemd Config.in, as I did in my series. And if this
will be done in a followup patch, you can write (instead of the two
paragraphs above):

    dbus-broker is sufficient to provide a dbus-daemon that can fullfil
    the requirements for systemd's dbus functionality. This will be done
    in a followup change.

Also, I find it lacking the part that describes how dbus-broker is split
between a launcher and a bus daemon, and that the launcher can only be
used with systemd, because the launcher makes heavy use of systemd
functionalities.

The commit log also misses the explanations about the licensing
information. This is *very* important to have, because it is not
obvious hy the terms are as they are, and wh we have two files for
each sub-projects. You could have simply duplicated what I wrote
in my own submission.

Finally, the folowing, from here [*]:

> bases on Yanns changes, and
> -   add an own config entry for dbus-broker-launch
>     enabled by default if systemd init is used

We usually do not enable options by default. But see below...

> -   undo BR2_COREUTILS_HOST_DEPENDENCY

So, I see you don;t like it, but BR2_COREUTILS_HOST_DEPENDENCY is
already a dependency of systemd, so adding it to dbus-broker is not in
fact adding any new build-time overhead. And if your build machine has a
recent-enough, BR2_COREUTILS_HOST_DEPENDENCY will be empty already.

> -   undo adding dbus user - never used by this package

So, how does the does the message bus daemon runs as non-root? In the
original dbus pakcage, we define a user, that is used to switch the
mesage bus to run as non-root. Pleas explain why the user is nopt
needed.

> -   add condtional audit dependency
> -   cleanup conditional logic a bit

[*] ... to here, should have been after the --- line.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
> new file mode 100644
> index 0000000000..8cde3310eb
> --- /dev/null
> +++ b/package/dbus-broker/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_DBUS_BROKER
> +	bool "dbus-broker"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Linux D-Bus Message Broker.
> +
> +	  The dbus-broker project is an implementation of a message bus
> +	  as defined by the D-Bus specification. Its aim is to provide
> +	  high performance and reliability, while keeping compatibility
> +	  to the D-Bus reference implementation.
> +
> +	  It is exclusively written for Linux systems, and makes use of
> +	  many modern features provided by recent linux kernel releases.
> +
> +	  https://github.com/bus1/dbus-broker/wiki
> +
> +if BR2_PACKAGE_DBUS_BROKER
> +config BR2_PACKAGE_DBUS_BROKER_LAUNCH
> +	bool "dbus-broker-launch"
> +	default y
> +	depends on BR2_INIT_SYSTEMD

Do not depend on the init config option, but on the package (it is the
package that provides libsystemd et al., not the init feature):

    depends on BR2_PACKAGE_SYSTEMD

But see below...

> +	select BR2_PACKAGE_EXPAT
> +	help
> +	  Launcher for D-Bus Message Brokers.
> +
> +	  dbus-broker-launch is a launcher for dbus-broker, spawning and
> +	  managing a D-Bus Message Bus. The launcher aims to be fully
> +	  compatible to the D-Bus reference implementation dbus-daemon,
> +	  supporting the same configuration syntax and runtime environment.
> +endif

Why do you add an option to enable the launcher? Just do it
unconditionally when systemd is enabled. And select expat as I did in my
own patch, in the main symbol:

    config BR2_PACKAGE_DBUS_BROKER
        [...]
        select BR2_PACKAGE_EXPAT if BR2_PACKAGE_SYSTEMD

Note: if the option were to stay, which I doubt is interesting), then
it would miss a comment that explains why the launcher is not availble:

    comment "dbus-broker-launch needs systemd"
        deepnds on !BR2_INIT_SYSTEMD

> +comment "dbus-broker needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Yes, good. :-)

> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> new file mode 100644
> index 0000000000..8a06d9ea82
> --- /dev/null
> +++ b/package/dbus-broker/dbus-broker.mk
> @@ -0,0 +1,72 @@
> +################################################################################
> +#
> +# dbus-broker
> +#
> +# Launching services is delegated to systemd so there is very little else
> +# needed. No separate user is necessary and no helper for launching.
> +#
> +# Service + Config files were copied over from dbus,
> +# uneeded / unecessary entries removed for clarity.

Do not add any comment in this section. If you have help to provide,
write in the help entry of the Config.in option, or in the commit log.

> +################################################################################
> +
> +DBUS_BROKER_VERSION = 23
> +DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
> +DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
> +DBUS_BROKER_LICENSE = \
> +	Apache-2.0, \
> +	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
> +DBUS_BROKER_LICENSE_FILES = \
> +	LICENSE \
> +	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
> +	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
> +	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
> +	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
> +	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
> +	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
> +	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
> +
> +ifeq ($(BR2_PACKAGE_DBUS_BROKER_LAUNCH),y)

ifeq ($(BR2_PACKAGE_SYSTEMD),y)

> +DBUS_BROKER_DEPENDENCIES += expat systemd
> +DBUS_BROKER_CONF_OPTS += -Dlauncher=true
> +else
> +DBUS_BROKER_CONF_OPTS += -Dlauncher=false
> +endif
[--SNIP--]
> +# Only install config and service files if dbus is not available
> +ifeq ($(BR2_PACKAGE_DBUS)X$(BR2_PACKAGE_DBUS_BROKER_LAUNCH),Xy)
> +define DBUS_BROKER_INSTALL_CONFIG_FILES

This is not entirey wrong, but I think still incorrect. All those files
are only releveant when systemd is used as an init system. As such, the
DBUS_BROKER_INSTALL_INIT_SYSTEMD hook should be used.

> +	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
> +	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/session.conf \
> +		$(TARGET_DIR)/usr/share/dbus-1/session.conf
> +	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/system.conf \
> +		$(TARGET_DIR)/usr/share/dbus-1/system.conf
> +	ln -sf ../dbus.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
> +endef
> +
> +DBUS_BROKER_POST_INSTALL_TARGET_HOOKS += DBUS_BROKER_INSTALL_CONFIG_FILES
> +endif
> +
> +$(eval $(meson-package))

So, in addition to all the above, this patch is lacking two other things
that I did provide:

  - switching systemd to work with dbus-broker (rather than whining
    about it in the commit log;

  - a runtime test that demonstrates that systemd does run fine with
    dbus-broker, and that the original dbus still takes precendence when
    both dbus and dbus-broker are enabled.

Note that the runtime test is not only about demonstrating the feature;
it is also and foremost a way to guarantee that any regression will be
caught, since we automatically run the runtime tests weekly in gitlab-ci.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
