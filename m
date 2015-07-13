From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jul 2015 00:51:19 +0200
Subject: [Buildroot] [PATCH v2 2/4] linux-tools: add cpupower
In-Reply-To: <1436822225-29591-3-git-send-email-romain.naour@openwide.fr>
References: <1436822225-29591-1-git-send-email-romain.naour@openwide.fr>
 <1436822225-29591-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAHXCMMK_YLZLifoz3U4x7B82H0jseWbEg0Xb19dHsU7zQOX0Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, all,

On Mon, Jul 13, 2015 at 11:17 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> This patch is based on the patch send by James Knight:
> http://lists.busybox.net/pipermail/buildroot/2015-May/128754.html
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: James Knight <james.knight@rockwellcollins.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v2: remove LINUX_TOOL prefix
>     use $(D) instead of $(LINUX_DIR)
>     fix title style
> ---
[...]
> diff --git a/linux/linux-tool-cpupower.mk b/linux/linux-tool-cpupower.mk
> new file mode 100644
> index 0000000..5c04905
> --- /dev/null
> +++ b/linux/linux-tool-cpupower.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# cpupower
> +#
> +################################################################################
> +
> +LINUX_TOOLS += cpupower
> +
> +CPUPOWER_DEPENDENCIES = pciutils
> +
> +define CPUPOWER_BUILD_CMDS
> +       $(Q)if test ! -f $(@D)/tools/power/cpupower/Makefile ; then \
> +               echo "Your kernel version is too old and does not have the cpupower tool." ; \
> +               echo "At least kernel 3.4 must be used." ; \
> +               exit 1 ; \
> +       fi
> +
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
> +               CROSS=$(TARGET_CROSS) \
> +               CPUFREQ_BENCH=false \
> +               DEBUG=false \
You could store these 3 options in a CPUPOWER_MAKE_OPTS variable, then
use it here and in the others commands below.

> +               cpupower
> +endef
> +
> +define CPUPOWER_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
> +               CROSS=$(TARGET_CROSS) \
> +               CPUFREQ_BENCH=false \
> +               DEBUG=false \
> +               DESTDIR=$(STAGING_DIR) \
> +               cpupower_install
> +endef
> +
> +define CPUPOWER_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
> +               CROSS=$(TARGET_CROSS) \
> +               CPUFREQ_BENCH=false \
> +               DEBUG=false \
> +               DESTDIR=$(TARGET_DIR) \
> +               cpupower_install
> +endef
> --
> 2.4.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
