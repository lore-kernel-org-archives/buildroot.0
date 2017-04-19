From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:02 +0200
Subject: [Buildroot] [PATCH 4/9] xenomai: add option for Smokey skin
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Xenomai has a skin 'Smokey' that Buildroot is currently unaware of, which
means that the associated files are present on target even though most users
will not need them.

Add a config option and associated logic to remove the skin if not selected.

Additionally, fixup order of VxWorks skin removal entry.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 5 +++++
 package/xenomai/xenomai.mk | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 31d63f1..d6474bd 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -137,6 +137,11 @@ config BR2_PACKAGE_XENOMAI_RTAI_SKIN
 	help
 	  This option allows to install the RTAI Xenomai skin
 
+config BR2_PACKAGE_XENOMAI_SMOKEY_SKIN
+	bool "Smokey skin"
+	help
+	  This option allows to install the Smokey Xenomai skin
+
 config BR2_PACKAGE_XENOMAI_UITRON_SKIN
 	bool "uITRON skin"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index e93fcf4..0866144 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -94,10 +94,11 @@ endif
 
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_SMOKEY_SKIN),,smokey)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
 
 define XENOMAI_REMOVE_SKINS
@@ -106,6 +107,9 @@ define XENOMAI_REMOVE_SKINS
 		if [ $$i == "posix" ] ; then \
 			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
 		fi ; \
+		if [ $$i == "smokey" ] ; then \
+			rm -f $(TARGET_DIR)/usr/bin/smokey* ; \
+		fi ; \
 	done
 endef
 
-- 
2.10.2
