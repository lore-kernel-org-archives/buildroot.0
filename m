From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:48:44 +0100
Subject: [Buildroot] [PATCH] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <1574765013-15209-1-git-send-email-angelo@amarulasolutions.com>
References: <1574765013-15209-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20191126124844.6f963100@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 11:43:33 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Kconfig based packages are not really reconfigured if the .config file is not
> regenerated in the reconfigure target.

I think the commit log could be improved, with at least a reference to
4b81badbcc0b25678ac6627548160702731cf393, which says:

    Currently, calling foo-reconfigure for a kconfig-based package will not
    re-trigger the configuration (kconfig-wise) step for the package.

However, the implementation consisted in removing just the
.stamp_kconfig_fixup_done, so only the kconfig fixups get redone on
-reconfigure, not a full regeneration of the configuration.

Right now the commit log is not really clear on what is happening
today, why it is considered not good, and what is the new proposed
behavior.

>  $(1)-clean-kconfig-for-reconfigure:
>  	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done

You can remove this line, it is no longer needed.

> +	rm -f $$($(2)_DIR)/.stamp_dotconfig

Use:

	rm -rf $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)

instead.

Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
