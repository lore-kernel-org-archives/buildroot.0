From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 5 Feb 2020 15:08:41 +0100
Subject: [Buildroot] [PATCH v4 1/9] package/nxp: new package directory
In-Reply-To: <20200205105227.13698-1-jerry.huang@nxp.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
Message-ID: <CAEyMn7YhNQE8AaUu7vzpoO-TPcYgr5qWADKB-geq3AAj_MHZdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Changming,

> +################################################################################
> +#
> +# helper
> +#
> +################################################################################
> +
> +# Helper for self-extracting binaries distributed by NXP.
> +#
> +# The --force option makes sure it doesn't fail if the source
> +# directory already exists. The --auto-accept skips the license check,
> +# as it is not needed in Buildroot because we have legal-info. Since
> +# there's a EULA in the binary file, we extract it in this macro, and
> +# it should therefore be added to the LICENSE_FILES variable of
> +# packages using this macro. Also, remember to set REDISTRIBUTE to
> +# "NO". Indeed, this is a legal minefield: the EULA specifies that the
> +# Board Support Package includes software and hardware (sic!) for
> +# which a separate license is needed...
> +#
> +# $(1): full path to the archive file
> +#
> +define NXP_EXTRACT_HELPER
> +       awk 'BEGIN      { start = 0; } \
> +            /^EOEULA/  { start = 0; } \
> +                       { if (start) print; } \
> +            /<<EOEULA/ { start = 1; }' \
> +           $(1) > $(@D)/EULA
> +       cd $(@D) && sh $(1) --force --auto-accept
> +       find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> +       rmdir $(@D)/$(basename $(notdir $(1)))
> +endef
> +
> +include $(sort $(wildcard package/nxp/*/*.mk))

This seems to be a duplication of the FREESCALE_IMX_EXTRACT_HELPER, isn't it?

Do we then can remove the other one and use only the new "nxp" one?

By the way is there a plan to move all NXP specific packages (qoriq
and imx) to the nxp subdir?

--
Heiko
