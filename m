From: Daniel Mack <zonque@gmail.com>
Date: Mon, 05 Dec 2011 18:26:10 +0100
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <87obvnrsnv.fsf@macbook.be.48ers.dk>
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
 <87obvnrsnv.fsf@macbook.be.48ers.dk>
Message-ID: <4EDCFEB2.60603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/2011 03:37 PM, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>  Daniel> +config BR2_PACKAGE_CONNMAN_BLUETOOTH
>  Daniel> +	bool "enable Bluetooth support"
> 
> Does this not need BR2_PACKAGE_BLUEZ_UTILS?

Nope, it doesn't seem to need that. Just double-checked.

>  Daniel> +++ b/package/connman/connman.mk
>  Daniel> @@ -0,0 +1,21 @@
>  Daniel> +#######################################################
>  Daniel> +#
>  Daniel> +# connman - open source connection manager
>  Daniel> +#
>  Daniel> +#######################################################
>  Daniel> +
>  Daniel> +CONNMAN_VERSION = 0.77
>  Daniel> +CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
>  Daniel> +CONNMAN_DEPENDENCIES = libglib2 dbus iptables
>  Daniel> +CONNMAN_AUTORECONF = YES
> 
> Why? You don't seem to be editing configure.ac or similar.

I'm cloning from a git repository, for the reason described in the
commit log. Hence, the configure script has to be generated.

>  Daniel> +CONNMAN_CONF_OPT += --localstatedir=/var --sysconfdir=/etc \
> 
> --sysconfdir is automatically used by AUTOTARGETS, so you don't need to
> explicitly pass it.

Ok, I dropped that.

>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
>  Daniel> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
> 
> You probably also need to add wpa_supplicant to CONNMAN_DEPENDENCIES

As described in the other mail, wpa_supplicant is just a runtime dependency.

I'll send a v3 that drops --sysconfdir and uses v0.78 which was just
released.


Thanks,
Daniel
