From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:28:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822162832.37D6BA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:28:31 -0700 (Wed, 22 Aug 2007)
New Revision: 19655

Log:
- add some $(Q) here and there


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:21:13 UTC (rev 19654)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:28:31 UTC (rev 19655)
@@ -129,25 +129,25 @@
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	$(call MESSAGE,"Downloading")
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
-	$(if $($(PKG)_PATCH),test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
-	mkdir -p $(@D)
-	touch $@
+	$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	$(if $($(PKG)_PATCH),$(Q)test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
+	$(Q)mkdir -p $(@D)
+	$(Q)touch $@
 
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
 	$(call MESSAGE,"Extracting")
-	mkdir -p $(@D)
-	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
+	$(Q)mkdir -p $(@D)
+	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+	$(Q)$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	$(Q)touch $@
 
 # Patch
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	(if test -d package/$($(PKG)_NAME) ; then \
+	$(Q)(if test -d package/$($(PKG)_NAME) ; then \
 	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
 	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
@@ -158,24 +158,25 @@
 	  fi; \
 	fi)
 ifeq ($(strip $(BR2_UPDATE_CONFIG)),y)
-	@(for file in config.guess config.sub; do \
+	$(Q)(for file in config.guess config.sub; do \
 		for i in $$(find $(@D) -name $$file); do \
 			cp package/gnuconfig/$$file $$i; \
 		done;\
 	done)
 endif
-	touch $@
+	$(Q)touch $@
 
 # Running autoreconf
 $(BUILD_DIR)/%/.stamp_autoconfigured:
 	$(call MESSAGE,"Running autoreconf")
-	cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
-	touch $@
+	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
+	$(Q)touch $@
 
 # Configuring
 $(BUILD_DIR)/%/.stamp_configured:
 	$(call MESSAGE,"Configuring")
-	if test "$($(PKG)_AUTORECONF)" = "YES" ; then \
+	$(Q)if test "$($(PKG)_AUTORECONF)" = "YES" ; then \
+		$(call MESSAGE,"Running autoreconf")
 		cd $(@D)/$($(PKG)_SUBDIR) && \
 		$(AUTORECONF) ; \
 	fi
@@ -192,13 +193,13 @@
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		$($(PKG)_CONF_OPT)
-	touch $@
+	$(Q)touch $@
 
 # Build
 $(BUILD_DIR)/%/.stamp_built:
 	$(call MESSAGE,"Building")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	touch $@
+	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
