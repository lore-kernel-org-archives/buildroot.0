From: Benjamin Tietz <benjamin@micronet24.de>
Date: Fri, 8 Jun 2007 19:50:58 +0200
Subject: [Buildroot] Easier adding of new packages / alsa-lib & utils
In-Reply-To: <20070607132945.GC4224@firebird.dresden.micronet24.de>
References: <20070607132945.GC4224@firebird.dresden.micronet24.de>
Message-ID: <20070608175058.GC4273@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As I forgot to say: the PACKAGE in all of the variables is computed from
the name of the build-dir - dropping the version-number, and setting the
result uppercase while converting '-' to '_'.
The package-directory (under /package) should be called the same way,
(without case-changing or '-'-conversation) otherwise no patches would
be found.

Benjamin

On Thu, Jun 07, 2007 at 03:29:45PM +0200, Benjamin Tietz wrote:
> Hi,
> 
> the attachment contains two patches. The first one will rapidly shorten
> the Makefile to add a new package to the buildroot (at least for most
> packages), while being fully compatible to the standard way used up to
> now.
> While the Config.in follows the same rules, the Makefile for the new
> package provides only the NEEDED information to add the package. Let see
> on an example (Its nearly the same included in the second patch):
> 
> 	#############################################################
> 	#
> 	# alsa libraries
> 	#
> 	#############################################################
> 	ALSA_VERSION:=1.0.13
> 	ALSA_SITE:=ftp://ftp.alsa-project.org/pub
> 	ALSA_LIB_FILE:=alsa-lib-$(ALSA_VERSION).tar.bz2
> 	ALSA_LIB_SITE:=$(ALSA_SITE)/lib/$(ALSA_LIB_FILE)
> 	
> 	alsa-lib: $(DL_DIR)/$(ALSA_LIB_FILE) $(BUILD_DIR)/alsa-lib-$(ALSA_VERSION)/.libs
> 	
> 	ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> 	TARGETS+=alsa-lib
> 	endif
> 	
> the interesting thing is the line starting with alsa-lib:
> This rule depends first on the downloaded source file and second on a
> file called .libs in the source-directory. Over a chain of implicit
> rules this means the Source-file will fetched from the address in
> $(ALSA_LIB_SITE) than automaticly unpacked, patched (if configured even
> config.sub and config.guess are updated), compiled, installed and - as
> this is a library - prepared for further use by the buildroot. (exactly
> the lib will be installed a second time into the staging dir, while the
> headers will be deleted from the rootfs).
> 
> Other targets are:
> $(PACKAGE_BUILD_DIR)/.unpacked
> $(PACKAGE_BUILD_DIR)/.patched
> $(PACKAGE_BUILD_DIR)/.configured
> $(PACKAGE_BUILD_DIR)/.build
> $(PACKAGE_BUILD_DIR)/.installed (for normal programs, also done by .libs)
> $(PACKAGE_BUILD_DIR)/.libs
> 
> They all are chained along so picking up the one you like to go along
> with will do the thing.
> To get even more packages to work with, you can also give some options
> to make and configure:
> 
> $(PACKAGE_CONF_ENV) will take environment varaibles for configure
> $(PACKAGE_CONF_OPT) takes Options passed to configure
> $(PACKAGE_MAKE_ENV) and
> $(PACKAGE_MAKE_OPT) do the same for the make-runs.
> 
> If you just want to bypass or change some particular steps you only
> create a rule in your Makefile like
> 
> $(PACKAGE_BUILD_DIR)/.configured: $(PACKAGE_BUILD_DIR)/.patched
> 	touch $@
> 
> Which will simply bypass the step of configuration, eg because your
> package can't be configured by using a script.
> Adding some code below that line will run it. But only this!
> 
> 
> The Second patch is mostly an example (Thats way they come along in one
> Mail) integrating the ALSA-libs and utils. (Most notably a mixer to
> adjust the volume of your soundcard)
> 
> best regards
> 
> Benjamin

