From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 19 Nov 2018 21:28:59 +0100
Subject: [Buildroot] [PATCH next 1/2] package/pkg-luarocks: drop flock
 at installation time
In-Reply-To: <20181119103227.24726-2-thomas.petazzoni@bootlin.com>
References: <20181119103227.24726-1-thomas.petazzoni@bootlin.com>
 <20181119103227.24726-2-thomas.petazzoni@bootlin.com>
Message-ID: <CAB0FRsu5=s7c2uOA9gtbAwsbLZn1gY5goaFCxhRYw_WHLOXE2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 19 nov. 2018 ? 11:32, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> In commit 22b327fc743b48a33aec0a9190bd67118641b294 ("pkg-luarocks: fix
> top-level parallel makefile support"), a flock on $(TARGET_DIR) was
> added to ensure that two Luarocks packages are not installed at the
> same time.
>
> However, to support top-level parallel build, we have now clearly
> decided that per-package folders is a requirement. Therefore,
> TARGET_DIR is anyway going to be different for each package, making
> this flock unnecessary.
>
> Trying to use top-level parallel build without per-package folder is
> simply not supported, so this commit drops the unnecessary flock.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

---
>  package/pkg-luarocks.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> index 29c5e66cd1..f0985433b7 100644
> --- a/package/pkg-luarocks.mk
> +++ b/package/pkg-luarocks.mk
> @@ -63,7 +63,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -       cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) flock $$(TARGET_DIR) \
> +       cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) \
>                 $$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC)
> $$($(2)_BUILD_OPTS)
>  endef
>  endif
> --
> 2.19.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181119/3b6f5b56/attachment.html>
