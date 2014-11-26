From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:51:16 +0100
Subject: [Buildroot] [PATCH next 2/3] package/tvheadend: Add support for
 liburiparser
In-Reply-To: <1416772613-13447-2-git-send-email-bernd.kuhls@t-online.de>
References: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
 <1416772613-13447-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141126225116.7c0ea4c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 23 Nov 2014 20:56:52 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
> +TVHEADEND_DEPENDENCIES += liburiparser
> +TVHEADEND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)"

This is a little bit dangerous, because if another part of tvheadend.mk
wants to add some stuff to the CFLAGS, it will no longer be possible.
It would have been a bit better to do:

TVHEADEND_CFLAGS = $(TARGET_CFLAGS)
ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
endif

and then:

>  TVHEADEND_DEPENDENCIES += dtv-scan-tables
>  
>  define TVHEADEND_CONFIGURE_CMDS
>  	(cd $(@D);				\
>  	 $(TARGET_CONFIGURE_OPTS)		\
>  	 $(TARGET_CONFIGURE_ARGS)		\
> +	 $(TVHEADEND_CONF_ENV)			\

	 CFLAGS="$(TVHEADEND_CFLAGS)"

I have nonetheless committed your proposal to next, it will always be
time to improve things later when a second condition needs to adjust
the CFLAGS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
