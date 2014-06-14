From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:42:06 +0200
Subject: [Buildroot] [PATCH] systemd: add network unit file
In-Reply-To: <1402673735-14109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1402673735-14109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140614184206.20e44592@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 13 Jun 2014 17:35:35 +0200, Eric Le Bihan wrote:
> From: Ivan Sergeev <vsergeev@kumunetworks.com>
> 
> Add and enable a systemd unit file to bring up or down network with ifup /
> ifdown, analogous to the skeleton/etc/init.d/S40network init script.
> 
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> [eric.le.bihan.dev at free.fr:
>   - rebase
>   - install service only if systemd-networkd is not selected]
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/network.service |   21 +++++++++++++++++++++
>  package/systemd/systemd.mk      |   12 ++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 package/systemd/network.service

Applied, thanks. However, I have a comment/question, below.


> +define SYSTEMD_INSTALL_NETWORK_HOOK
> +	$(INSTALL) -D -m 644 package/systemd/network.service \
> +		$(TARGET_DIR)/etc/systemd/system/network.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../network.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_TTY_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_SANITIZE_PATH_IN_UNITS
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
> +SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_NETWORK_HOOK
> +endif

I'm wondering why we're not using the <pkg>_INIT_SYSTEMD mechanism here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
