From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 15:29:02 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20070821132145.C758DA48D8@busybox.net>
References: <20070821132145.C758DA48D8@busybox.net>
Message-ID: <1187702942.6145.2.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Changeset:
> Modified: trunk/buildroot/target/linux/Makefile.in
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in	2007-08-21 12:09:53 UTC (rev 19613)
> +++ trunk/buildroot/target/linux/Makefile.in	2007-08-21 13:21:44 UTC (rev 19614)
> @@ -121,6 +121,12 @@
>  else
>  	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
>  endif
> +	$(SED) '/CONFIG_IPV6/d' $(LINUX26_DIR)/.config
> +ifeq ($(BR2_INET_IPV6),y)
> +	echo "CONFIG_IPV6=y" >> $(LINUX26_DIR)/.config
> +else
> +	echo "# CONFIG_IPV6 is not set" >> $(LINUX26_DIR)/.config
> +endif
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
>  	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \

I think this is dangerous.
What happens if someone introduces 
CONFIG_IPV6_EXTRA_CONFIG in the kernel.
It is better to 'sed' the .config for the full string.


-- 
Best Regards,
Ulf Samuelsson
