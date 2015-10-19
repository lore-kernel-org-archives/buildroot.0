From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 19 Oct 2015 21:04:51 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan, all

On Mon, Oct 19, 2015 at 6:24 PM, Jan Viktorin <viktorin@rehivetech.com>
wrote:

> The tool helps to create a working SPL to boot Altera
> SoC FPGA boards.
>
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/mkpimage/mkpimage.mk | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/mkpimage/mkpimage.mk
>
> diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
> new file mode 100644
> index 0000000..e21faf4
> --- /dev/null
> +++ b/package/mkpimage/mkpimage.mk
> @@ -0,0 +1,28 @@
>
> +################################################################################
> +#
> +# mkpimage
> +#
>
> +################################################################################
> +
> +MKPIMAGE_VERSION = d64752876a6185853400498d3a43a5e18681cab7
> +MKPIMAGE_SITE = $(call github,maximeh,mkpimage,$(MKPIMAGE_VERSION))
> +MKPIMAGE_LICENSE = MIT
> +
> +ifndef HOSTGO
> +HOSTGO := go
> +HOSTGO := $(shell which $(HOSTGO) || type -p $(HOSTGO) || echo go)
> +endif
> +
> +define HOST_MKPIMAGE_CONFIGURE_CMDS
> +       $(MAKE) -C $(@D) GOPATH="$(dir $(HOSTGO))" deps
> +endef
> +
> +define HOST_MKPIMAGE_BUILD_CMDS
> +       $(MAKE) -C $(@D) GOPATH="$(dir $(HOSTGO))"
> +endef
> +
> +define HOST_MKPIMAGE_INSTALL_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/bin/mkpimage
> $(HOST_DIR)/usr/bin/mkpimage
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.6.1
>
Thanks a lot for your patch.

It's a bit weird reviewing your patch as I'm the author of the package you
want to add, but here goes:

Even I don't use this tool anymore, after I reversed the code from Altera's
own tool, they released the documentation for the SPL signing and the fine
people at Barebox, created a small program (in C) that does exactly the
same, which you can find there:
http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD

However, I don't know how you would integrate such a tool, having a special
package ? Making U-Boot depends on Barebox sounds a bit crazy. But it would
be lighter than having to grab the go compiler for such a simple program.

Let's wait on what others have to say in the matter.
But anyway, thank you to push this, as it's a real problem that I am
currently solving by having a short mkpimage package with the source of
this scripts included into it.
If you want, I can send it as a patch so you may take it and rework it.


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151019/e7b34375/attachment-0001.html>
