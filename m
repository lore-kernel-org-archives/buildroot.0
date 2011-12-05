From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Dec 2011 15:37:24 +0100
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <1323090955-5661-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 5 Dec 2011 14:15:55 +0100")
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
Message-ID: <87obvnrsnv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> The ConnMan project provides a daemon for managing internet
 Daniel> connections within embedded devices running the Linux operating
 Daniel> system. The Connection Manager is designed to be slim and to
 Daniel> use as few resources as possible, so it can be easily
 Daniel> integrated. It is a fully modular system that can be extended,
 Daniel> through plug-ins, to support all kinds of wired or wireless
 Daniel> technologies. Also, configuration methods, like DHCP and domain
 Daniel> name resolving, are implemented using plug-ins. The plug-in
 Daniel> approach allows for easy adaption and modification for various
 Daniel> use cases.

Thanks, looks interesting. Kos_tom also worked on a package which
unfortunately got lost together with his laptop.

 Daniel> +config BR2_PACKAGE_CONNMAN_BLUETOOTH
 Daniel> +	bool "enable Bluetooth support"

Does this not need BR2_PACKAGE_BLUEZ_UTILS?

 Daniel> +++ b/package/connman/connman.mk
 Daniel> @@ -0,0 +1,21 @@
 Daniel> +#######################################################
 Daniel> +#
 Daniel> +# connman - open source connection manager
 Daniel> +#
 Daniel> +#######################################################
 Daniel> +
 Daniel> +CONNMAN_VERSION = 0.77
 Daniel> +CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
 Daniel> +CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 Daniel> +CONNMAN_AUTORECONF = YES

Why? You don't seem to be editing configure.ac or similar.

 Daniel> +CONNMAN_CONF_OPT += --localstatedir=/var --sysconfdir=/etc \

--sysconfdir is automatically used by AUTOTARGETS, so you don't need to
explicitly pass it.


 Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
 Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\

You probably also need to add wpa_supplicant to CONNMAN_DEPENDENCIES

-- 
Bye, Peter Korsgaard
