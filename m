From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:15:18 +0100
Subject: [Buildroot] [git commit] package/xenomai: smokey's not a skin
Message-ID: <20191219180847.7C1288D204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b2d925fe8f0299f99d4c43f0ca372db3410e8df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That's a testsuite tool.

Rename XENOMAI_REMOVE_SKIN_LIST at this chance as it's cleaning
libraries, not only skins. Ditto, rename the hook accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
[yann.morin.1998 at free.fr: also rename the hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xenomai/Config.in  |  5 -----
 package/xenomai/xenomai.mk | 29 +++++++++++++----------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 83ba8ca162..0cb0b343de 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -170,11 +170,6 @@ config BR2_PACKAGE_XENOMAI_RTAI_SKIN
 	help
 	  This option allows to install the RTAI Xenomai skin
 
-config BR2_PACKAGE_XENOMAI_SMOKEY_SKIN
-	bool "Smokey skin"
-	help
-	  This option allows to install the Smokey Xenomai skin
-
 config BR2_PACKAGE_XENOMAI_UITRON_SKIN
 	bool "uITRON skin"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 16c486eb34..40f9b4af78 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -73,7 +73,7 @@ XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UNNEEDED_FILES
 ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
 define XENOMAI_REMOVE_TESTSUITE
 	rm -rf $(TARGET_DIR)/usr/share/xenomai/
-	for i in clocktest gpiotest latency spitest switchtest \
+	for i in clocktest gpiotest latency smokey spitest switchtest \
 		xeno-test-run-wrapper dohell xeno-test-run xeno-test ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
@@ -109,28 +109,25 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
 endif
 
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_SMOKEY_SKIN),,smokey)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
-
-define XENOMAI_REMOVE_SKINS
-	for i in $(XENOMAI_REMOVE_SKIN_LIST) ; do \
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_TESTSUITE),,smokey)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
+XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
+
+define XENOMAI_REMOVE_LIBS
+	for i in $(XENOMAI_REMOVE_LIBS_LIST) ; do \
 		rm -f $(TARGET_DIR)/usr/lib/lib$$i.* ; \
 		if [ $$i == "posix" ] ; then \
 			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
 		fi ; \
-		if [ $$i == "smokey" ] ; then \
-			rm -f $(TARGET_DIR)/usr/bin/smokey* ; \
-		fi ; \
 	done
 endef
 
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_LIBS
 
 define XENOMAI_DEVICES
 	/dev/rtheap  c  666  0  0  10  254  0  0  -
