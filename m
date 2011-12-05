From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Dec 2011 23:18:51 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <1323106241-22192-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 5 Dec 2011 18:30:41 +0100")
References: <4EDCFEB2.60603@gmail.com>
 <1323106241-22192-1-git-send-email-zonque@gmail.com>
Message-ID: <87fwgyslv8.fsf@macbook.be.48ers.dk>
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

Thanks, a few more comments:

 Daniel> +if BR2_PACKAGE_CONNMAN
 Daniel> +
 Daniel> +config BR2_PACKAGE_CONNMAN_THREADS
 Daniel> +	bool "enable threading support"
 Daniel> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Daniel> +	default y
 Daniel> +
 Daniel> +config BR2_PACKAGE_CONNMAN_ETHERNET
 Daniel> +	bool "enable Ethernet support"
 Daniel> +	default y
 Daniel> +
 Daniel> +config BR2_PACKAGE_CONNMAN_WIFI
 Daniel> +	bool "enable WiFi support"
 Daniel> +	select BR2_PACKAGE_WPA_SUPPLICANT
 Daniel> +	default y

I wouldn't enable WIFI support by default, to not get it to pull in
wpa_supplicant, so drop the 'default y'

 Daniel> +++ b/package/connman/connman.mk
 Daniel> @@ -0,0 +1,21 @@
 Daniel> +#######################################################
 Daniel> +#
 Daniel> +# connman - open source connection manager
 Daniel> +#
 Daniel> +#######################################################
 Daniel> +
 Daniel> +CONNMAN_VERSION = 0.78
 Daniel> +CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
 Daniel> +CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 Daniel> +CONNMAN_AUTORECONF = YES

It seems to install a .pc file and some headers, so we should have
CONNMAN_INSTALL_STAGING = YES

What about installing an initscript? I see there's an example init
script in the connman sources, but that doesn't seem directly applicable
to our busybox based system.

I applied the patch and gave it a quick test, but it fails with the
default uClibc configuration as we don't enable
UCLIBC_HAS_RESOLVER_SUPPORT (just like upstream), and connman seems to
want it for gweb/gresolv.c:

checking resolv.h usability... yes
checking resolv.h presence... yes
checking for resolv.h... yes
checking for ns_initparse in -lresolv... no
checking for __ns_initparse in -lresolv... no
configure: error: resolver library support is required
make: *** [/home/peko/source/buildroot/output/build/connman-0.78/.stamp_configured

I don't like to add it if doesn't work with uClibc based toolchains. We
can add a toolchain configuration option to enable the UCLIBC
configuration, but that doesn't help for ctng and external toolchains.

What configuration are you using it with?

-- 
Bye, Peter Korsgaard
