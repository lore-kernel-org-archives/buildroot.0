From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 7 May 2008 17:05:25 -0700 (PDT)
Subject: [Buildroot]  Need help adding/updating Makefile.autotools.in
Message-ID: <17117160.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
 
I need some help/guidance to add/update Makefile.autotools.in to add few
options for different packages.
 
During building of few packages i observed that
 
1. packages like pcmanfm, vlc needs few data files like icons, .desktop
files to installed to target_dir/usr/share/ folder 2. packages like
libxml2,xlib_libXft needs there (pkg)-config files to edited to change
prefix,exec-prefix variables to point to staging_dir/usr rather than just
/usr
 
For giving the 1st option i changed Makefile.autotools.in a bit to give
option to add install data as below. 
 
--- Makefile.autotools.in_orig 2008-04-08 16:10:24.000000000 -0400
+++ Makefile.autotools.in 2008-05-04 20:36:14.000000000 -0400
@@ -43,10 +43,14 @@
 # install the package to the staging directory  # FOO_INSTALL_TARGET
[YES/NO, default YES]  # install the package to the target directory
+# FOO_INSTALL_DATA [YES/NO, default YES] # install the data from 
+package to the target directory
 # FOO_INSTALL_STAGING_OPT [default DESTDIR=$(STAGING_DIR)/usr install]  #
arguments passed to <make> while installing to the staging directory  #
FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR)/usr install-exec]  #
arguments passed to <make> while installing to the target directory
+# FOO_INSTALL_TARGET_DATA [default DESTDIR=$(TARGET_DIR)/usr 
+install-data] # arguments passed to <make> while installing data to the 
+target directory
 # FOO_CLEAN_OPT [default clean]
 # arguments passed to <make> while installing to the staging directory  #
FOO_UNINSTALL_STAGING_OPT  [default DESTDIR=$(STAGING_DIR)/usr uninstall] @@
-68,7 +72,7 @@  #  ## The following variables contain targets that can be
overriden  # -# FOO_TARGET_INSTALL_TARGET FOO_TARGET_INSTALL_STAGING
FOO_TARGET_BUILD
+# FOO_TARGET_INSTALL_TARGET FOO_TARGET_INSTALL_DATA 
+FOO_TARGET_INSTALL_STAGING FOO_TARGET_BUILD
 # FOO_TARGET_CONFIGURE FOO_TARGET_PATCH FOO_TARGET_EXTRACT
FOO_TARGET_SOURCE  # FOO_TARGET_UNINSTALL FOO_TARGET_CLEAN
FOO_TARGET_DIRCLEAN  # @@ -232,6 +244,12 @@
$(BUILD_DIR)/%/.stamp_target_installed:
  done)
  touch $@
 
+# Install to target dir
+$(BUILD_DIR)/%/.stamp_target_data_installed:
+ $(call MESSAGE,"Installing data to target")
+ $($(PKG)_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR)  install-data -C 
+$(@D)/$($(PKG)_SUBDIR)  touch $@
+
 $(BUILD_DIR)/%/.stamp_cleaned:
  $(call MESSAGE,"Cleaning up")
  -$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_STAGING_OPT) -C
$(@D)/$($(PKG)_SUBDIR)
@@ -278,8 +296,10 @@ $(2)_MAKE_ENV   ?=
 $(2)_MAKE_OPT   ?=
 $(2)_INSTALL_STAGING  ?= NO
 $(2)_INSTALL_TARGET  ?= YES
+$(2)_INSTALL_DATA  ?= YES
 $(2)_INSTALL_STAGING_OPT ?= DESTDIR=$$(STAGING_DIR) install 
$(2)_INSTALL_TARGET_OPT  ?= DESTDIR=$$(TARGET_DIR)  install-exec
+$(2)_INSTALL_TARGET_DATA ?= DESTDIR=$$(TARGET_DIR)  install-data
 $(2)_CLEAN_OPT   ?= clean
 $(2)_UNINSTALL_STAGING_OPT ?= DESTDIR=$$(STAGING_DIR) uninstall 
$(2)_UNINSTALL_TARGET_OPT ?= DESTDIR=$$(TARGET_DIR)  uninstall
@@ -288,6 +308,7 @@ $(2)_DIR_PREFIX   =  $(if $(3),$(3),$(TO
 
 
 # define sub-target stamps
+$(2)_TARGET_INSTALL_DATA = $$($(2)_DIR)/.stamp_target_data_installed
 $(2)_TARGET_INSTALL_TARGET = $$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING = $$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_BUILD =  $$($(2)_DIR)/.stamp_built @@ -314,6 +335,12 @@ else
 $(1)-install-target:
 endif
 
+ifeq ($$($(2)_INSTALL_DATA),YES)
+$(1)-install-data: $(1)-build $$($(2)_TARGET_INSTALL_DATA) else
+$(1)-install-data:
+endif
+
 ifeq ($$($(2)_INSTALL_STAGING),YES)
 $(1)-install-staging: $(1)-build $$($(2)_TARGET_INSTALL_STAGING)  else @@
-350,6 +377,7 @@ $(1)-dirclean:  $$($(2)_TARGET_DIRCLEAN)
 
 # define the PKG variable for all targets, containing the  # uppercase
package variable prefix
+$$($(2)_TARGET_INSTALL_DATA)  PKG=$(2)
 $$($(2)_TARGET_INSTALL_TARGET):  PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING): PKG=$(2)
 $$($(2)_TARGET_BUILD):   PKG=$(2)

 
and changed package Makefile as below (for pcmand fm)
 
#############################################################
#
# pcmanfm
#
#############################################################
PCMANFM_VERSION = 0.3.9.98
PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz PCMANFM_SITE =
http://internap.dl.sourceforge.net/sourceforge/pcmanfm
PCMANFM_AUTORECONF = NO
PCMANFM_INSTALL_STAGING = NO
PCMANFM_INSTALL_TARGET = YES
PCMANFM_INSTALL_DATA = YES
 
PCMANFM_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
PCMANFM_CONF_OPT = --disable-hal
 
PCMANFM_DEPENDENCIES = uclibc libgtk2 gamin startup-notification
 
$(eval $(call AUTOTARGETS,package,pcmanfm))

 
Bu during make, $(BUILD_DIR)/%/.stamp_target_data_installed isnt called and
hence make install-data isn't accomplished.
 
I am not so good in editing makefile.autotools.in file. Kindly correct me
and guide me to update the same.
 
I will try few steps for second option and reply asap
 
Thanks in advance
 
Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Need-help-adding-updating-Makefile.autotools.in-tp17117160p17117160.html
Sent from the BuildRoot mailing list archive at Nabble.com.
