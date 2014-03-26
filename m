From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2014 00:42:27 +0100
Subject: [Buildroot] [PATCH] tcl: bump to version 8.6.1
In-Reply-To: <1393887187-29706-1-git-send-email-andrew.ruder@elecsyscorp.com>
 (Andrew Ruder's message of "Mon, 3 Mar 2014 16:53:07 -0600")
References: <1393887187-29706-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <87bnwsil24.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

Hi,

 > We carry a patch that turns off building compatibility layers for old/broken
 > versions of standard functions (strstr, strtoul, strtod) with the assumption
 > that anything buildroot is targetting with the standard C library will be good
 > enough.

Thanks, see below for a few comments:
 
 > +++ b/package/tcl/tcl-0001-dont-build-compat.patch
 > @@ -0,0 +1,21 @@
 > +diff --git a/unix/tcl.m4 b/unix/tcl.m4

Please add a git-style patch header explaining what the patch does and
why + your signed-off-by. You can basically just copy your commit text
above.

 > +++ b/package/tcl/tcl.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -TCL_VERSION_MAJOR = 8.4
 > -TCL_VERSION_MINOR = 19
 > +TCL_VERSION_MAJOR = 8.6
 > +TCL_VERSION_MINOR = 1

TCL_VERSION_MINOR has been removed in the mean time.

 >  TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 >  TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 >  TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 > @@ -13,6 +13,7 @@ TCL_LICENSE = tcl license
 >  TCL_LICENSE_FILES = license.terms
 >  TCL_SUBDIR = unix
 >  TCL_INSTALL_STAGING = YES
 > +TCL_AUTORECONF = YES
 >  TCL_CONF_OPT = \
 >  		--disable-symbols \
 >  		--disable-langinfo \
 > @@ -42,12 +43,30 @@ endef
 >  TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 >  endif
 
 > -# library get installed read only, so strip fails
 > -define TCL_FIXUP_RO_LIB
 > -	chmod +w $(TARGET_DIR)/usr/lib/libtcl*
 > +ifneq ($(BR2_PACKAGE_SQLITE),y)
 > +define TCL_REMOVE_SQLITE
 > +	rm -fr $(TARGET_DIR)/usr/lib/sqlite3.8.0 $(TARGET_DIR)/usr/lib/tdbcsqlite3-1.0.0
 >  endef
 > +TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_SQLITE
 > +endif
 > +
 > +define TCL_REMOVE_EXTRA
 > +	rm -fr $(TARGET_DIR)/usr/lib/tdbcmysql1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcodbc1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcpostgres1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tclConfig.sh \
 > +	       $(TARGET_DIR)/usr/lib/tclooConfig.sh
 > +endef
 > +TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 > -TCL_POST_INSTALL_TARGET_HOOKS += TCL_FIXUP_RO_LIB
 > +ifneq ($(BR2_PACKAGE_SQLITE),y)
 > +define TCL_REMOVE_SQLITE
 > +	rm -fr $(TARGET_DIR)/usr/lib/sqlite3.8.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbcsqlite3-1.0.0 \
 > +	       $(TARGET_DIR)/usr/lib/tdbc1.0.0
 > +endef

You seem to handle sqlite twice? Shouldn't sqlite atleast be added to
TCL_DEPENDENCIES (and perhaps host-pkgconf if it is used) if it is
enabled to ensure that the configure script picks it up?


 > +TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_SQLITE
 > +endif
 
 >  $(eval $(autotools-package))
 >  $(eval $(host-autotools-package))
 > diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
 > index f2aca36..ae2e4da 100644
 > --- a/package/tcllib/tcllib.mk
 > +++ b/package/tcllib/tcllib.mk
 > @@ -10,6 +10,6 @@ TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(
 >  TCLLIB_LICENSE       = tcl license
 >  TCLLIB_LICENSE_FILES = license.terms
 >  TCLLIB_DEPENDENCIES  = host-tcl
 > -TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh8.4"
 > +TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh8.6"

It would be good to use $(TCL_VERSION_MAJOR) here so we don't need to
update it whenever the version is bumped.

Care to fix these minor issues and resend? Thanks!

-- 
Bye, Peter Korsgaard
