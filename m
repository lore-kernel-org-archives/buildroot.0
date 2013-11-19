From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 19 Nov 2013 14:45:23 +0100
Subject: [Buildroot] [PATCHv3] openssh: add systemd unit file
In-Reply-To: <1384867590-2815-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384867590-2815-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131119134523.GA5234@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Nov 19, 2013 at 10:26:30AM -0300, Gustavo Zacarias wrote:
> And only install sysV-style script when appropiate.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssh/openssh.mk   | 13 +++++++++++--
>  package/openssh/sshd.service | 11 +++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644 package/openssh/sshd.service
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 8ab2b47..8de288a 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -17,8 +17,17 @@ OPENSSH_DEPENDENCIES += linux-pam
>  OPENSSH_CONF_OPT += --with-pam
>  endif
>  
> -define OPENSSH_INSTALL_INITSCRIPT
> -	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
> +define OPENSSH_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 755 package/openssh/sshd.service \
> +		$(TARGET_DIR)/etc/systemd/system/sshd.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../sshd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
> +endef
> +
> +define OPENSSH_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/openssh/S50sshd \
> +		$(TARGET_DIR)/etc/init.d/S50sshd
>  endef
>  
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT

I don't think this is needed anymore.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131119/e6647be3/attachment.asc>
