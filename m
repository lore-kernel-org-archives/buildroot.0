From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Jan 2017 16:02:50 -0300
Subject: [Buildroot] [PATCH 1/1] Fix gcrypt library linker option on
 collectd.
In-Reply-To: <1482988838-6777-1-git-send-email-jackzzjack@gmail.com>
References: <1482988838-6777-1-git-send-email-jackzzjack@gmail.com>
Message-ID: <6e30e6660557386a1bec2f421cdc0fc1@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-12-29 02:20, Yu-Ting, Kao wrote:

> @@ -177,6 +177,7 @@ ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  COLLECTD_DEPENDENCIES += libgcrypt
>  COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
>  COLLECTD_CONF_ENV += 
> LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
> +COLLECTD_CONF_ENV += LIBS="-lgcrypt"
>  else
>  COLLECTD_CONF_OPTS += --with-libgcrypt=no
>  endif

Hi.
This won't work as expected since you're potentially stomping over LIBS 
which is defined at the beginning of the package makefile, and also over 
the re-stomping when the postgresql option is turned on (which doesn't 
break the first one since it's defining both).
Probably better to do something like, at the beginning:

COLLECTD_CONF_ENV = LIBS="-lm $(COLLECTD_LIBS)"

And then:

ifeq ($(BR2_PACKAGE_POSTGRESQL,y)
COLLECTD_LIBS += -lpthread
....

ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
COLLECTD_LIBS += -lgcrypt
....

Regards.
