From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 18:14:50 +0200
Subject: [Buildroot] [PATCH 6/6] alsa-lib: update legal info
In-Reply-To: <1467636386-6759-6-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1467636386-6759-6-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160704161450.GF3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> aserver tool is licensed under GPLv2+. It is built if 'shm' pcm plugin
> is enabled. So, specify its license conditionally when it is enabled.
> 
> Reviewed-by: Abhimanyu Vishwakarma <abhimanyu.vishwakarma@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/alsa-lib/alsa-lib.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index ae0377d..163c840 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -12,6 +12,19 @@ ALSA_LIB_LICENSE_FILES = COPYING
>  ALSA_LIB_INSTALL_STAGING = YES
>  ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
>  ALSA_LIB_AUTORECONF = YES
> +
> +ifneq (,$(findstring shm,$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))))

We prefer positive logic, which you can achieve with something like:

    ifeq ($(filter shm,$($(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS)))),shm)

> +ALSA_LIB_HAS_SHM_PLUGIN = y
> +else ifneq (,$(findstring all,$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))))

Ditto.

> +ALSA_LIB_HAS_SHM_PLUGIN = y
> +endif
> +
> +# aserver tool is built when shm pcm plugin is enabled and licensed under GPLv2+
> +ifeq ($(ALSA_LIB_HAS_SHM_PLUGIN),y)
> +ALSA_LIB_LICENSE += , GPLv2+ (aserver tool)

As for libuci, this creates an ill-formatted string. Use the same trick
to fix it. ;-)

Regards,
Yann E. MORIN.

> +ALSA_LIB_LICENSE_FILES += aserver/COPYING
> +endif
> +
>  ALSA_LIB_CONF_OPTS = \
>  	--with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
>  	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