Content-Description: autotools.patch
> diff -Naur buildroot/Config.in buildroot.patched/Config.in
> --- buildroot/Config.in	2007-06-02 09:15:28.000000000 +0200
> +++ buildroot.patched/Config.in	2007-06-04 21:41:31.000000000 +0200
> @@ -208,6 +208,8 @@
>  
>  menu "Build options"
>  
> +source package/gnuconfig/Config.in
> +
>  config BR2_WGET
>  	string "Wget command"
>  	default "wget --passive-ftp -nd"
> diff -Naur buildroot/package/Makefile.autotools.in buildroot.patched/package/Makefile.autotools.in
> --- buildroot/package/Makefile.autotools.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/Makefile.autotools.in	2007-06-07 14:10:00.000000000 +0200
> @@ -0,0 +1,89 @@
> +##################################################################
> +#
> +# Implicit Rules for easy creating autotools-compatible packages
> +#
> +##################################################################
> +
> +# Macros for Variable and programmname-generation
> +VAR=$(shell echo $(call MYNAME,$(1)) | $(firstword $(SED)) -e 'y/abcdefghijklmnopqrstuvwxyz-./ABCDEFGHIJKLMNOPQRSTUVWXYZ__/')
> +MYNAME=$(shell echo $(call MYNAMEVER,$(1)) | $(firstword $(SED)) -e 's/\([-._][0-9][0-9]*\)*$$//') 
> +MYVER=$(shell echo $(call MYNAMEVER,$(1)) | $(firstword $(SED)) -e 's/\([^0-9]*-\)*//')
> +MYNAMEVER=$(notdir $(patsubst %.tar,%,$(patsubst %/,%,$(basename $(1)))))
> +
> +# Generic File retrievel Target
> +$(DL_DIR)/%:
> +	@$(WGET) -P $(DL_DIR) $$([ "$($(call VAR,$@)_SITE)" ] && echo $($(call VAR,$@)_SITE) || echo http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(firstword $(subst -, ,$@))/$@)
> +
> +# Unpacking the archive
> +$(BUILD_DIR)/%/.unpacked: $(DL_DIR)/%.tgz
> +$(BUILD_DIR)/%/.unpacked: $(DL_DIR)/%.tar.gz
> +	$(ZCAT) $< | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +	@touch $@
> +
> +$(BUILD_DIR)/%/.unpacked: $(DL_DIR)/%.tar.bz2
> +	$(BZCAT) $< | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +	@touch $@
> +
> +$(BUILD_DIR)/%/.unpacked: $(DL_DIR)/%.tar
> +	tar -C $(BUILD_DIR) $(TAR_OPTIONS) $<
> +	@touch $@
> +
> +# Patching
> +$(BUILD_DIR)/%/.patched: $(BUILD_DIR)/%/.unpacked
> +	@(if [ -d package/$(call MYNAME,$<)]; then \
> +		if [ "$(wildcard package/$(call MYNAME,$@)/$**.patch)" ]; then \
> +			toolchain/patch-kernel.sh $(@D) package/$(call MYNAME,$<) $*\*.patch; \
> +		else \
> +			toolchain/patch-kernel.sh $(@D) package/$(call MYNAME,$<) $(call MYNAME,$<)\*.patch; \
> +			[ -d package/$(call MYNAME,$<)/$* ] && \
> +				toolchain/patch-kernel.sh $(@D) package/$(call MYNAME,$<)/$* \*.patch; \
> +		fi;\
> +	fi)
> +ifeq ($(BR2_UPDATE_CONFIG),y)
> +	@(for file in config.guess config.sub; do\
> +		for i in $$(find $(@D) -name $$file); do \
> +			cp package/gnuconfig/$$file $$i; \
> +		done;\
> +	done)
> +endif
> +	@touch $@
> +
> +# Configuring
> +$(BUILD_DIR)/%/.configured: $(BUILD_DIR)/%/.patched
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		$($(call VAR,$@)_CONF_ENV) \
> +		./configure \
> +		--target=$(GNU_TARGET_NAME) \
> +		--host=$(GNU_TARGET_NAME) \
> +		--build=$(GNU_HOST_NAME) \
> +		--prefix=/usr \
> +		--sysconfdir=/etc \
> +		$($(call VAR,$@)_CONF_OPT) \
> +	);
> +	touch $@;
> +
> +# Building
> +$(BUILD_DIR)/%/.build: $(BUILD_DIR)/%/.configured
> +	$($(call VAR,$@)_MAKE_ENV) $(MAKE) $($(call VAR,$@)_MAKE_OPT) -C $(@D)
> +	touch $@
> +
> +$(BUILD_DIR)/%/.installed: $(BUILD_DIR)/%/.build
> +	$($(call VAR,$@)_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) $($(call VAR,$@)_MAKE_OPT) -C $(@D) install
> +	rm -Rf $(TARGET_DIR)/usr/man
> +	touch $@
> +
> +$(BUILD_DIR)/%/.libs: $(BUILD_DIR)/%/.installed
> +	$($(call VAR,$@)_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) $($(call VAR,$@)_MAKE_OPT) -C $(@D) install
> +	rm -Rf $(STAGING_DIR)/man $(TARGET_DIR)/usr/include
> +	touch $@
> +
> +$(BUILD_DIR)/%/.clean:
> +	$($(call VAR,$@)_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) $($(call VAR,$@)_MAKE_OPT) -C $(@D) uninstall
> +	-$(MAKE) -C $(@D) clean
> +
> +$(BUILD_DIR)/%/.dirclean:
> +	rm -Rf $(@D)
> +
> diff -Naur buildroot/package/Makefile.in buildroot.patched/package/Makefile.in
> --- buildroot/package/Makefile.in	2007-06-02 09:15:28.000000000 +0200
> +++ buildroot.patched/package/Makefile.in	2007-06-07 13:47:41.000000000 +0200
> @@ -143,3 +143,5 @@
>  XSERVER+=xggi
>  endif
>  
> +include package/Makefile.autotools.in
> +
> diff -Naur buildroot/package/gnuconfig/Config.in buildroot.patched/package/gnuconfig/Config.in
> --- buildroot/package/gnuconfig/Config.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/gnuconfig/Config.in	2007-06-04 20:57:30.000000000 +0200
> @@ -0,0 +1,8 @@
> +config BR2_UPDATE_CONFIG
> +	bool "update config.sub and config.guess"
> +	default n
> +	help
> +		This just exists to easily update the config.sub / config.guess
> +		files in packages to the latest version (since many bundled ones
> +		don't support the latest possible targets)
> +

Content-Description: alsa.patch
> diff -Naur buildroot/package/Config.in buildroot.patched/package/Config.in
> --- buildroot/package/Config.in	2007-06-02 09:15:28.000000000 +0200
> +++ buildroot.patched/package/Config.in	2007-06-02 20:14:37.000000000 +0200
> @@ -245,6 +245,7 @@
>  source "package/libsndfile/Config.in"
>  source "package/madplay/Config.in"
>  source "package/mpg123/Config.in"
> +source "package/alsa/Config.in"
>  endif
>  
>  menuconfig BR2_GRAPHIC_SUPPORT
> diff -Naur buildroot/package/alsa/alsa.mk buildroot.patched/package/alsa/alsa.mk
> --- buildroot/package/alsa/alsa.mk	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa/alsa.mk	2007-06-07 13:50:13.000000000 +0200
> @@ -0,0 +1,7 @@
> +#############################################################
> +#
> +# alsa
> +#
> +#############################################################
> +ALSA_VERSION:=1.0.13
> +ALSA_SITE:=ftp://ftp.alsa-project.org/pub
> diff -Naur buildroot/package/alsa/Config.in buildroot.patched/package/alsa/Config.in
> --- buildroot/package/alsa/Config.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa/Config.in	2007-06-07 13:50:13.000000000 +0200
> @@ -0,0 +1,13 @@
> +menuconfig BR2_PACKAGE_ALSA
> +	bool "ALSA"
> +	default n
> +	help
> +		Using the Advanced Linux Sound Architecture
> +
> +if BR2_PACKAGE_ALSA
> +source package/alsa-lib/Config.in
> +source package/alsa-utils/Config.in
> +endif
> diff -Naur buildroot/package/alsa-lib/Config.in buildroot.patched/package/alsa-lib/Config.in
> --- buildroot/package/alsa-lib/Config.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa-lib/Config.in	2007-05-28 14:22:40.000000000 +0200
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ALSA_LIB
> +	bool "ALSA library"
> +	default n
> +	help
> +		The ALSA library with the standard plugins
> diff -Naur buildroot/package/alsa-lib/lib.mk buildroot.patched/package/alsa-lib/lib.mk
> --- buildroot/package/alsa-lib/lib.mk	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa-lib/lib.mk	2007-06-07 13:50:13.000000000 +0200
> @@ -0,0 +1,9 @@
> +ALSA_LIB_FILE:=alsa-lib-$(ALSA_VERSION).tar.bz2
> +ALSA_LIB_SITE:=$(ALSA_SITE)/lib/$(ALSA_LIB_FILE)
> +
> +alsa-lib: $(DL_DIR)/$(ALSA_LIB_FILE) $(BUILD_DIR)/alsa-lib-$(ALSA_VERSION)/.libs
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +TARGETS+=alsa-lib
> +endif
> +
> diff -Naur buildroot/package/alsa-utils/alsa-utils-1.0.13-gettext.patch buildroot.patched/package/alsa-utils/alsa-utils-1.0.13-gettext.patch
> --- buildroot/package/alsa-utils/alsa-utils-1.0.13-gettext.patch	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa-utils/alsa-utils-1.0.13-gettext.patch	2007-06-07 13:40:27.000000000 +0200
> @@ -0,0 +1,21 @@
> +diff -Naur alsa-utils-1.0.13/seq/aseqnet/Makefile.am alsa-utils-1.0.13.patched/seq/aseqnet/Makefile.am
> +--- alsa-utils-1.0.13/seq/aseqnet/Makefile.am	2006-09-29 13:53:26.000000000 +0200
> ++++ alsa-utils-1.0.13.patched/seq/aseqnet/Makefile.am	2007-06-07 13:36:47.000000000 +0200
> +@@ -1,5 +1,6 @@
> + INCLUDES = -I$(top_srcdir)/include
> + EXTRA_DIST = README.aseqnet aseqnet.1
> ++LDFLAGS = -lintl
> + 
> + bin_PROGRAMS = aseqnet
> + aseqnet_SOURCES = aseqnet.c
> +diff -Naur alsa-utils-1.0.13/seq/aseqnet/Makefile.in alsa-utils-1.0.13.patched/seq/aseqnet/Makefile.in
> +--- alsa-utils-1.0.13/seq/aseqnet/Makefile.in	2006-09-29 13:54:52.000000000 +0200
> ++++ alsa-utils-1.0.13.patched/seq/aseqnet/Makefile.in	2007-06-07 13:36:47.000000000 +0200
> +@@ -107,6 +107,7 @@
> + INTLLIBS = @INTLLIBS@
> + INTL_MACOSX_LIBS = @INTL_MACOSX_LIBS@
> + LDFLAGS = @LDFLAGS@
> ++AM_LDFLAGS = -lintl
> + LIBICONV = @LIBICONV@
> + LIBINTL = @LIBINTL@
> + LIBOBJS = @LIBOBJS@
> diff -Naur buildroot/package/alsa-utils/Config.in buildroot.patched/package/alsa-utils/Config.in
> --- buildroot/package/alsa-utils/Config.in	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa-utils/Config.in	2007-05-25 22:10:46.000000000 +0200
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_ALSA_UTILS
> +	bool "ALSA utils"
> +	default n
> +	help
> +		Tools for configuring and using ALSA
> +
> +		amixer: command line mixer
> +		alsamixer: curses mixer
> +		amidi: read from and write to ALSA RawMIDI ports
> +		aplay, arecord: command line playback and recording
> +		aplaymidi, arecordmidi: command line MIDI playback and recording
> +		aconnect, aseqnet, aseqdump: command line MIDI sequencer control
> diff -Naur buildroot/package/alsa-utils/utils.mk buildroot.patched/package/alsa-utils/utils.mk
> --- buildroot/package/alsa-utils/utils.mk	1970-01-01 01:00:00.000000000 +0100
> +++ buildroot.patched/package/alsa-utils/utils.mk	2007-06-07 12:13:50.000000000 +0200
> @@ -0,0 +1,9 @@
> +ALSA_UTILS_FILE:=alsa-utils-$(ALSA_VERSION).tar.bz2
> +ALSA_UTILS_SITE:=$(ALSA_SITE)/utils/$(ALSA_UTILS_FILE)
> +
> +alsa-utils: ncurses gettext alsa-lib $(DL_DIR)/$(ALSA_UTILS_FILE) $(BUILD_DIR)/alsa-utils-$(ALSA_VERSION)/.installed
> +
> +ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
> +ALSA_TARGETS+=alsa-utils
> +endif
> +

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
