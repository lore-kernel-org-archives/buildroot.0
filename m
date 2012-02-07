From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 7 Feb 2012 15:24:11 +0100
Subject: [Buildroot] [PATCHv2 1/2] Add lpc3250loader to the host tools
In-Reply-To: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
References: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <CAAXf6LV1icxeia44weRDfuoSwkSbmkZRmdNG+wskWOmgGhOGMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 7, 2012 at 12:01 PM, Alexandre Belloni
<alexandre.belloni@piout.net> wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
> ---
> ?package/Config.in.host ? ? ? ? ? ? ? ? | ? ?1 +
> ?package/lpc3250loader/Config.in.host ? | ? ?7 +++++++
> ?package/lpc3250loader/lpc3250loader.mk | ? ?9 +++++++++
> ?3 files changed, 17 insertions(+), 0 deletions(-)
> ?create mode 100644 package/lpc3250loader/Config.in.host
> ?create mode 100644 package/lpc3250loader/lpc3250loader.mk
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1f49e79..861b736 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -1,5 +1,6 @@
> ?menu "Host utilities"
>
> +source "package/lpc3250loader/Config.in.host"
> ?source "package/openocd/Config.in.host"
> ?source "package/sam-ba/Config.in.host"
> ?source "package/uboot-tools/Config.in.host"
> diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
> new file mode 100644
> index 0000000..750080b
> --- /dev/null
> +++ b/package/lpc3250loader/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_LPC3250LOADER
> + ? ? ? bool "host lpc3250loader"
> + ? ? ? help
> + ? ? ? ? lpc3250loader is a tool to load/burn programs (in particular kickstart
> + ? ? ? ? and S1L) on an LPC3250 platform.

Does it make sense to have this config depend on an architecture
specific variable?
Although it would still be very broad, depending on BR2_ARCH_arm could
be a possibility...

This way, users of other architectures are not presented with packages
that are irrelevant for them...

> +
> + ? ? ? ? https://gitorious.org/lpc3250loader
> diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
> new file mode 100644
> index 0000000..e3d5528
> --- /dev/null
> +++ b/package/lpc3250loader/lpc3250loader.mk
> @@ -0,0 +1,9 @@
> +HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
> +HOST_LPC3250LOADER_VERSION = 1.0
> +
> +define HOST_LPC3250LOADER_INSTALL_CMDS
> + ? ? ? mkdir -p $(HOST_DIR)/usr/bin/
> + ? ? ? cp -a $(@D)/* $(HOST_DIR)/usr/bin/
> +endef
> +
> +$(eval $(call GENTARGETS,host))
> --
> 1.7.5.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
