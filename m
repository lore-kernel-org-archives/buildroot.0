From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:50:03 +0200
Subject: [Buildroot] [PATCH v2 8/8] package/mpd: fix zeroconf support
In-Reply-To: <1413379134-28918-8-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
 <1413379134-28918-8-git-send-email-jkrause@posteo.de>
Message-ID: <20141016115003.43eceeab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 15 Oct 2014 15:18:54 +0200, J?rg Krause wrote:

>  # Some options need an explicit --disable or --enable
> -ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
> +
> +# Zeroconf support depends on libdns_sd from avahi.
> +ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
>  MPD_DEPENDENCIES += avahi
>  else
>  MPD_CONF_OPTS += --with-zeroconf=no

It doesn't seem really obvious for the user that
BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY should be enabled to get avahi
support in mpd. So, in such situations, I would suggest to add a
Config.in option to explicitly enable the Avahi support in mpd:

config BR2_PACKAGE_MPD_AVAHI_SUPPORT
	bool "avahi support"
	depends on ... # all the dependencies of avahi
	select BR2_PACKAGE_AVAHI
	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
	help
	  Some help text

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
