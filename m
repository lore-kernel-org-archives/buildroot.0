From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 22 Jan 2015 16:25:34 -0500
Subject: [Buildroot] [PATCH 1/3] cgic: new package
In-Reply-To: <1421953904-9156-1-git-send-email-codehero@gmail.com>
References: <20150117192144.GA2827@tarshish>
 <1421953904-9156-1-git-send-email-codehero@gmail.com>
Message-ID: <CANxTyt6LcBao5NVi1ttonGU1yCYDZgqscBuW8cVjcjENyOJizg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

On Thu, Jan 22, 2015 at 2:11 PM, David Bender <codehero@gmail.com> wrote:
snip
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# cgic
> +#
> +################################################################################
> +
> +CGIC_VERSION = 2.06
> +CGIC_SOURCE = cgic206.tar.gz
> +CGIC_SITE = http://boutell.com/cgic
> +CGIC_LICENSE = Custom
> +CGIC_LICENSE_FILES = license.txt
> +
> +CGIC_ENV = AR=$(TARGET_CROSS)ar \
> +       CC=$(TARGET_CROSS)gcc \
> +       RANLIB=$(TARGET_CROSS)ranlib
> +

Could use TARGET_CONFIGURE_OPTS instead of defining your own CGIC_ENV.

> +define CGIC_BUILD_CMDS
> +       (cd $(@D); \
> +               $(CGIC_ENV) \
> +               make libcgic.a \
> +               )
> +endef

Instead of a compound cd/make, why not just use -C?
Should use $(MAKE) as well.

define CGIC_BUILD_CMDS
    $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) libcgic.a
endef

Same comment for the steps below.

Danomi -

> +
> +define CGIC_INSTALL_STAGING_CMDS
> +       (cd $(@D); \
> +               PREFIX=$(STAGING_DIR) make install \
> +               )
> +endef
> +
> +define CGIC_INSTALL_TARGET_CMDS
> +       (cd $(@D); \
> +               PREFIX=$(TARGET_DIR) make install \
> +               )
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.7.8.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
