From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 11:30:41 +0200
Subject: [Buildroot] [PATCH 1/1 V2] new package : jquery-mobile
In-Reply-To: <1381786739-15234-1-git-send-email-sagaert.johan@skynet.be>
References: <1381786739-15234-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20131015113041.2f1125b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Mon, 14 Oct 2013 23:38:59 +0200, Sagaert Johan wrote:
> 
> V2 : simplified file copying. 
> Thanks for the hints Thomas !

This "personal" comment and changelog should go below the "---" so it
doesn't become part of the git history. See
http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog.

Also, you sent many versions of this patch, without changing the title
to contain a version number. It'd be great to avoid that in the
future :-)

> diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
> new file mode 100644
> index 0000000..2f2e30f
> --- /dev/null
> +++ b/package/jquery-mobile/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_JQUERY_MOBILE
> +	bool "jQuery-Mobile"

All lower-case for the prompt, I suggest.

Also, still no select BR2_PACKAGE_JQUERY ? You don't need jquery to be
installed? jquery-mobile is completely standalone?

> +	help
> +	  jQuery-Mobile is a unified, HTML5-based user interface system
> +	  for all popular mobile device platforms, built on the rock-solid
> +	  jQuery and jQuery UI foundation.
> +	  Its lightweight code is built with progressive enhancement,
> +	  and has a flexible, easily themeable design.
> +
> +	  http://jquerymobile.com
> +	  
> +if BR2_PACKAGE_JQUERY_MOBILE
> +config BR2_PACKAGE_JQUERY_MOBILE_FULL
> +	bool "jquery mobile development files"
> +	help
> +		Installs the development versions.

Wrong indentation. See my previous review.

> +
> +config BR2_PACKAGE_JQUERY_MOBILE_DEMOS
> +	bool "jquery mobile demo files"
> +	help
> +		Installs the demo files.
> +		The main demo page is http://hostname/demo.html	

Wrong indentation. See my previous review.

> +endif
> +	  
> diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
> new file mode 100644
> index 0000000..e0dcf91
> --- /dev/null
> +++ b/package/jquery-mobile/jquery-mobile.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# jquery-mobile
> +#
> +################################################################################
> +
> +JQUERY_MOBILE_VERSION = 1.3.2
> +JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
> +JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
> +JQUERY_MOBILE_LICENSE = MIT
> +
> +define JQUERY_MOBILE_EXTRACT_CMDS
> +	unzip -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
> +endef
> +
> +JQUERY_MOBILE_INSTALLED_FILES = \
> +	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).min.css \
> +	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).min.css \
> +	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.css \
> +	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.map \
> +	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.js
> +
> +ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_FULL),y)
> +JQUERY_MOBILE_INSTALLED_FILES += \
> +	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).css \
> +	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).css \
> +	jquery.mobile-$(JQUERY_MOBILE_VERSION).css \
> +	jquery.mobile-$(JQUERY_MOBILE_VERSION).js
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
> +define JQUERY_MOBILE_INSTALL_DEMOS
> +	mkdir -p $(TARGET_DIR)/var/www/demos
> +	cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos
> +	$(INSTALL) -m 0644 -D $(@D)/index.html $(TARGET_DIR)/var/www/demo.html
> +endef
> +endif
> +
> +define JQUERY_MOBILE_INSTALL_TARGET_CMDS
> +	for f in $(JQUERY_MOBILE_INSTALLED_FILES) ; do \
> +		$(INSTALL) -m 0644 -D $(@D)/$$f $(TARGET_DIR)/var/www/$$f || break ; \
> +	done
> +	mkdir -p $(TARGET_DIR)/var/www/images
> +	cp -r $(@D)/images/* $(TARGET_DIR)/var/www/images
> +	$(JQUERY_MOBILE_INSTALL_DEMOS)
> +endef
> +
> +$(eval $(generic-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
