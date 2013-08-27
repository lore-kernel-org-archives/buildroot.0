From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Aug 2013 12:33:35 +0200
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
	+ cleanups
In-Reply-To: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Assaf,

Thanks for your patch. Some comments below...

On Sun, Aug 25, 2013 at 1:13 PM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> This commit introduces a specific BR2_TARGET_GENERIC_GETTY configuration flag.
> This eliminates the need for checking if BR2_TARGET_GENERIC_GETTY_PORT is an
> empty string or not. It also allows hiding various getty options when getty
> isn't enabled.
>
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
> ---
>  system/Config.in |    9 +++++++--
>  system/system.mk |   27 ++++++++++++++-------------
>  2 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/system/Config.in b/system/Config.in
> index d41f184..403b229 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -194,12 +194,16 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>           in the build log! Avoid using a valuable password if either the
>           .config file or the build log may be distributed!
>
> +config BR2_TARGET_GENERIC_GETTY
> +       bool "Run a getty (login prompt) after boot"
> +       default y
> +
> +if BR2_TARGET_GENERIC_GETTY
>  config BR2_TARGET_GENERIC_GETTY_PORT
>         string "Port to run a getty (login prompt) on"
>         default "ttyS0"
>         help
> -         Specify a port to run a getty (login prompt) on.
> -         Set to the empty string to not run a getty.
> +         Specify a port to run a getty on.
>
>  choice
>         prompt "Baudrate to use"
> @@ -235,6 +239,7 @@ config BR2_TARGET_GENERIC_GETTY_TERM
>         default "vt100"
>         help
>           Specify a TERM type.
> +endif

The text of the suboptions to the new getty top-level option are still
somewhat chaotic:
[*] Run a getty (login prompt) after boot
(ttyS0) Port to run a getty (login prompt) on
Baudrate to use (115200)  --->
(vt100) Value to assign the TERM environment variable
()    other options to pass to getty


My proposal is to simplify the suboptions:
[*] Run a getty (login prompt) after boot
(ttyS0) tty port
baudrate (115200)  --->
(vt100) TERM environment variable
()    other options to pass to getty

>
>  config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>         bool "remount root filesystem read-write during boot"
> diff --git a/system/system.mk b/system/system.mk
> index b4ddc3e..c9e7cf7 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -1,14 +1,15 @@
> -TARGET_GENERIC_HOSTNAME := $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> -TARGET_GENERIC_ISSUE := $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
> -TARGET_GENERIC_ROOT_PASSWD := $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
> -TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
> -TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
> -TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
> -TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> +TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> +TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
> +TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
> +TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
> +TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
> +TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
> +TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> +TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))

Although in general = is favored over := in buildroot, I'm now
wondering if this is the right choice here: variable
TARGET_GENERIC_GETTY_PORT is used several times in .mk. If = is used,
the qstrip expansion is done each time, while := will do it once.

Arnout: isn't this ($(call), $(shell), ...) a case where we should
rather use := iso = ?

>
>  target-generic-securetty:
> -       grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
> -               echo '$(TARGET_GENERIC_GETTY)' >> $(TARGET_DIR)/etc/securetty
> +       grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
> +               echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
>
>  target-generic-hostname:
>         mkdir -p $(TARGET_DIR)/etc
> @@ -29,13 +30,13 @@ target-root-passwd:
>         $(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
>
>  target-generic-getty-busybox:
> -       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>                 $(TARGET_DIR)/etc/inittab
>
>  # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
>  # skip the "tty" part and keep only the remaining.
>  target-generic-getty-sysvinit:
> -       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>                 $(TARGET_DIR)/etc/inittab
>
>  # Find commented line, if any, and remove leading '#'s
> @@ -46,7 +47,7 @@ target-generic-do-remount-rw:
>  target-generic-dont-remount-rw:
>         $(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
>
> -ifneq ($(TARGET_GENERIC_GETTY),)
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
>  TARGETS += target-generic-securetty
>  endif
>
> @@ -61,7 +62,7 @@ endif
>  ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
>  TARGETS += target-root-passwd
>
> -ifneq ($(TARGET_GENERIC_GETTY),)
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
>  TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
>  endif
>
> --
> 1.7.9.5

Best regards,
Thomas
