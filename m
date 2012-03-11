From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 23:25:12 +0100
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 11 Mar 2012 18:48:08 -0300")
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wr6qvkqf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  ...nline.patch => alsa-lib-avr32-bad-inline.patch} |    0
 Gustavo>  package/multimedia/alsa-lib/alsa-lib.mk            |   12 +++++++++---
 Gustavo>  2 files changed, 9 insertions(+), 3 deletions(-)
 Gustavo>  rename package/multimedia/alsa-lib/{alsa-lib-1.0.18-avr32-bad-inline.patch => alsa-lib-avr32-bad-inline.patch} (100%)

 Gustavo> diff --git a/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch b/package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch
 Gustavo> similarity index 100%
 Gustavo> rename from package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
 Gustavo> rename to package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch
 Gustavo> diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
 Gustavo> index aa6ca51..d02bbda 100644
 Gustavo> --- a/package/multimedia/alsa-lib/alsa-lib.mk
 Gustavo> +++ b/package/multimedia/alsa-lib/alsa-lib.mk
 Gustavo> @@ -3,18 +3,24 @@
 Gustavo>  # alsa-lib
 Gustavo>  #
 Gustavo>  #############################################################
 Gustavo> -ALSA_LIB_VERSION = 1.0.24.1
 Gustavo> +
 Gustavo> +ALSA_LIB_VERSION = 1.0.25
 Gustavo>  ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 Gustavo>  ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 Gustavo>  ALSA_LIB_INSTALL_STAGING = YES
 Gustavo> -
 Gustavo>  ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 Gustavo> -
 Gustavo>  ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 Gustavo>  		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 Gustavo>  		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
 Gustavo>  		    --without-versioned
 
 Gustavo> +# Can't build with static & shared at the same time (1.0.25+)
 Gustavo> +ifneq ($(BR2_PREFER_STATIC),y)
 Gustavo> +ALSA_LIB_CONF_OPT += --enable-static=no
 Gustavo> +else
 Gustavo> +ALSA_LIB_CONF_OPT += --enable-shared=no
 Gustavo> +endif

I swapped this around to use positive logic and committed, thanks.

-- 
Bye, Peter Korsgaard
