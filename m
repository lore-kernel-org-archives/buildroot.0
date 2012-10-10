From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 23:17:17 +0200
Subject: [Buildroot] [PATCH] googlefontdirectory: new package
In-Reply-To: <1343053494-21248-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 23 Jul 2012 15:24:54 +0100")
References: <1343053494-21248-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r4p658o2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

Hi,

Sorry for the slow response - See below for comments.

 spdawson> +++ b/package/googlefontdirectory/Config.in
 spdawson> @@ -0,0 +1,13 @@
 spdawson> +config BR2_PACKAGE_GOOGLEFONTDIRECTORY
 spdawson> +	bool "Google Web Fonts"

It's a bit odd to see such a difference in Kconfig symbol name and help
text - But OK, they mix it up on the website as well.


 spdawson> +	help
 spdawson> +	  Download Google Web Fonts

Please drop 'Download'. All packages download.

 spdawson> +++ b/package/googlefontdirectory/googlefontdirectory.mk
 spdawson> @@ -0,0 +1,36 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# googlefontdirectory
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +GOOGLEFONTDIRECTORY_VERSION = 1.0
 spdawson> +GOOGLEFONTDIRECTORY_SITE = \
 spdawson> +	https://s3.amazonaws.com/joemaller_google_webfonts

Is that the official location? I don't seem to see anything referring to
a 1.0 release on the google code page.

Please add a license tag as well.


 spdawson> +GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
 spdawson> +
 spdawson> +GOOGLEFONTDIRECTORY_FONTS = \
 spdawson> +	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
 spdawson> +
 spdawson> +define GOOGLEFONTDIRECTORY_INSTALL_SINGLE_FONT
 spdawson> +	$(info Installing single font $(1))
 spdawson> +	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$(1)
 spdawson> +	cp -a $(@D)/$(1)/*.ttf	$(TARGET_DIR)/usr/share/fonts/$(1)
 spdawson> +	chmod 0644 $(TARGET_DIR)/usr/share/fonts/$(1)/*.ttf
 spdawson> +endef

A simple loop for all fonts seems simpler / more standard than this
single-font macro.


-- 
Bye, Peter Korsgaard
