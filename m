From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:25:15 +0100
Subject: [Buildroot] [PATCH 6/7] package/avahi: add optional support for
 libcap
In-Reply-To: <1456066125-28379-6-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
 <1456066125-28379-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182515.4f082234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:48:44 +0100, Bernd Kuhls wrote:

> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 5d6e6a8..ce89e42 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -117,6 +117,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
>  AVAHI_DEPENDENCIES += expat
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +AVAHI_DEPENDENCIES += libcap
> +endif

It is a bit weird to have this in the middle of the expat handling, IMO.

>  AVAHI_CONF_OPTS += --with-xml=expat
>  else
>  AVAHI_CONF_OPTS += --with-xml=none

Shouldn't we simply do:

ifeq ($(BR2_PACKAGE_EXPAT),y)
AVAHI_DEPENDENCIES += expat
AVAHI_CONF_OPTS += --with-xml=expat
else
AVAHI_CONF_OPTS += --with-xml=none
endif

ifeq ($(BR2_PACKAGE_LIBCAP),y)
AVAHI_DEPENDENCIES += libcap
endif

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
