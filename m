From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 12:20:52 +0100
Subject: [Buildroot] [git commit] nss-mdns: unbreak after e1eba3d97
 (system/skeleton: make nsswitch install conditional)
In-Reply-To: <20141031103620.B1418B2511@busybox.osuosl.org>
References: <20141031103620.B1418B2511@busybox.osuosl.org>
Message-ID: <20141031122052.7c1b70b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 31 Oct 2014 11:31:05 +0100, Peter Korsgaard wrote:

> diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
> index 8d23f89..22c2bc2 100644
> --- a/package/nss-mdns/nss-mdns.mk
> +++ b/package/nss-mdns/nss-mdns.mk
> @@ -10,6 +10,9 @@ NSS_MDNS_LICENSE = LGPLv2.1+
>  NSS_MDNS_LICENSE_FILES = LICENSE
>  
>  define NSS_MDNS_INSTALL_CONFIG
> +	if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
> +		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
> +	fi
>  	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
>  	    $(TARGET_DIR)/etc/nsswitch.conf
>  endef

As I already pointed out when I reviewed Gustavo's patch about
nsswitch.conf, it's not the correct approach. This file should be
installed by the glibc and toolchain-external packages. This way, it is
guaranteed to be there when nss-mdns or samba want to modify.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
