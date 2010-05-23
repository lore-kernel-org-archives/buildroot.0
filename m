From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 May 2010 23:32:49 +0200
Subject: [Buildroot] [git commit master] icu: fix build with gcc >= 4.4 /
	JLEVEL > 1
Message-ID: <20100523213311.E7AB812EEF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da86b5aceeb2564d10f337e7c7fec01dafa4ad3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix two issues with the icu build:
- icu source contains an #elif without any arguments, which g++ >= 4.4
  flags as an error. This is both an issue for target and host build,
  so restructure the .mk so any *both*patch is applied to both builds
  (the other patches would cause trouble with host builds)
- icu build system isn't parallel make safe, use MAKE1

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    2 +-
 package/icu/icu-both-elif-no-arguments.patch |   23 +++++++++++++++++++++++
 package/icu/icu.mk                           |    5 +++--
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 package/icu/icu-both-elif-no-arguments.patch

diff --git a/CHANGES b/CHANGES
index 6d2fbf0..72b2158 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: aumix, avahi, busybox, cairo, cdrkit,
-	fltk, gettext, gmpc, grep, hal, iconv, libcgicc, libglib2,
+	fltk, gettext, gmpc, grep, hal, iconv, icu, libcgicc, libglib2,
 	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
 	mtd-utils, mutt, netsnmp, ntp, pango, php, psmisc, qt, samba,
 	sshfs, startup-notification, uemacs, util-linux, vpnc
diff --git a/package/icu/icu-both-elif-no-arguments.patch b/package/icu/icu-both-elif-no-arguments.patch
new file mode 100644
index 0000000..8941c53
--- /dev/null
+++ b/package/icu/icu-both-elif-no-arguments.patch
@@ -0,0 +1,23 @@
+[PATCH] icu: fix #elif without arguments
+
+ParagraphLayout.cpp contains an #elif without any arguments, which
+g++ >= 4.4 flags as an error. Fix it by replacing it with an #else.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ source/layoutex/ParagraphLayout.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: source/layoutex/ParagraphLayout.cpp
+===================================================================
+--- source.orig/layoutex/ParagraphLayout.cpp
++++ source/layoutex/ParagraphLayout.cpp
+@@ -813,7 +813,7 @@ le_int32 ParagraphLayout::getLanguageCod
+ 
+     return nullLanguageCode;
+ }
+-#elif
++#else
+ 
+ // TODO - dummy implementation for right now...
+ le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 589c31f..17f153e 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -21,6 +21,7 @@ $(ICU_DIR)/.unpacked: $(DL_DIR)/$(ICU_SOURCE)
 	$(CONFIG_UPDATE) $(ICU_DIR)
 	cp -a $(BUILD_DIR)/icu $(BUILD_DIR)/icu-host
 	toolchain/patch-kernel.sh $(ICU_DIR) package/icu/ \*.patch
+	toolchain/patch-kernel.sh $(ICU_HOST_DIR) package/icu/ \*both\*.patch
 	touch $(ICU_DIR)/.unpacked
 
 $(ICU_HOST_DIR)/.configured: $(ICU_DIR)/.unpacked
@@ -45,13 +46,13 @@ $(ICU_DIR)/.configured: $(ICU_HOST_DIR)/.configured
 	touch $(ICU_DIR)/.configured
 
 $(ICU_HOST_DIR)/.done: $(ICU_DIR)/.configured
-	$(MAKE) -C $(ICU_HOST_DIR)
+	$(MAKE1) -C $(ICU_HOST_DIR)
 	ln -s -f $(ICU_HOST_DIR)/bin $(ICU_DIR)/bin-host
 	ln -s -f $(ICU_HOST_DIR)/lib $(ICU_DIR)/lib-host
 	touch $(ICU_HOST_DIR)/.done
 
 $(ICU_DIR)/.done: $(ICU_HOST_DIR)/.done
-	$(MAKE) -C $(ICU_DIR)
+	$(MAKE1) -C $(ICU_DIR)
 	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(STAGING_DIR)
 	$(MAKE) -C $(ICU_DIR) install DESTDIR=$(TARGET_DIR)
 	$(SED) "s,^default_prefix=.*,default_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/icu-config
-- 
1.6.3.3
