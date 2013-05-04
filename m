From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 13:05:29 +0200
Subject: [Buildroot] [PATCHv2] jquery-keyboard: new package
In-Reply-To: <1367611865-29442-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 3 May 2013 17:11:05 -0300")
References: <1367611865-29442-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nejvwcm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the jquery-keyboard package based on Simon Dawson's patch with a
 Gustavo> newer version and improvements (license, select jquery, install
 Gustavo> layouts).

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in                          |  1 +
 Gustavo>  package/jquery-keyboard/Config.in          |  7 +++++++
 Gustavo>  package/jquery-keyboard/jquery-keyboard.mk | 25 +++++++++++++++++++++++++
 Gustavo>  3 files changed, 33 insertions(+)
 Gustavo>  create mode 100644 package/jquery-keyboard/Config.in
 Gustavo>  create mode 100644 package/jquery-keyboard/jquery-keyboard.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index cb1e8e1..14630a7 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -485,6 +485,7 @@ menu "Javascript"
 Gustavo>  source "package/explorercanvas/Config.in"
 Gustavo>  source "package/flot/Config.in"
 Gustavo>  source "package/jquery/Config.in"
 Gustavo> +source "package/jquery-keyboard/Config.in"
 Gustavo>  source "package/jquery-sparkline/Config.in"
 Gustavo>  source "package/jquery-validation/Config.in"
 Gustavo>  source "package/jsmin/Config.in"
 Gustavo> diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..ee97662
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/jquery-keyboard/Config.in
 Gustavo> @@ -0,0 +1,7 @@
 Gustavo> +config BR2_PACKAGE_JQUERY_KEYBOARD
 Gustavo> +	bool "jQuery keyboard"
 Gustavo> +	select BR2_PACKAGE_JQUERY
 Gustavo> +	help
 Gustavo> +	  Virtual Keyboard using jQuery UI
 Gustavo> +
 Gustavo> +	  https://github.com/Mottie/Keyboard
 Gustavo> diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
 Gustavo> new file mode 100644
 Gustavo> index 0000000..8432a48
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/jquery-keyboard/jquery-keyboard.mk
 Gustavo> @@ -0,0 +1,25 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# jquery-keyboard
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +JQUERY_KEYBOARD_VERSION = 1.17.4
 Gustavo> +JQUERY_KEYBOARD_SITE = \
 Gustavo> +	http://github.com/Mottie/Keyboard/tarball/v$(JQUERY_KEYBOARD_VERSION)
 Gustavo> +JQUERY_KEYBOARD_LICENSE = MIT WTFPL
 Gustavo> +JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
 Gustavo> +
 Gustavo> +define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
 Gustavo> +	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
 Gustavo> +		$(TARGET_DIR)/var/www/css/keyboard.css
 Gustavo> +	$(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
 Gustavo> +		$(TARGET_DIR)/var/www

Install -D doesn't make sense when the destination is a directory.

 Gustavo> +	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
 Gustavo> +		$(TARGET_DIR)/var/www/jquery.mousewheel.js
 Gustavo> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
 Gustavo> +	$(INSTALL) -m 0644 -D $(@D)/layouts/*.js \
 Gustavo> +		$(TARGET_DIR)/var/www/layouts

Here neither.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
