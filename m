From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 26 Mar 2020 14:50:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: fix build failure on
 x86_64
In-Reply-To: <20200326132401.GA30508@P-NAN-EREVAN-mikbou>
References: <20200326132401.GA30508@P-NAN-EREVAN-mikbou>
Message-ID: <fb4c9268-388f-e04c-8f32-270ca3932302@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikael,

Le 26/03/2020 ? 14:24, Mikael Bourhis-Cloarec a ?crit?:
> The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.
> 
> But to keep the same 'Connman' setup as previous setup, we need to
> explicitly disable the 'WireGuard' support.
> 
> The support of all the new 'Connman' options will be done after.
> 
> Fixes:
> http://autobuild.buildroot.org/results/dd8/dd8a68827ca70838c59d82780cb3eadf6b9764c2/

This build issue in not related to x86_64 only (see commit title), It is also
present for other architectures. See:
http://autobuild.buildroot.org/?reason=connman-1.38

I would write: package/connman: disable wireguard support

> 
> Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
> ---
>  package/connman/connman.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 701be8b59d..251998d0dd 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -14,6 +14,8 @@ CONNMAN_LICENSE_FILES = COPYING
>  
>  CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
>  
> +CONNMAN_CONF_OPTS += --disable-wireguard

We prefer something like:

CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc \
	--disable-wireguard

Best regards,
Romain


> +
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  CONNMAN_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
>  endif
> 
