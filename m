From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Jul 2020 06:46:20 -0500
Subject: [Buildroot] [PATCH 1/1] package/hostapd: add support for
 hostapd_cli
In-Reply-To: <20200720102247.9780-1-marco.oliverio@tanaza.com>
References: <20200720102247.9780-1-marco.oliverio@tanaza.com>
Message-ID: <CANQCQpaFFBLeNcKz95AQjGkadMM9k6_iS0JuZ1eBD7hpb0yD6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marco,


On Mon, Jul 20, 2020 at 5:24 AM Marco Oliverio
<marco.oliverio@tanaza.com> wrote:
>
> Signed-off-by: Marco Oliverio <marco.oliverio@tanaza.com>
> ---
>  package/hostapd/Config.in  | 6 ++++++
>  package/hostapd/hostapd.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 54d2086c09..185fa04626 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -111,4 +111,10 @@ comment "netlink-based VLAN support needs a toolchain w/ threads"
>
>  endif # BR2_PACKAGE_HOSTAPD_VLAN
>
> +config BR2_PACKAGE_HOSTAPD_HOSTAPD_CLI
> +       bool "Install hostapd_cli"
> +       default n
> +       help
> +         Install hostapd command-line interface
> +
>  endif
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index b94a0e4578..d65e4b03fd 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -144,4 +144,12 @@ define HOSTAPD_INSTALL_TARGET_CMDS
>                 $(TARGET_DIR)/etc/hostapd.conf
>  endef
>
> +ifeq ($(BR2_PACKAGE_HOSTAPD_HOSTAPD_CLI),y)
> +define HOSTAPD_INSTALL_TARGET_CMDS +=

Future note, instead of the += you'd need to define a new variable and
then call it in the HOSTAPD_INSTALL_TARGET_CMDS.

> +
> +       $(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
> +               $(TARGET_DIR)/usr/sbin/hostapd_cli

It looks like the  HOSTAPD_INSTALL_TARGET_CMDS stage already is
installing the cli tool with the main service and default conf file.
Do you have an example where that wasn't working?

Regards,
Matt
