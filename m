From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Jul 2015 17:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
Message-ID: <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ignacy, all

On Fri, Jul 17, 2015 at 12:44 PM, Ignacy Gaw?dzki
<ignacy.gawedzki@green-communications.fr> wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  package/Config.in              |  1 +
>  package/angularjs/Config.in    | 60 ++++++++++++++++++++++++++++++++++++++++++
>  package/angularjs/angularjs.mk | 41 +++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/angularjs/Config.in
>  create mode 100644 package/angularjs/angularjs.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 86a53c8..a8c16ac 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -866,6 +866,7 @@ menu "Hardware handling"
>  endmenu
>
>  menu "Javascript"
> +       source "package/angularjs/Config.in"
>         source "package/bootstrap/Config.in"
>         source "package/explorercanvas/Config.in"
>         source "package/flot/Config.in"
> diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
> new file mode 100644
> index 0000000..38fb56f
> --- /dev/null
> +++ b/package/angularjs/Config.in
> @@ -0,0 +1,60 @@
> +config BR2_PACKAGE_ANGULARJS
> +       bool "AngularJS"
> +       help
> +         AngularJS web application framework.
> +
> +         http://angularjs.org
> +
> +if BR2_PACKAGE_ANGULARJS
> +
> +menuconfig BR2_ANGULARJS_MODULES
> +       bool "Select AngularJS modules"
> +
> +       help
> +         Select which modules to install, instead of installing all of them.
The phrasing seems a bit wrong to me here, but I'm no english expert.
Maybe stop at "Select modules to install." ?
> +
> +if BR2_ANGULARJS_MODULES
> +
> +config BR2_ANGULARJS_MODULE_animate
> +       bool "animate"
> +       default y
The name of the config should be all in uppercase.
The module should not be at y by default.
A little help text to explain what this modules does and is usefull
for would be nice (no need for a long text, just a few words)
> +
> +config BR2_ANGULARJS_MODULE_aria
> +       bool "aria"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_cookies
> +       bool "cookies"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_loader
> +       bool "loader"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_message-format
> +       bool "message-format"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_messages
> +       bool "messages"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_resource
> +       bool "resource"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_route
> +       bool "route"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_sanitize
> +       bool "sanitize"
> +       default y
ditto
> +
> +config BR2_ANGULARJS_MODULE_touch
> +       bool "touch"
> +       default y
ditto
> +
> +endif
> +
> +endif
> diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
> new file mode 100644
> index 0000000..c7b587b
> --- /dev/null
> +++ b/package/angularjs/angularjs.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# AngularJS
> +#
> +################################################################################
> +
> +ANGULARJS_VERSION = 1.4.2
It seems there's already a newer version on their website.
> +ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
> +ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
You are missing the LICENSE and LICENSE_FILES information here.
You are also missing the '.hash' file, have a look at:
http://buildroot.org/downloads/manual/manual.html#adding-packages-hash
> +
> +define ANGULARJS_EXTRACT_CMDS
> +       unzip $(DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
> +       mv $(@D)/angular-$(ANGULARJS_VERSION)/* $(@D)
> +       rmdir $(@D)/angular-$(ANGULARJS_VERSION)
> +endef
> +
> +ANGULARJS_FILES = angular.min.js
> +
> +ANGULARJS_MODULES = animate aria cookies loader message-format \
> +                   messages resource route sanitize touch
> +
> +ifeq ($(BR2_ANGULARJS_MODULES),y)
> +
> +ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
> +                  $(if $(filter y,$(BR2_ANGULARJS_MODULE_$(mod))),\
> +                       angular-$(mod).min.js))
> +
> +else
> +
> +ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod).min.js)
> +
> +endif
> +
> +define ANGULARJS_INSTALL_TARGET_CMDS
> +       for f in $(strip $(ANGULARJS_FILES)); do        \
> +               $(INSTALL) -m 0644 -D $(@D)/$$f         \
> +               $(TARGET_DIR)/var/www/$${f%.min.js}.js; \
> +       done
> +endef

Instead of this construct, look at how it's done in
package/nfs-utils/nfs-utils.mk, you can use Make at your own advantage
and define:
ANGULAR_JS_MODULES_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += path/to/the/file

Then install everything and delete $(ANGULAR_JS_MODULES_) which will
contains the modules not selected.
This way, you don't even need a loop.

As mentionned on IRC by Thomas De Schampheleire, you may need to
qstrip instead of strip.

> +
> +$(eval $(generic-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
