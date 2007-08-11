From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 11 Aug 2007 22:29:31 +0200
Subject: [Buildroot] x11r7 created
	$(BUILD_DIR)/<package-dir>/.stamp_downloaded
Message-ID: <1186864171.4742.15.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile seems to create this file to indicate that it 
had downloaded the source code.
The $(BUILD_DIR) becomes really crowded this way.

I Think we should modify this so that the Makefile
checks for the existance of the source file in $(DL_DIR)
like most other packages.
Tried, (see patch below), but the rule:

+$(DL_DIR)/$$($(PKG)_SOURCE):
        $(call MESSAGE,"Downloading")
        test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR)
$($(PKG)_SITE)/$($(PKG)_SOURCE)
        mkdir -p $(@D)

fails (is not found) so I had to add 

+$$($(2)_TARGET_SOURCE):
+       $(WGET) -P $(DL_DIR) $$($(2)_SITE)/$$($(2)_SOURCE)
+

to make it work.
Anyone got a clue why the first rule fails?


Maybe we should also consider building x11r7 in $(BUILD_DIR)/x11r7
due to crowding.


Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in       (revision 19425)
+++ package/Makefile.autotools.in       (arbetskopia)
@@ -127,7 +127,7 @@

################################################################################
 
 # Retrieve and unpack the archive
-$(BUILD_DIR)/%/.stamp_downloaded:
+$(DL_DIR)/$$($(PKG)_SOURCE):
        $(call MESSAGE,"Downloading")
        test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR)
$($(PKG)_SITE)/$($(PKG)_SOURCE)
        mkdir -p $(@D)
@@ -279,7 +279,7 @@
 $(2)_TARGET_AUTORECONF =       $$($(2)_DIR)/.stamp_autoconfigured
 $(2)_TARGET_PATCH =            $$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =          $$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =           $$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_SOURCE =           $$(DL_DIR)/$$($(2)_SOURCE)
 $(2)_TARGET_UNINSTALL =                $$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =            $$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =         $$($(2)_DIR)/.stamp_dircleaned
@@ -322,6 +322,9 @@
 
 $(1)-depends:          $(1)-source $$($(2)_DEPENDANCIES)
 
+$$($(2)_TARGET_SOURCE):
+       $(WGET) -P $(DL_DIR) $$($(2)_SITE)/$$($(2)_SOURCE)
+
 $(1)-source:           $$($(2)_TARGET_SOURCE)
 
 # non-build targets


Best Regards
Ulf Samuelsson
