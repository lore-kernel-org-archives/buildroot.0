From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Sep 2017 00:03:28 +0200
Subject: [Buildroot] [PATCH v3 2/6] board: icorem6: Add Qt5 configs for
 800x480 LVDS display
In-Reply-To: <1505302931-17387-3-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
 <1505302931-17387-3-git-send-email-jteki@openedev.com>
Message-ID: <55e090ef-55ce-eebe-a1f4-fa7320ac5f6a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I was about to apply, but...

On 13-09-17 13:42, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> i.CoreM6 Starter Kit has 800x480 LVDS display, this patch adds
> relevant qt5 configs with supports opensource Etnaviv graphical stack.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[snip]
> diff --git a/board/engicam/icorem6/linux_qt5.fragment b/board/engicam/icorem6/linux_qt5.fragment
> new file mode 100644
> index 0000000..5c0505e
> --- /dev/null
> +++ b/board/engicam/icorem6/linux_qt5.fragment
> @@ -0,0 +1,4 @@
> +# Currently kernel mainline exhibits issues when running cpufreq as ondemand
> +# governor on mx6.
> +# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> +CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y

 This is the same as board/freescale/imx6-sabresd/linux_qt5.fragment, perhaps
that file could be used directly?

> diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt

[snip]
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> new file mode 100644
> index 0000000..ac139a3
> --- /dev/null
> +++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> @@ -0,0 +1,11 @@
> +{
> +  "device": "/dev/dri/card1",

 Fabio (in Cc) changed this to card0 with the bump to Linux 4.13.3. For the
iCore this is not needed?

> +  "hwcursor": false,
> +  "pbuffers": true,
> +  "outputs": [
> +    {
> +      "name": "LVDS-1",
> +      "mode": "800x480"
> +    }

 Fabio explicitly turns off HDMI. Not needed?

> +  ]
> +}

[snip]

> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"

 Fabio converted the imx6-sabresd to SPL boot, so that the same defconfig can be
used for different boards. Could the enigcam boards use the same defconfig?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
