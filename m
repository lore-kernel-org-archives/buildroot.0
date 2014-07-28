From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 22:43:04 +0200
Subject: [Buildroot] [git commit] icu: add an option to add a custom data
	library file
Message-ID: <20140728204323.160039D325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abded6bfead49d61c24a45d811a83ca082adf677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use one single BR2_PACKAGE_ICU_CUSTOM_DATA_PATH string option
   instead of a boolean option + a string option, which always causes
   a lot of issues with random configurations that enable the boolean
   option, but do not provide a valid value for the string option.
 - enclose the definition of ICU_COPY_CUSTOM_DATA into the condition.]

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/Config.in |   12 ++++++++++++
 package/icu/icu.mk    |    7 +++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 9a27894..d14f8d8 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -13,6 +13,18 @@ config BR2_PACKAGE_ICU
 
 	  http://site.icu-project.org/
 
+if BR2_PACKAGE_ICU
+
+config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
+	string "Path to custom data library file"
+	help
+	  This option allows to define the path to a custom data
+	  library generated with
+	  http://apps.icu-project.org/datacustom/ICUData51.html. Leave
+	  empty to not use this functionality.
+
+endif
+
 comment "icu needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index f93eab1..208229d 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -26,5 +26,12 @@ ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
+ifneq ($(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH),)
+define ICU_COPY_CUSTOM_DATA
+	cp $(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
+endef
+ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
