From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 01 Aug 2016 22:29:07 +0200
Subject: [Buildroot] [PATCH/RFC 1/1] package/libglob: new package
In-Reply-To: <1469982560-13681-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469982560-13681-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1470083347.4303.12.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On So, 2016-07-31 at 18:29 +0200, Bernd Kuhls wrote:
> Needed for packages which need GLOB_BRACE & GLOB_NOMAGIC. These
> defines
> are not provided by musl toolchains.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

sorry, I didn't noticed you already submitted a patch to add libglob. I
submitted a similar patch, too:?http://lists.busybox.net/pipermail/buil
droot/2016-August/168908.html.

Thanks to Thomas for pointing that out.

> ---
> This patch is aimed at fixing the compilation of Openswan with musl,
> but
> the Openswan package needs many more patches so I am sending this
> package
> to be picked-up by other users trying to fix Openswan.
> 
> ?package/Config.in????????????|??1 +
> ?package/libglob/Config.in????|??3 +++
> ?package/libglob/libglob.hash |??2 ++
> ?package/libglob/libglob.mk???| 27 +++++++++++++++++++++++++++
> ?4 files changed, 33 insertions(+)
> ?create mode 100644 package/libglob/Config.in
> ?create mode 100644 package/libglob/libglob.hash
> ?create mode 100644 package/libglob/libglob.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 645fa29..54e9368 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1291,6 +1291,7 @@ menu "Other"
> ?	source "package/libffi/Config.in"
> ?	source "package/libgee/Config.in"
> ?	source "package/libglib2/Config.in"
> +	source "package/libglob/Config.in"
> ?	source "package/libical/Config.in"
> ?	source "package/liblinear/Config.in"
> ?	source "package/libnspr/Config.in"
> diff --git a/package/libglob/Config.in b/package/libglob/Config.in
> new file mode 100644
> index 0000000..37ee520
> --- /dev/null
> +++ b/package/libglob/Config.in
> @@ -0,0 +1,3 @@
> +config BR2_PACKAGE_LIBGLOB
> +	bool
> +	default y if BR2_TOOLCHAIN_USES_MUSL

So you make it non-selectable for the user. Probably it's okay, as
there is no need for this package besides allowing packages needing the
glob implementation to be build with musl.

> diff --git a/package/libglob/libglob.hash
> b/package/libglob/libglob.hash
> new file mode 100644
> index 0000000..591d20a
> --- /dev/null
> +++ b/package/libglob/libglob.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256
> 4f1b204dad065689941c64828a92441fb316c9c7539b39525fa728125da65e22??lib
> glob-1.0.tar.gz
> diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
> new file mode 100644
> index 0000000..eeca67a
> --- /dev/null
> +++ b/package/libglob/libglob.mk
> @@ -0,0 +1,27 @@
> +####################################################################
> ############
> +#
> +# libglob
> +#
> +####################################################################
> ############
> +
> +LIBGLOB_VERSION = 1.0
> +LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
> +LIBGLOB_LICENSE = BSD-3c
> +LIBGLOB_LICENSE_FILES = LICENSE
> +
> +LIBGLOB_ADD_TOOLCHAIN_DEPENDENCY = NO
> +LIBGLOB_INSTALL_STAGING = YES
> +
> +define LIBGLOB_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define LIBGLOB_INSTALL_STAGING_CMDS
> +	$(MAKE) PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D) install
> +endef
> +
> +define LIBGLOB_INSTALL_TARGET_CMDS
> +	$(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef

This installs both, the shared and the static files.

> +
> +$(eval $(generic-package))

Best regards
J?rg Krause
