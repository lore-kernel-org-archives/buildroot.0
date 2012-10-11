From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Oct 2012 22:25:02 +0200
Subject: [Buildroot] [PATCH v2] googlefontdirectory: new package
In-Reply-To: <1349947685-7261-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 11 Oct 2012 10:28:05 +0100")
References: <1349947685-7261-1-git-send-email-spdawson@gmail.com>
Message-ID: <87obk84uzl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Note that the Google code project does not provide an archive containing
 spdawson> just the font files. This package uses the third party archive provided at

 spdawson>   http://joemaller.com/1856/download-google-fonts/

 spdawson> Further information is available at the following URL.

 spdawson>   http://code.google.com/p/googlefontdirectory/issues/detail?id=2

Thanks, looks a lot better!

 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# googlefontdirectory
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +GOOGLEFONTDIRECTORY_VERSION = 1.0

I don't like us inventing versions, so I dropped this line
(infrastructure then uses 'undefined' like for makedevs).

 spdawson> +GOOGLEFONTDIRECTORY_SITE = \
 spdawson> +	https://s3.amazonaws.com/joemaller_google_webfonts
 spdawson> +GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
 spdawson> +GOOGLEFONTDIRECTORY_LICENSE = OFLv1.1
 spdawson> +
 spdawson> +GOOGLEFONTDIRECTORY_FONTS = \
 spdawson> +	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
 spdawson> +
 spdawson> +define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 spdawson> +	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
 spdawson> +	do \
 spdawson> +		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
 spdawson> +		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf \

You are missing a ';' after ttf

 spdawson> +	done
 spdawson> +endef
 spdawson> +
 spdawson> +define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
 spdawson> +	$(RM) -r \
 spdawson> +	$(foreach i,$(GOOGLEFONTDIRECTORY_FONTS),$(TARGET_DIR)/usr/share/fonts/$(i))

We more commonly use $(addprefix
$(TARGET_DIR)/usr/share/fonts/,$(GOOGLEFONTDIRECTORY_FONTS)) instead of
foreach, so I changed it to use that instead.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
