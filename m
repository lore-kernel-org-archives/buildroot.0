From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Thu, 18 Jul 2013 16:47:35 +0000
Subject: [Buildroot] custom extraction and libs11n
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F451B3DA8@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451B3DA8@G4W3291.americas.hpqcorp.net>
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F451B4629@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to include Config.in:

config BR2_PACKAGE_LIBS11N
    bool "libs11n"
    select BR2_PACKAGE_EXPAT
    help
      An Open Source project focused on the generic serialization of objects (i.e., object persistence) in C++.

      http://s11n.net/


From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Jenkins, Lee (ISS Houston)
Sent: Thursday, July 18, 2013 11:19 AM
To: buildroot at uclibc.org
Subject: [Buildroot] custom extraction and libs11n
Importance: Low

I have added the package libs11n to buildroot. I've tested the patch and makefile on my system and it appears to be working correctly.


--- buildroot/package/Makefile.package.in 2013-07-18 09:42:31.458605792 -0500
+++ buildroot-mods/package/Makefile.package.in       2013-07-18 09:41:40.614605176 -0500
@@ -244,8 +245,10 @@
$(BUILD_DIR)/%/.stamp_extracted:
        @$(call MESSAGE,"Extracting")
        $(Q)mkdir -p $(@D)
-       $(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
+       $(if $($(PKG)_EXTRACT_CMDS), @echo $(PKG)_EXTRACT_CMDS IS DEFINED )
+       $(if $($(PKG)_EXTRACT_CMDS), $($(PKG)_EXTRACT_CMDS), \
+       $(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -) )
# some packages have messed up permissions inside
        $(Q)chmod -R ug+rw $(@D)
        $(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))



#############################################################
#
# libs11n
#
#############################################################

LIBS11N_VERSION          = 1.2.10
LIBS11N_SOURCE_BASENAME  = libs11n-$(LIBS11N_VERSION)-nobuildfiles
LIBS11N_SOURCE           = $(LIBS11N_SOURCE_BASENAME).zip
LIBS11N_MAKE_DIR         = $(@D)/src
LIBS11N_SITE             = http://s11n.net/download
LIBS11N_LICENSE          = Public Domain
LIBS11N_INSTALL_STAGING  = YES
LIBS11N_DEPENDENCIES     = expat

# use a custom extract because standard buildroot does not support .zip files
# also, the files are extracted into a directory named libs11n-$(LIBS11N_VERSION)-nobuildfiles -- but
# buildroot requires them to be put in libs11n-$(LIBS11N_VERSION) -- which buildroot creates
define LIBS11N_EXTRACT_CMDS
    unzip $(DL_DIR)/$(LIBS11N_SOURCE) -d $(@D)
    mv $(@D)/$(LIBS11N_SOURCE_BASENAME)/* $(@D)
    rmdir $(@D)/$(LIBS11N_SOURCE_BASENAME)
endef

define LIBS11N_CONFIGURE_CMDS
    # use the configure command to modify the stock Makefile because
    # it tries and fails to build an unneeded binary
    cd $(LIBS11N_MAKE_DIR) ; sed -i 's/install: bins libs/install: libs/' Makefile ; sed -i '/cp ..S11NCONVERT_BIN/d' Makefile
endef

define LIBS11N_BUILD_CMDS
    $(MAKE) CXX="$(TARGET_CC)" -C $(LIBS11N_MAKE_DIR) all
endef

define LIBS11N_INSTALL_STAGING_CMDS
    $(MAKE) CXX="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) -C $(LIBS11N_MAKE_DIR) install
endef

define LIBS11N_INSTALL_TARGET_CMDS
    $(MAKE) CXX="$(TARGET_CC)" DESTDIR=$(TARGET_DIR) -C $(LIBS11N_MAKE_DIR) install
endef

define LIBS11N_CLEAN_CMDS
    $(MAKE) -C $(LIBS11N_MAKE_DIR) clean
endef

$(eval $(call AUTOTARGETS,package,libs11n))


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130718/3bf0ef5b/attachment-0001.html>
