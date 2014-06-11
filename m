From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 22:34:47 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: add network unit file
In-Reply-To: <1390874097-25597-1-git-send-email-vsergeev@kumunetworks.com>
References: <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <1390874097-25597-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20140611223447.1d5e7a65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

As our systemd person, could you have a look at this patch, and give
your comments and/or Acked-by/Reviewed-by as appropriate?

Thanks!

Thomas

On Mon, 27 Jan 2014 17:54:57 -0800, Ivan Sergeev wrote:
> Add and enable a systemd unit file to bring up or down network with ifup /
> ifdown, analogous to the skeleton/etc/init.d/S40network init script.
> 
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> ---
>  package/systemd/network.service | 21 +++++++++++++++++++++
>  package/systemd/systemd.mk      |  9 +++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/systemd/network.service
> 
> diff --git a/package/systemd/network.service b/package/systemd/network.service
> new file mode 100644
> index 0000000..0d77bb8
> --- /dev/null
> +++ b/package/systemd/network.service
> @@ -0,0 +1,21 @@
> +[Unit]
> +Description=Network Connectivity
> +Wants=network.target
> +Before=network.target
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +
> +# lo is brought up earlier, which will cause the upcoming "ifup -a" to fail
> +# with exit code 1, due to an "ip: RTNETLINK answers: File exists" error during
> +# its "ip addr add ..." command, subsequently causing this unit to fail even
> +# though it is a benign error. Flushing the lo address with the command below
> +# before ifup prevents this failure.
> +ExecStart=/sbin/ip addr flush dev lo
> +
> +ExecStart=/sbin/ifup -a
> +ExecStop=/sbin/ifdown -a
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index a5dc8e5..a99c0da 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -72,7 +72,16 @@ define SYSTEMD_INSTALL_TTY_HOOK
>  	ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
>  endef
>  
> +define SYSTEMD_INSTALL_NETWORK_HOOK
> +	$(INSTALL) -D -m 644 package/systemd/network.service \
> +		$(TARGET_DIR)/etc/systemd/system/network.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../network.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_TTY_HOOK \
> +	SYSTEMD_INSTALL_NETWORK_HOOK
>  
>  $(eval $(autotools-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
