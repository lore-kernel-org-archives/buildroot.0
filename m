From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:07:58 +0200
Subject: [Buildroot] [PATCH v6 1/4] imx-mkimage: new package
In-Reply-To: <1520682702-10035-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180409220758.5b9b801d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Again, thanks for this contribution!

On Sat, 10 Mar 2018 12:51:39 +0100, Erik Larsson wrote:
> This package add support for imx-mkimage for iMX8M.
> Currently the only hardware it's tested for.
> 
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>

Thanks, I've applied to master, after doing a few changes. I also have
one request. See below.

>  package/Config.in.host                             |  1 +
>  ...-for-overriding-bl32-and-bl33-not-only-bl.patch | 58 ++++++++++++++++++++++
>  .../0002-add-ldflags-to-link-step.patch            | 26 ++++++++++
>  package/imx-mkimage/Config.in.host                 |  7 +++
>  package/imx-mkimage/imx-mkimage.hash               |  3 ++
>  package/imx-mkimage/imx-mkimage.mk                 | 24 +++++++++
>  6 files changed, 119 insertions(+)

You forgot to add an entry in the DEVELOPERS file for this new package,
so I've done so.


> diff --git a/package/imx-mkimage/0002-add-ldflags-to-link-step.patch b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
> new file mode 100644
> index 0000000..22c6a7d
> --- /dev/null
> +++ b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
> @@ -0,0 +1,26 @@
> +From a73f20fbe921c7ecff3efda23bc506fdd935ee4d Mon Sep 17 00:00:00 2001
> +From: Erik Larsson <erik.larsson@combitech.se>
> +Date: Tue, 6 Mar 2018 12:28:39 +0100
> +Subject: [PATCH 1/2] Add LDFLAGS to link step
> +
> +Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>

This commit log really needs to be extended. What was the need to add
LDFLAGS ? It seems like a very simple program, which could be built
without special LDFLAGS. What was the issue that lead you to add this
patch ?


> +define HOST_IMX_MKIMAGE_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin
> +	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin

We prefer a complete destination path that includes the name of the
file to install. Indeed, with the way you have written the commands, if
$(HOST_DIR)/bin doesn't exist as a directory, mkimage_imx8 will be
installed as a file called "bin" in $(HOST_DIR). I've also fixed this
when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
