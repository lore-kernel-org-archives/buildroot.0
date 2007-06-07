From: Benjamin Tietz <benjamin@micronet24.de>
Date: Thu, 7 Jun 2007 15:29:45 +0200
Subject: [Buildroot] Easier adding of new packages / alsa-lib & utils
Message-ID: <20070607132945.GC4224@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the attachment contains two patches. The first one will rapidly shorten
the Makefile to add a new package to the buildroot (at least for most
packages), while being fully compatible to the standard way used up to
now.
While the Config.in follows the same rules, the Makefile for the new
package provides only the NEEDED information to add the package. Let see
on an example (Its nearly the same included in the second patch):

	#############################################################
	#
	# alsa libraries
	#
	#############################################################
	ALSA_VERSION:=1.0.13
	ALSA_SITE:=ftp://ftp.alsa-project.org/pub
	ALSA_LIB_FILE:=alsa-lib-$(ALSA_VERSION).tar.bz2
	ALSA_LIB_SITE:=$(ALSA_SITE)/lib/$(ALSA_LIB_FILE)
	
	alsa-lib: $(DL_DIR)/$(ALSA_LIB_FILE) $(BUILD_DIR)/alsa-lib-$(ALSA_VERSION)/.libs
	
	ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
	TARGETS+=alsa-lib
	endif
	
the interesting thing is the line starting with alsa-lib:
This rule depends first on the downloaded source file and second on a
file called .libs in the source-directory. Over a chain of implicit
rules this means the Source-file will fetched from the address in
$(ALSA_LIB_SITE) than automaticly unpacked, patched (if configured even
config.sub and config.guess are updated), compiled, installed and - as
this is a library - prepared for further use by the buildroot. (exactly
the lib will be installed a second time into the staging dir, while the
headers will be deleted from the rootfs).

Other targets are:
$(PACKAGE_BUILD_DIR)/.unpacked
$(PACKAGE_BUILD_DIR)/.patched
$(PACKAGE_BUILD_DIR)/.configured
$(PACKAGE_BUILD_DIR)/.build
$(PACKAGE_BUILD_DIR)/.installed (for normal programs, also done by .libs)
$(PACKAGE_BUILD_DIR)/.libs

They all are chained along so picking up the one you like to go along
with will do the thing.
To get even more packages to work with, you can also give some options
to make and configure:

$(PACKAGE_CONF_ENV) will take environment varaibles for configure
$(PACKAGE_CONF_OPT) takes Options passed to configure
$(PACKAGE_MAKE_ENV) and
$(PACKAGE_MAKE_OPT) do the same for the make-runs.

If you just want to bypass or change some particular steps you only
create a rule in your Makefile like

$(PACKAGE_BUILD_DIR)/.configured: $(PACKAGE_BUILD_DIR)/.patched
	touch $@

Which will simply bypass the step of configuration, eg because your
package can't be configured by using a script.
Adding some code below that line will run it. But only this!


The Second patch is mostly an example (Thats way they come along in one
Mail) integrating the ALSA-libs and utils. (Most notably a mixer to
adjust the volume of your soundcard)

best regards

Benjamin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: autotools.patch
Type: text/x-diff
Size: 4650 bytes
Desc: autotools.patch
Url : http://busybox.net/lists/buildroot/attachments/20070607/725f1215/attachment-0002.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa.patch
Type: text/x-diff
Size: 4796 bytes
Desc: alsa.patch
Url : http://busybox.net/lists/buildroot/attachments/20070607/725f1215/attachment-0003.bin 
