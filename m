From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Aug 2013 12:58:55 +0200
Subject: [Buildroot] [PATCH] getty: add the ability to pass options to
	getty
In-Reply-To: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
References: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <CAAXf6LUHMReVczEir1yXai13-jHm_zBkXQN=T-OvNdWL_BTy2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 22, 2013 at 7:12 AM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
> ---
>  system/Config.in |    7 +++++++
>  system/system.mk |    5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/system/Config.in b/system/Config.in
> index d41f184..16558bf 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -230,6 +230,13 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
>         default "57600"         if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
>         default "115200"        if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
>
> +config BR2_TARGET_GENERIC_GETTY_OPTIONS
> +       string "other random options to pass to getty"

I would remove the 'random': options you pass here are not random but
probably well-chosen.

> +       default ""
> +       help
> +         Any other flags you want to pass to gettey,
> +         Refer to getty --help for details.
> +
>  config BR2_TARGET_GENERIC_GETTY_TERM
>         string "Value to assign the TERM environment variable"
>         default "vt100"


There are now a number of getty-related config options in
system/Config.in, but without any structure.
When the getty port is empty, no action is taken.
What about introducing a new bool option to determine if a getty needs
to be started, with suboptions for port, baudrate, term, and
user-configurable options?
Something like:

config BR2_TARGET_GENERIC_GETTY
        bool "Run a getty (login prompt) after boot"

config BR2_TARGET_GENERIC_GETTY_PORT
        bool "tty port"
        depends on BR2_TARGET_GENERIC_GETTY

choice
        prompt "baudrate"
        depends on BR2_TARGET_GENERIC_GETTY

[baudrate options]
endchoice

config BR2_TARGET_GENERIC_GETTY_TERM
        bool "TERM environment variable"
        depends on BR2_TARGET_GENERIC_GETTY

config BR2_TARGET_GENERIC_GETTY_OPTIONS
        string "other options to pass to getty"
        depends on BR2_TARGET_GENERIC_GETTY


This creates some structure, and hides all non-relevant options when
the user does not want a getty.
In this case, system/system.mk will need a few adaptations to check
the new symbol instead of for the emptiness of _PORT.

Best regards,
Thomas


> diff --git a/system/system.mk b/system/system.mk
> index b4ddc3e..925f3f4 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -5,6 +5,7 @@ TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD
>  TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
>  TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
>  TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> +TARGET_GENERIC_GETTY_OPTIONS:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
>
>  target-generic-securetty:
>         grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
> @@ -29,13 +30,13 @@ target-root-passwd:
>         $(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
>
>  target-generic-getty-busybox:
> -       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>                 $(TARGET_DIR)/etc/inittab
>
>  # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
>  # skip the "tty" part and keep only the remaining.
>  target-generic-getty-sysvinit:
> -       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>                 $(TARGET_DIR)/etc/inittab
>
>  # Find commented line, if any, and remove leading '#'s
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
