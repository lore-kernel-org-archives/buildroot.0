From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Sep 2014 23:42:43 +0200
Subject: [Buildroot] [PATCHv2 1/4] package/ncurses: Allow building wide
	char support
In-Reply-To: <1408543581-15702-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 20 Aug 2014 11:06:18 -0300")
References: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
 <1408543581-15702-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3zca7cc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > From: Jeremy Kerr <jk@ozlabs.org>
 > Allow ncurses to be configured with wide char support; this causes the
 > libraries to be built with the 'w' suffix (eg libncursesw.so,
 > libmenuw.so, etc), so we need to create a few symlinks.

 > Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
 > Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/ncurses/Config.in  |  6 ++++++
 >  package/ncurses/ncurses.mk | 24 ++++++++++++++++++++++--
 >  2 files changed, 28 insertions(+), 2 deletions(-)

 > diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
 > index e8ab710..b90ec9e 100644
 > --- a/package/ncurses/Config.in
 > +++ b/package/ncurses/Config.in
 > @@ -10,6 +10,12 @@ config BR2_PACKAGE_NCURSES
 
 >  if BR2_PACKAGE_NCURSES
 
 > +config BR2_PACKAGE_NCURSES_WCHAR
 > +	bool "enable wide char support"
 > +	depends on BR2_USE_WCHAR
 > +	help
 > +	  Enable wide char & UTF-8 support in ncurses libraries
 > +
 >  config BR2_PACKAGE_NCURSES_TARGET_PANEL
 >  	bool "ncurses libpanel in target"
 >  	help
 > diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
 > index 4bba8f1..bd2aac0 100644
 > --- a/package/ncurses/ncurses.mk
 > +++ b/package/ncurses/ncurses.mk
 > @@ -12,7 +12,7 @@ HOST_NCURSES_DEPENDENCIES =
 >  NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 >  NCURSES_LICENSE = MIT with advertising clause
 >  NCURSES_LICENSE_FILES = README
 > -NCURSES_CONFIG_SCRIPTS = ncurses5-config
 > +NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config

You don't seem to add a ncursesw5-config -> ncurses5-config symlink, but
we explicitly refer to ncurses5-config in several places (and some
configure scripts probably also expects it):

package/alsa-utils/alsa-utils.mk:       ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config
package/dialog/dialog.mk:DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config

 
 >  NCURSES_CONF_OPT = \
 >  	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
 > @@ -36,6 +36,24 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 >  	NCURSES_DEPENDENCIES += busybox
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 > +NCURSES_CONF_OPT += --enable-widec
 > +NCURSES_LIB_SUFFIX = w
 > +
 > +define NCURSES_LINK_LIBS
 > +	for lib in $(NCURSES_LIBS-y); do \
 > +		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
 > +			$(1)/usr/lib/$${lib}.so; \
 > +	done
 > +endef
 > +
 > +NCURSES_LINK_TARGET_LIBS =  $(call NCURSES_LINK_LIBS, $(TARGET_DIR))
 > +NCURSES_LINK_STAGING_LIBS =  $(call NCURSES_LINK_LIBS, $(STAGING_DIR))

What's with this extra whitespace? I see it gets fixed up in patch 2,
but we might as well do it right in patch 1 instead.

-- 
Bye, Peter Korsgaard
