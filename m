From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 18:15:03 +0200
Subject: [Buildroot] [PATCH v4 2/4] linux: add custom linux logo
In-Reply-To: <1535118300-26815-2-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Fri, 24 Aug 2018 15:44:58 +0200")
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
 <1535118300-26815-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87woqb5la0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > This patch adds a simple way to change the linux bootup logo.
 > The patch was kept purposely simple to support only the use cause
 > where a user needs a color linux boot up logo.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  linux/Config.in | 10 ++++++++++
 >  linux/linux.mk  | 15 +++++++++++++++
 >  2 files changed, 25 insertions(+)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index b7bee99..9a410b1 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -188,6 +188,16 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 >  	  A space-separated list of kernel configuration fragment files,
 >  	  that will be merged to the main kernel configuration file.
 
 > +config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
 > +	string "Custom logo file path"

It is IMHO not directly clear what this logo is about, so I've changed
it to:

Custom boot logo file path

> +	help
 > +	  Change the linux boot logo with your own graphics,
 > +	  it can be used as an early bootsplash, framebuffer support
 > +	  should be enabled to have this feature working.

Instead of describing that framebuffer support should be enabled, we
should just enable it.

This help text is IMHO not so clear. I've rewored it to:

          Use a custom Linux framebuffer boot logo.
          Custom logo should be in PNG or JPEG format, it will be


> +	  Custom logo should be in png or jpg, it will be
 > +	  converted to the linux kernel format (224 colors only)
 > +	  and copied over the original logo file.
 > +
 >  #
 >  # Binary format
 >  #
 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index 675e790..e38c7de 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -248,6 +248,18 @@ define LINUX_TRY_PATCH_TIMECONST
 >  endef
 >  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
 > +LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
 > +ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
 > +LINUX_DEPENDENCIES += host-imagemagick
 > +LINUX_KERNEL_CUSTOM_LOGO = y

This variable isn't really needed as the $(if logic can just use
LINUX_KERNEL_CUSTOM_LOGO_PATH directly.

> +define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
 > +	$(HOST_DIR)/usr/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \

convert gets installed in $(HOST_DIR)/bin, so we should use that.

 > +	$(if $(LINUX_KERNEL_CUSTOM_LOGO),
 > +		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
 > +		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))

We should also enable CONFIG_FB.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
