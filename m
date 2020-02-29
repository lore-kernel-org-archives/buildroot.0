From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 11:26:37 -0800
Subject: [Buildroot] [PATCH] package/openrc: remove keymaps units if kbd
 package is not selected
In-Reply-To: <20200229182621.14431-1-unixmania@gmail.com>
References: <20200229182621.14431-1-unixmania@gmail.com>
Message-ID: <CAFSsvmqtLtPthmLRdyVN9cq7WN+9+wF-b_=taq6u6orAqZFV0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;


On Sat, Feb 29, 2020 at 10:26 AM <unixmania@gmail.com> wrote:
>
> From: Carlos Santos <unixmania@gmail.com>
>
> keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
> remove them if the kbd package is not selected (e.g. devices with serial
> console, only).
>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/openrc/openrc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 289bde4d03..dd56d72a1a 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -39,6 +39,16 @@ define OPENRC_INSTALL_TARGET_CMDS
>                 $(TARGET_DIR)/etc/init.d/sysv-rcs
>  endef
>
> +ifeq ($(BR2_PACKAGE_KBD),)
> +# keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
> +# remove them if the kbd package is not selected (e.g. devices with serial
> +# console, only).
Small nitpick: I think generally the comment would go above the ifeq.
> +define OPENRC_NO_KBD
> +       $(RM) $(TARGET_DIR)/etc/{conf.d,init.d,runlevels/boot}/{keymaps,save-keymaps}
> +endef
> +OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_KBD
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NETIFRC),y)
>  # netifrc replaces network, staticroute and loopback services which are
>  # installed by openrc
> --
> 2.18.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Tested-by: Adam Duskett <aduskett@gmail.com>
