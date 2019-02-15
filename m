From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 23:17:25 +0100
Subject: [Buildroot] [PATCH] package/openssh: adding a way to install
 only sftp-server
In-Reply-To: <20190215220257.12430-1-angelo@amarulasolutions.com>
References: <20190215220257.12430-1-angelo@amarulasolutions.com>
Message-ID: <20190215231725.07f05798@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri, 15 Feb 2019 23:02:57 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> This patch adds a way to install only sftp-server in case it is
> needed by other packages (like dropbear) or a full openssh installation is
> not needed.

Why not using package/gesftpserver/ if you need a sftp server in a
dropbear-only environment ?

> +if BR2_PACKAGE_OPENSSH
> +
> +config BR2_PACKAGE_OPENSSH_SFTP_ONLY

Options "FOO_ONLY" are not really nice. If we really want to do this,
then we probably want:

BR2_PACKAGE_OPENSSH_SSH
BR2_PACKAGE_OPENSSH_SSHD
BR2_PACKAGE_OPENSSH_SFTP_SERVER

etc.

> +	bool "install only sftp"
> +	help
> +	  Install only sftp binary (ex: dropbear sftp support)
> +
> +endif
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 4fef5caedb..bfd93845d9 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -88,4 +88,14 @@ endef
>  
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
>  
> +ifeq ($(BR2_PACKAGE_OPENSSH_SFTP_ONLY),y)
> +define OPENSSH_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/sftp-server \
> +		$(TARGET_DIR)/usr/libexec/sftp-server
> +endef
> +undefine OPENSSH_INSTALL_INIT_SYSTEMD
> +undefine OPENSSH_INSTALL_INIT_SYSV
> +undefine OPENSSH_POST_INSTALL_TARGET_HOOKS

Yerk, "undefine". We don't use this anywhere else in Buildroot
packages :-/

Could you consider using gesftpserver ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
