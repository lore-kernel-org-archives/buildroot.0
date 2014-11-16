From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 22:38:04 +0100
Subject: [Buildroot] [PATCH V2 2/4] package/squid: enable ICAP server
 support in squid
In-Reply-To: <1415808993-2394-3-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-3-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20141116223804.04fc546b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET,

On Wed, 12 Nov 2014 17:16:31 +0100, Guillaume GARDET wrote:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> ---
>  package/squid/squid.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index ed51881..652fdb8 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -29,7 +29,8 @@ SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
>  			--enable-external-acl-helpers="file_userip" \
>  			--with-logdir=/var/log/squid/ \
>  			--with-pidfile=/var/run/squid.pid \
> -			--with-swapdir=/var/cache/squid/
> +			--with-swapdir=/var/cache/squid/ \
> +			--enable-icap-client

The commit title says you enable the "ICAP server", but in fact you are
enabling the ICAP client.

>  
>  # On uClibc librt needs libpthread
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
> @@ -48,6 +49,10 @@ define SQUID_CLEANUP_TARGET
>  		cachemgr.conf mime.conf.default squid.conf.default)
>  endef
>  
> -SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
> +define SQUID_CREATE_MISSING_FOLDER
> +	mkdir -p $(TARGET_DIR)/var/log/squid/
> +endef

This is wrong, for two reasons:

 1/ It's related to your PATCH 1/4, which adds
    --with-logdir=/var/log/squid, so it should go with it.

 2/ Creating a directory in /var/log at build time doesn't make sense,
    because /var/log in Buildroot is a symbolic link to /tmp, and /tmp
    is mounted as a tmpfs so that the root filesystem can remain
    read-only. Therefore, the proper solution is to create this
    directory at boot time. We normally do this in the startup script
    provided by the package, but squid doesn't provide one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
