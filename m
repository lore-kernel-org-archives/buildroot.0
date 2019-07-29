From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 08:54:49 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: Add capability for clockdiff,
 ping, traceroute6
In-Reply-To: <20190728195346.31201-1-petr.vorel@gmail.com>
References: <20190728195346.31201-1-petr.vorel@gmail.com>
Message-ID: <20190729085449.771df94a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

+Yann in Cc.

On Sun, 28 Jul 2019 21:53:46 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> NOTE: not setting for arping as it can be used for ARP Poisoning
> 
> NOTE: use cap_net_raw+p (drop +e) as upstream sets that via
> cap_set_flag(), see https://github.com/iputils/iputils/issues/194
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/iputils/iputils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 8e6a3e2fc5..2ffa8da554 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -73,11 +73,17 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
>  
>  # handle permissions ourselves
>  IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
> +ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
> +IPUTILS_CAPABILITY = |xattr cap_net_raw+p
> +endif
>  define IPUTILS_PERMISSIONS
>  	/usr/sbin/arping      f 4755 0 0 - - - - -
>  	/usr/bin/clockdiff    f 4755 0 0 - - - - -
> +	$(IPUTILS_CAPABILITY)

It looks a bit annoying to me that we have to add this
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES conditional.
Indeed, every single place where a permission/device table will want to
use extended attributes, we will have to add such a conditional.

Shouldn't this logic be moved into the code that parses the
permission/device table, and simply discard the extended attributes if
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is disabled ?
(Possibly with a warning)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
