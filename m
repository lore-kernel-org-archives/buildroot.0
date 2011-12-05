From: Daniel Mack <zonque@gmail.com>
Date: Tue, 06 Dec 2011 00:07:26 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <87fwgyslv8.fsf@macbook.be.48ers.dk>
References: <4EDCFEB2.60603@gmail.com>
 <1323106241-22192-1-git-send-email-zonque@gmail.com>
 <87fwgyslv8.fsf@macbook.be.48ers.dk>
Message-ID: <4EDD4EAE.7010808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/2011 11:18 PM, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>  Daniel> +if BR2_PACKAGE_CONNMAN
>  Daniel> +
>  Daniel> +config BR2_PACKAGE_CONNMAN_THREADS
>  Daniel> +	bool "enable threading support"
>  Daniel> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  Daniel> +	default y
>  Daniel> +
>  Daniel> +config BR2_PACKAGE_CONNMAN_ETHERNET
>  Daniel> +	bool "enable Ethernet support"
>  Daniel> +	default y
>  Daniel> +
>  Daniel> +config BR2_PACKAGE_CONNMAN_WIFI
>  Daniel> +	bool "enable WiFi support"
>  Daniel> +	select BR2_PACKAGE_WPA_SUPPLICANT
>  Daniel> +	default y
> 
> I wouldn't enable WIFI support by default, to not get it to pull in
> wpa_supplicant, so drop the 'default y'

Ok, that's reasonable.

>  Daniel> +++ b/package/connman/connman.mk
>  Daniel> @@ -0,0 +1,21 @@
>  Daniel> +#######################################################
>  Daniel> +#
>  Daniel> +# connman - open source connection manager
>  Daniel> +#
>  Daniel> +#######################################################
>  Daniel> +
>  Daniel> +CONNMAN_VERSION = 0.78
>  Daniel> +CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
>  Daniel> +CONNMAN_DEPENDENCIES = libglib2 dbus iptables
>  Daniel> +CONNMAN_AUTORECONF = YES
> 
> It seems to install a .pc file and some headers, so we should have
> CONNMAN_INSTALL_STAGING = YES

Ok, I can do this, too. The primary interface for communication with the
daemon is DBus, so we don't seem to need headers, but the .pc file is a
fair reason.

> What about installing an initscript? I see there's an example init
> script in the connman sources, but that doesn't seem directly applicable
> to our busybox based system.

Yes, I can write one up.

> I applied the patch and gave it a quick test, but it fails with the
> default uClibc configuration as we don't enable
> UCLIBC_HAS_RESOLVER_SUPPORT (just like upstream), and connman seems to
> want it for gweb/gresolv.c:
> 
> checking resolv.h usability... yes
> checking resolv.h presence... yes
> checking for resolv.h... yes
> checking for ns_initparse in -lresolv... no
> checking for __ns_initparse in -lresolv... no
> configure: error: resolver library support is required
> make: *** [/home/peko/source/buildroot/output/build/connman-0.78/.stamp_configured

Yes, this is the reason why I added resolver support to uClibc some
months back, and all the stuff in upstream now.

> I don't like to add it if doesn't work with uClibc based toolchains. 

Well, it does, if you enable UCLIBC_HAS_RESOLVER_SUPPORT. What about
adding a dependency for that? If people want to have connman, they have
to manually select this feature and rebuild their uClibc. Does that
sound ok?

> We
> can add a toolchain configuration option to enable the UCLIBC
> configuration, but that doesn't help for ctng and external toolchains.

Why not depend on UCLIBC_HAS_RESOLVER_SUPPORT if uClibc is used and
whitelist others?

Something like

depends on (BR2_TOOLCHAIN_BUILDROOT && UCLIBC_HAS_RESOLVER_SUPPORT) ||
BR2_TOOLCHAIN_CTNG

?

And if people verify that it works with other toolchains as well, this
list can be augmented.

> What configuration are you using it with?

I tested it with both uClibc and Crosstool-NG (eglibc), and both worked
fine for me.


Thanks,
Daniel
