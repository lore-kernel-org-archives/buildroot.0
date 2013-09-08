From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:29:00 +0200
Subject: [Buildroot] [PATCH 02/10] sysvinit: install new cmds and fix
 inittab
In-Reply-To: <1378429464-12546-3-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-3-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908182900.662f7689@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:16 -0500, Ryan Barnett wrote:

> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index 65cbf17..c6b75a0 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -41,12 +41,16 @@ define SYSVINIT_INSTALL_TARGET_CMDS
>  	# Override Busybox's inittab with an inittab compatible with
>  	# sysvinit
>  	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
> +	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
> +	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
>  endef
>  
>  define SYSVINIT_UNINSTALL_TARGET_CMDS
>  	for x in halt init shutdown; do \
>  		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
>  	done
> +	rm -f $(TARGET_DIR)/sbin/reboot || exit 1
> +	rm -f $(TARGET_DIR)/sbin/poweroff || exit 1

Why aren't you adding these to the previous loop?

(Not a big deal, as we don't care much about uninstall commands, but
still.)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
