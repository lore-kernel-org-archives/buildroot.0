From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 03 May 2013 21:50:17 +0200
Subject: [Buildroot] [PATCH] jquery-keyboard: new package
In-Reply-To: <1367582973-20541-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367582973-20541-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <518414F9.4030506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/13 14:09, Gustavo Zacarias wrote:
> Add the jquery-keyboard package based on Simon Dawson's patch with a
> newer version and improvements (license, select jquery, install
> layouts).
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[snip]
> diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
> new file mode 100644
> index 0000000..81764ee
> --- /dev/null
> +++ b/package/jquery-keyboard/jquery-keyboard.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# jquery-keyboard
> +#
> +#############################################################
> +
> +JQUERY_KEYBOARD_VERSION = 1.17.4
> +JQUERY_KEYBOARD_SITE = \
> +	http://github.com/Mottie/Keyboard/tarball/v$(JQUERY_KEYBOARD_VERSION)
> +JQUERY_KEYBOARD_LICENSE = MIT WTFPL

  I prefer

JQUERY_KEYBOARD_LICENSE = MIT (code), WTFPL (layouts)

> +JQUERY_KEYBOARD_LICENSE_FILES = README.markdown

  That file does nothing more than refer to the websites with the license 
text... Not sure how to deal with that.

> +
> +define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/css

  With the -D arguments below, the line above is redundant.

> +	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
> +		$(TARGET_DIR)/var/www/css/keyboard.css
> +	$(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
> +		$(TARGET_DIR)/var/www
> +	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
> +		$(TARGET_DIR)/var/www/jquery.mousewheel.js
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
> +	$(INSTALL) -m 0644 -D $(@D)/layouts/*.js \
> +		$(TARGET_DIR)/var/www/layouts

  But why not just cp -r $(@D)/{css,js,layouts} $(TARGET_DIR)/var/www ?


  Regards,
  Arnout

> +endef
> +
> +$(eval $(call generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
