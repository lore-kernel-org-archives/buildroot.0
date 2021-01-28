From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 18:29:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: drop
 BR2_PACKAGE_PUGIXML_HEADER_ONLY
Message-ID: <20210128172935.4138671-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop BR2_PACKAGE_PUGIXML_HEADER_ONLY which raises a build failure with
gerbera (the only package that is using pugixml). Indeed, there is two
issues:
 - gerbera is not aware that it must define PUGIXML_HEADER_ONLY
 - pugixml.cpp is not available in the staging directory so gerbera
   can't use it

It should be noted that pugixml continues to install a (non working)
library even when PUGIXML_HEADER_ONLY is enabled resulting in a build
failure at linking stage instead of configure step:

[100%] Linking CXX executable gerbera
/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/8.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: liblibgerbera.a(config_manager.cc.o): in function `ConfigManager::getElement(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >) const':
config_manager.cc:(.text+0x4d8): undefined reference to `pugi::xml_document::document_element() const'

Fixes:
 - http://autobuild.buildroot.org/results/9c1919bacd23da0505a4eb828a806997a23b640f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy           | 5 +++++
 package/pugixml/Config.in  | 9 ---------
 package/pugixml/pugixml.mk | 3 ---
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2bf39d7175..4607528a75 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_PUGIXML_HEADER_ONLY
+	bool "pugixml header-only support removed"
+	help
+	  The support for pugixml header-only mode has been removed.
+
 config BR2_PACKAGE_LIBUPNP18
 	bool "libupnp18 package removed"
 	select BR2_LEGACY
diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index 6b7d2e3259..d5a3cb3ebb 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -39,15 +39,6 @@ config BR2_PACKAGE_PUGIXML_COMPACT
 
 	  http://pugixml.org/docs/manual.html#dom.memory.compact
 
-config BR2_PACKAGE_PUGIXML_HEADER_ONLY
-	bool "Enable header-only version"
-	help
-	  All source code for pugixml will be included in every
-	  translation unit that includes pugixml.hpp. This is how most
-	  of Boost and STL libraries work.
-
-	  http://pugixml.org/docs/manual.html#install.building.header
-
 endif
 
 comment "pugixml needs a toolchain w/ C++"
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 800a3836ce..14a3b7954d 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -23,9 +23,6 @@ endif
 ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
 endif
-ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
-PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
-endif
 
 ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
-- 
2.29.2
