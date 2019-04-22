From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:39:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: always disable zlib in
 bind library
In-Reply-To: <20190421171039.26556-1-fontaine.fabrice@gmail.com>
References: <20190421171039.26556-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422223952.53412a78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 21 Apr 2019 19:10:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +#?Always disable zlib in bind library (like all other dependencies, see
> +#?bind/Makefile.in)

This reason looked suspicious to me, so I investigated, and indeed, I
think it's not the right fix.

> +DHCP_BIND_CONF_OPTS = --without-zlib
> +
>  ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
>  DHCP_CONF_OPTS += --enable-delayed-ack
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ZLIB),y)

The right fix is:

DHCP_DEPENDENCIES += zlib

> -DHCP_BIND_CONF_OPTS += --with-zlib
> -else
> -DHCP_BIND_CONF_OPTS += --without-zlib
> -endif

Thanks to this, zlib is properly built before dhcp, and everything
works fine.

I committed a fix that does this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
