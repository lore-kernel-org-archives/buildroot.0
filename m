From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 17:31:45 +0200
Subject: [Buildroot] [PATCH v4 1/7] barebox: support multi-image-build
 image selection
In-Reply-To: <1458513351-6556-2-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-2-git-send-email-pieter@boesman.nl>
Message-ID: <20160402173145.656f9814@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks a lot for keeping up the work on this topic!

On Sun, 20 Mar 2016 23:35:45 +0100, Pieter Smith wrote:

>  define BAREBOX_INSTALL_IMAGES_CMDS
> -	if test -h $(@D)/barebox-flash-image ; then \
> -		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
> +	if test -e $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
> +		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
>  	else \
> -		cp $(@D)/barebox.bin $(BINARIES_DIR);\
> +		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
>  	fi
>  	$(BAREBOX_INSTALL_CUSTOM_ENV)

I think I don't like two things here:

 1/ That it potentially breaks existing configurations, where
    barebox.bin was used.

 2/ That is automatically searches in images/, which this could be made
    explicit rather than implicit.

So, what about changing this to:

 1/ Have an option that defaults to empty, and if it's empty, preserves
    the current behavior.

 2/ Change the code in the .mk file to do:

BAREBOX_IMAGE_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)

ifeq ($(BAREBOX_IMAGE_FILE),)
define BARBEOX_INSTALL_IMAGE
	# old code here, using barebox-flash-image, falling back to barebox.bin
endef
else
define BAREBOX_INSTALL_IMAGE
	# install BAREBOX_IMAGE_FILE
endef
endif

and that's it?

Alternatively, you could do that with shell conditionals only, testing
is BAREBOX_IMAGE_FILE is empty or not. This may be even easier to read:

	if test -n $(BAREBOX_IMAGE) ; then
		install $(BAREBOX_IMAGE)
	elif test -h $(@D)/barebox-flash-image ; then
		cp -L $(@D)/barebox-flash-image ...
	else
		cp $(@D)/barebox.bin ...
	fi

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
