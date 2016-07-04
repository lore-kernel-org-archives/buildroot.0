From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 15:19:18 +0200
Subject: [Buildroot] [PATCH 02/83 v2] package/angularjs: simplify
	modules selection
In-Reply-To: <1578b9ca612a91a04bc42601d0fc77a545413868.1467624132.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 4 Jul 2016 11:24:13 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <1578b9ca612a91a04bc42601d0fc77a545413868.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <877fd1h76x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Remove the superfluous config option, and make all modules default to
 > 'y', which provides exactly the same functionality.

 > simplify (and slightly beautify) the handling of modules in the .mk:
 > since the modules' symbols are always meaningful now, we can get rid of
 > the else-clause, and always build the list of modules using the Kconfig
 > options.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - remove spurious comment leftover from RFC  (Thomas)

 > Changes RFC -> v1:
 >   - treat the 'angular' module on its own, as was done previosuly
 >     (Arnout)
 >   - drop useless comments in Config.in  (Arnout)
 >   - don't re-order list, it was already alphabetically sorted
 > ---
 >  package/angularjs/Config.in    | 19 +++++++++----------
 >  package/angularjs/angularjs.mk | 21 ++++++++++++++-------
 >  2 files changed, 23 insertions(+), 17 deletions(-)

 > diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
 > index 206b3d8..2a0b48c 100644
 > --- a/package/angularjs/Config.in
 > +++ b/package/angularjs/Config.in
 > @@ -7,16 +7,9 @@ menuconfig BR2_PACKAGE_ANGULARJS
 
 >  if BR2_PACKAGE_ANGULARJS
 
 > -config BR2_ANGULARJS_MODULES
 > -	bool "angularjs modules"
 > -	help
 > -	  Select which modules to install. If disabled, all modules
 > -	  will be installed.
 > -
 > -if BR2_ANGULARJS_MODULES
 > -
 >  config BR2_ANGULARJS_MODULE_ANIMATE
 >  	bool "animate"
 > +	default y
 >  	help
 >  	  The ngAnimate module provides support for CSS-based animations
 >  	  (keyframes and transitions) as well as JavaScript-based animations
 > @@ -26,6 +19,7 @@ config BR2_ANGULARJS_MODULE_ANIMATE
 
 >  config BR2_ANGULARJS_MODULE_ARIA
 >  	bool "aria"
 > +	default y
 >  	help
 >  	  The ngAria module provides support for common ARIA attributes that
 >  	  convey state or semantic information about the application for users
 > @@ -33,18 +27,21 @@ config BR2_ANGULARJS_MODULE_ARIA
 
 >  config BR2_ANGULARJS_MODULE_COOKIES
 >  	bool "cookies"
 > +	default y
 >  	help
 >  	  The ngCookies module provides a convenient wrapper for reading and
 >  	  writing browser cookies.
 
 >  config BR2_ANGULARJS_MODULE_MESSAGE_FORMAT
 >  	bool "message-format"
 > +	default y
 >  	help
 >  	  The ngMessageFormat module is used recognize MessageFormat extensions
 >  	  in interpolation expressions.
 
 >  config BR2_ANGULARJS_MODULE_MESSAGES
 >  	bool "messages"
 > +	default y
 >  	help
 >  	  The ngMessages module provides enhanced support for displaying
 >  	  messages within templates (typically within forms or when rendering
 > @@ -52,28 +49,30 @@ config BR2_ANGULARJS_MODULE_MESSAGES
 
 >  config BR2_ANGULARJS_MODULE_RESOURCE
 >  	bool "resource"
 > +	default y
 >  	help
 >  	  The ngResource module provides interaction support with RESTful
 >  	  services via the $resource service.
 
 >  config BR2_ANGULARJS_MODULE_ROUTE
 >  	bool "route"
 > +	default y
 >  	help
 >  	  The ngRoute module provides routing and deeplinking services and
 >  	  directives for angular apps.
 
 >  config BR2_ANGULARJS_MODULE_SANITIZE
 >  	bool "sanitize"
 > +	default y
 >  	help
 >  	  The ngSanitize module provides functionality to sanitize HTML.
 
 >  config BR2_ANGULARJS_MODULE_TOUCH
 >  	bool "touch"
 > +	default y
 >  	help
 >  	  The ngTouch module provides touch events and other helpers for
 >  	  touch-enabled devices. The implementation is based on jQuery Mobile
 >  	  touch event handling (jquerymobile.com).
 
 >  endif
 > -
 > -endif
 > diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
 > index 60dbdb6..1f9a8fa 100644
 > --- a/package/angularjs/angularjs.mk
 > +++ b/package/angularjs/angularjs.mk
 > @@ -17,18 +17,25 @@ define ANGULARJS_EXTRACT_CMDS
 >  	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
 >  endef
 
 > +# This list mirrors the list of available modules from Config.in.
 > +# Keep this list in sync and in the same (alphabetical) order as the
 > +# one in Config.in.
 > +ANGULARJS_MODULES = \
 > +	animate \
 > +	aria \
 > +	cookies \
 > +	messages \
 > +	message-format \
 > +	resource \
 > +	route \
 > +	sanitize \
 > +	touch

I like the Config.in change, but how about using something like we do in
E.G. mtd-utils for the options - E.G.:

ANGULAR_MODULES_y = angular
ANGULAR_MODULES_$(BR2_ANGULARJS_MODULE_ANIMATE) += angular-animate
ANGULAR_MODULES_$(BR2_ANGULARJS_MODULE_ARIA) += angular-aria
...

define ANGULARJS_INSTALL_TARGET_CMDS
	$(foreach f,$(ANGULARJS_MODULES_y),\
		$(INSTALL) -m 0644 -D $(@D)/$(f).min.js \
			$(TARGET_DIR)/var/www/$(f).js$(sep))
endef

That seems more robust than this list.

While we're at it, it is quite unfortunate that these options aren't
prefixed by BR2_PACKAGE_ :/

-- 
Bye, Peter Korsgaard
