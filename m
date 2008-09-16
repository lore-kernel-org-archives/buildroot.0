From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 16 Sep 2008 17:47:10 +0100
Subject: [Buildroot] Makefile.autotools.in patch RFC
Message-ID: <1221583630.5843.1.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After my recent patching issues I thought I would post a patch here
first to see if any one has any feedback before I apply it via SVN.

These patches do 2 things.

1. I added a HOOK_POST_EXTRACT previously so that I could cope with the
bad libxml2 package.  This required me to remove some dead patches
(.rej) files after I extracted the package, the issue is that the
EXTRACT target runs patch-kernel.sh to patch the ltmain.sh.  
It then finds some.rej files and bombs out.
I have altered the sequence so that the HOOK_POST_EXTRACT target runs
before the make target that patches libtool to deal with this.

2.) I have added a $(PKG)_LIBTOOL_PATCH variable.  This is defaulted to
YES however if you override it in the package makefile to NO then the
ltmain.sh file will not be patched automatically but only if you have
added your own patches.  
This is necessary for freetype 2.3.7 as it cannot use the
buildroot-libtool patch.

The patch is below for your comments:
Many thanks
Daniel Laird

--- buildroot/SVN/buildroot.orig/package/Makefile.autotools.in
+++ buildroot/SVN/buildroot/package/Makefile.autotools.in 
@@ -30,6 +30,8 @@
 #	list of (package) targets that must be built before foo
 # FOO_AUTORECONF [YES/NO, default NO]
 #	run <autoreconf> before <configure>
+# FOO_LIBTOOL_PATCH [YES/NO, default YES]
+#	Do you want the standard buildroot patch applied to ltmain.sh? (libtool)
 # FOO_CONF_ENV [default empty]
 #	environment passed to the <configure> script
 # FOO_CONF_OPT [default empty]
@@ -153,10 +155,17 @@
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 # some packages have messed up permissions inside
 	$(Q)chmod -R ug+rw $(@D)
+	$(Q)touch $@
+
+# Fix libtool support if required by the package
+$(BUILD_DIR)/%/.stamp_libtool_patch:
+	$(call MESSAGE,"Patching libtool")
 # if the package uses libtool, patch it for cross-compiling in buildroot
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 	for i in `find $(@D) -name ltmain.sh`; do \
 		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
-	done
+		done \
+	fi
 	$(Q)touch $@
 
 # Patch
@@ -193,9 +202,11 @@
 	$(call MESSAGE,"Running autoreconf")
 	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
 # if the package uses libtool, patch it for cross-compiling in buildroot
+	if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 	$(Q)for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
 		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
-		done
+		done \
+	fi
 	$(Q)touch $@
 
 # Configuring
@@ -287,6 +298,7 @@
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
 $(2)_DEPENDENCIES		?=
 $(2)_AUTORECONF			?= NO
+$(2)_LIBTOOL_PATCH		?= YES
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
@@ -309,6 +321,7 @@
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_AUTORECONF =	$$($(2)_DIR)/.stamp_autoconfigured
+$(2)_TARGET_LIBTOOL_PATCH =	$$($(2)_DIR)/.stamp_libtool_patch
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -357,7 +370,8 @@
 
 $(1)-extract:		$(1)-depends \
 			$$($(2)_TARGET_EXTRACT) \
-			$$($(2)_HOOK_POST_EXTRACT)
+			$$($(2)_HOOK_POST_EXTRACT) \
+			$$($(2)_TARGET_LIBTOOL_PATCH)
 
 $(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
@@ -377,6 +391,7 @@
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_LIBTOOL_PATCH):		PKG=$(2)
 $$($(2)_TARGET_AUTORECONF):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
@@ -385,7 +400,7 @@
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_HOOK_POST_EXTRACT):		PKG=$(2)
-$$($(2)_HOOK_POST_CONFIGURE):		PKG=$(2)
+$$($(2)_HOOK_POST_CONFIGURE):		PKG=$(2)
 $$($(2)_HOOK_POST_BUILD):		PKG=$(2)
 $$($(2)_HOOK_POST_INSTALL):		PKG=$(2)
