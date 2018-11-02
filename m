From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Nov 2018 15:34:33 -0500
Subject: [Buildroot] [PATCH 3/3] fs: fix condition to create static
 devices
In-Reply-To: <99d38f609529976ec574c3a05b6665cf3dd0669d.1540626349.git.yann.morin.1998@free.fr>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <99d38f609529976ec574c3a05b6665cf3dd0669d.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYjYUKjfFfxWhn4Fk273vPkhY93tghY9N0KEJ+4ctisQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Oct 27, 2018 at 2:46 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Currently, we parse the static devices tables even when we're not using
> static device nodes; this is a left over from when we mixed devices
> tables and permissions tables together. Creating package-defined device
> nodes is guarded by the condition that there is at elast one devices

elast -> least

> table.
>
> This means that, when using static device nodes, but no device table, we
> would miss on the package-defined device nodes.
>
> We fix that by inverting the condition: static device tables are now
> parsed only when using static devices, but the package-defined device
> nodes are no longer conditioned to there being at least one devices
> table.
>
> Note: when there is no device table, the package-defined device ndoes

ndoes -> nodes

> are appended to the file. That file can't exist from a previous build,
> because the whole directory is rmoved at the beginning of the rule.

rmoved -> removed

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  fs/common.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index fd1e80ab93..a0699b035d 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -84,11 +84,11 @@ ifneq ($(ROOTFS_USERS_TABLES),)
>         cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
>  endif
>         PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
>         cat $(ROOTFS_STATIC_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> -ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> +endif
>         $(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
> -endif
>         echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
>  endif
>         $(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
> --
