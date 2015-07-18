From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 19:16:50 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
 <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
Message-ID: <20150718191650.6f34b9e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Ignacy,

On Sat, 18 Jul 2015 17:58:48 +0200, Maxime Hadjinlian wrote:

> > +menuconfig BR2_ANGULARJS_MODULES
> > +       bool "Select AngularJS modules"
> > +
> > +       help
> > +         Select which modules to install, instead of installing all of them.
> The phrasing seems a bit wrong to me here, but I'm no english expert.
> Maybe stop at "Select modules to install." ?

No, the original wording is correct, but could be clarified. I think
that what you missed is that this option is a menuconfig, not a menu:
you can enable/disable this option.

So, what happens is that when you have:

	[ ] Select AngularJS modules ---

Then all modules are installed. However, when you have:

	[*] Select AngularJS modules ---
	   [*] animate
	   [ ] aria

Then animate will be installed, but not aria.

This part looks OK to me.

> > +if BR2_ANGULARJS_MODULES
> > +
> > +config BR2_ANGULARJS_MODULE_animate
> > +       bool "animate"
> > +       default y
> The name of the config should be all in uppercase.

Agreed.

> The module should not be at y by default.
> A little help text to explain what this modules does and is usefull
> for would be nice (no need for a long text, just a few words)

Agreed.


> > diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
> > new file mode 100644
> > index 0000000..c7b587b
> > --- /dev/null
> > +++ b/package/angularjs/angularjs.mk
> > @@ -0,0 +1,41 @@
> > +################################################################################
> > +#
> > +# AngularJS

This should be in lowercase.

> > +#
> > +################################################################################
> > +
> > +ANGULARJS_VERSION = 1.4.2
> It seems there's already a newer version on their website.
> > +ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
> > +ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
> You are missing the LICENSE and LICENSE_FILES information here.
> You are also missing the '.hash' file, have a look at:
> http://buildroot.org/downloads/manual/manual.html#adding-packages-hash
> > +
> > +define ANGULARJS_EXTRACT_CMDS
> > +       unzip $(DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
> > +       mv $(@D)/angular-$(ANGULARJS_VERSION)/* $(@D)
> > +       rmdir $(@D)/angular-$(ANGULARJS_VERSION)
> > +endef
> > +
> > +ANGULARJS_FILES = angular.min.js

Change this to just:

ANGULARJS_FILES = angular

(see below why)

> > +
> > +ANGULARJS_MODULES = animate aria cookies loader message-format \
> > +                   messages resource route sanitize touch

One tab for the indentation of the second line.

> > +
> > +ifeq ($(BR2_ANGULARJS_MODULES),y)
> > +

Unneeded newline.

> > +ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
> > +                  $(if $(filter y,$(BR2_ANGULARJS_MODULE_$(mod))),\

The filter is not needed, and you'll have to use the lowercase function
once the options will be capitalized. So probably something like:

	$(foreach mod,$(ANGULARJS_MODULES),\
		$(if $(BR2_ANGULARJS_MODULE_$(call UPPERCASE,$(mod))),angular-$(mod)))

> > +                       angular-$(mod).min.js))
> > +
> > +else
> > +

Unneeded new line.

> > +ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod).min.js)
> > +
> > +endif
> > +
> > +define ANGULARJS_INSTALL_TARGET_CMDS
> > +       for f in $(strip $(ANGULARJS_FILES)); do        \
> > +               $(INSTALL) -m 0644 -D $(@D)/$$f         \
> > +               $(TARGET_DIR)/var/www/$${f%.min.js}.js; \
> > +       done
> > +endef
> 
> Instead of this construct, look at how it's done in
> package/nfs-utils/nfs-utils.mk, you can use Make at your own advantage
> and define:
> ANGULAR_JS_MODULES_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += path/to/the/file
> 
> Then install everything and delete $(ANGULAR_JS_MODULES_) which will
> contains the modules not selected.
> This way, you don't even need a loop.

I disagree here, I think the original implementation from Ignacy is
pretty good and smart. But using a foreach loop is better for error
handling (it will stop if one install command fails) :

	$(foreach f,$(ANGULARJS_FILES),\
		$(INSTALL) -m 0644 -D $(@D)/$(f).min.js $(TARGET_DIR)/var/www/$(f).js$(sep))

> As mentionned on IRC by Thomas De Schampheleire, you may need to
> qstrip instead of strip.

I don't see why. There are no double quotes anywhere here. qstrip is
used when you get a 'string' option from Config.in, which is not the
case here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
