From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 08:02:33 +0200
Subject: [Buildroot] [PATCH] getty: add the ability to pass options to
 getty
In-Reply-To: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
References: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <5215A979.2020708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 07:12, Assaf Inbal wrote:
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (for -next)

  With some minor fixes, though:

> ---
>   system/Config.in |    7 +++++++
>   system/system.mk |    5 +++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/system/Config.in b/system/Config.in
> index d41f184..16558bf 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -230,6 +230,13 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
>   	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
>   	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
>
> +config BR2_TARGET_GENERIC_GETTY_OPTIONS
> +	string "other random options to pass to getty"
> +	default ""
> +	help
> +	  Any other flags you want to pass to gettey,

  gettey -> getty

> +	  Refer to getty --help for details.
> +
>   config BR2_TARGET_GENERIC_GETTY_TERM
>   	string "Value to assign the TERM environment variable"
>   	default "vt100"
> diff --git a/system/system.mk b/system/system.mk
> index b4ddc3e..925f3f4 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -5,6 +5,7 @@ TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD
>   TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
>   TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
>   TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> +TARGET_GENERIC_GETTY_OPTIONS:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))

  Don't copy the incorrect coding style :-) Use = instead of := and put 
spaces around it.

>
>   target-generic-securetty:
>   	grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
> @@ -29,13 +30,13 @@ target-root-passwd:
>   	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
>
>   target-generic-getty-busybox:
> -	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \

  This line could really use some splitting... But maybe that's not the 
responsibility of this patch.


  Regards,
  Arnout

>   		$(TARGET_DIR)/etc/inittab
>
>   # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
>   # skip the "tty" part and keep only the remaining.
>   target-generic-getty-sysvinit:
> -	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>   		$(TARGET_DIR)/etc/inittab
>
>   # Find commented line, if any, and remove leading '#'s
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
