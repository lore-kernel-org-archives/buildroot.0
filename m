From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 23:55:41 +0200
Subject: [Buildroot] [PATCH 1/4] Create package/freescale-imx directory
 With current version and download site
In-Reply-To: <1368121316-3645-2-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368121316-3645-2-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <20130509235541.6a916afe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henk Fijnvandraat,

The first line of your commit log is too long. A commit log should look
like:

"""
A first line of less than ~80 characters to summarize the commit

Some more paragraphs here to explain what you're doing. The important
thing is that there is an empty new line between the summary line, and
the following paragraphs.

And some more details.

Signed-off-by: Someone <foo@bar.com>
"""

On Thu,  9 May 2013 19:41:53 +0200, Henk Fijnvandraat wrote:

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> new file mode 100644
> index 0000000..8d0e347
> --- /dev/null
> +++ b/package/freescale-imx/Config.in
> @@ -0,0 +1,16 @@
> +comment "freescale-imx is only relevant for the i.MXxx series from Freescale"
> +	depends on BR2_arm
> +
> +menuconfig BR2_PACKAGE_IMX
> +	bool "freescale-imx"
> +	depends on BR2_arm
> +	help
> +	  This option enables the selection of some packages specific for
> +	  the i.MXxx series of processors from Freescale.
> +	  freescale-imx needs an imx-specific kernel to be built
> +
> +
> +if BR2_PACKAGE_IMX
> +source "package/freescale-imx/imx-lib/Config.in"
> +source "package/freescale-imx/firmware-imx/Config.in"
> +endif

This doesn't work: you're moving the packages only in PATCH 2/4.

We try to make patches bisectable: i.e, the code should work at any
point in the patch series. Imagine what happens if your PATCH 1/4 gets
applied and not the following ones.

Suggestion:

 * PATCH 1 adds freescale-imx/Config.in and freescale-imx/freescale.mk,
   but the Config.in doesn't source the imx-lib/Config and
   firmware-imx/Config.in.

 * PATCH 2 moves the imx-lib package into package/freescale-imx/

 * PATCH 3 moves the firmware-imx package into package/freescale-imx/

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
