From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:22:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
In-Reply-To: <1597676921-9204-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597676921-9204-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200818232234.298f777b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jugurtha,

On Mon, 17 Aug 2020 17:08:41 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
> index 0a257ec..67f0ee2 100644
> --- a/package/iptraf-ng/iptraf-ng.hash
> +++ b/package/iptraf-ng/iptraf-ng.hash
> @@ -1,4 +1,3 @@
> -# From https://fedorahosted.org/releases/i/p/iptraf-ng/iptraf-ng-1.1.4.tar.gz.sum
> -sha1	a2e51b0dd6b8c80583fc25d055850c96b3d2f544	iptraf-ng-1.1.4.tar.gz
>  # Locally computed
> +sha256	a53fa7bd5472e7103c5922e067912432c2a2f2a549a49334d2d1727f2e98e1ec  iptraf-ng-v1.2.1.tar.gz

I'm not getting the same hash here:

ERROR: iptraf-ng-v1.2.1.tar.gz has wrong sha256 hash:
ERROR: expected: a53fa7bd5472e7103c5922e067912432c2a2f2a549a49334d2d1727f2e98e1ec
ERROR: got     : 9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870

Also, please use two spaces to separate the hash type from the hash,
and the hash from the file name.

> -IPTRAF_NG_VERSION = 1.1.4
> -IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
> +IPTRAF_NG_VERSION = v1.2.1

Please use:

IPTRAF_NG_VERSION = 1.2.1

> +IPTRAF_NG_SITE = $(call github,iptraf-ng,iptraf-ng,$(IPTRAF_NG_VERSION))

and:

IPTRAF_NG_SITE = $(call github,iptraf-ng,iptraf-ng,v$(IPTRAF_NG_VERSION))

>  IPTRAF_NG_LICENSE = GPL-2.0+
>  IPTRAF_NG_LICENSE_FILES = LICENSE
>  IPTRAF_NG_DEPENDENCIES = ncurses
>  
> -IPTRAF_NG_MAKE_ENV = \
> -	NCURSES_LDFLAGS="-lpanel -lncurses"
> +define IPTRAF_NG_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
> +			   LD="$(TARGET_CC)" \
> +			   CFLAGS="$(TARGET_CFLAGS)" \
> +			   LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)

Can you try to replace CC, LD, CFLAGS and LDFLAGS by $(TARGET_CONFIGURE_OPTS) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
