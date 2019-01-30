From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:14:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: add support for a limited
 set of configuration options
Message-ID: <20190130201416.9078-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Wouter Vermeiren <wouter.vermeiren@nokia.com>

Signed-off-by: Wouter Vermeiren <wouter.vermeiren@nokia.com>
[ThomasDS: align with Buildroot coding style]
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pugixml/Config.in  | 67 ++++++++++++++++++++++++++++++++++++++
 package/pugixml/pugixml.mk | 26 +++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index c37b1df9e5..f3432d873d 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -18,5 +18,72 @@ config BR2_PACKAGE_PUGIXML
 	  http://pugixml.org/
 	  https://github.com/zeux/pugixml
 
+if BR2_PACKAGE_PUGIXML
+
+config BR2_PACKAGE_PUGIXML_WCHAR_MODE
+	bool "Enable wchar_t mode"
+	help
+	  Toggles between UTF-8 (default) style interface (the in-memory
+	  text encoding is assumed to be UTF-8, most functions use char
+	  as character type) and UTF-16/32 style interface (the
+	  in-memory text encoding is assumed to be UTF-16/32, depending
+	  on wchar_t size, most functions use wchar_t as character type)
+
+	  http://pugixml.org/docs/manual.html#dom.unicode
+
+config BR2_PACKAGE_PUGIXML_COMPACT
+	bool "Enable compact mode"
+	help
+	  Activates a different internal representation of document
+	  storage that is much more memory efficient for documents with
+	  a lot of markup (i.e.  nodes and attributes), but is slightly
+	  slower to parse and access.
+
+	  http://pugixml.org/docs/manual.html#dom.memory.compact
+
+config BR2_PACKAGE_PUGIXML_NO_XPATH_SUPPORT
+	bool "Disable XPath support"
+	help
+	  Disables XPath support in pugixml. Both XPath interfaces and
+	  XPath implementation are excluded from compilation. This
+	  option is provided in case you do not need XPath functionality
+	  and need to save code space.
+
+config BR2_PACKAGE_PUGIXML_NO_STL_SUPPORT
+	bool "Disable STL support"
+	help
+	  Disables use of STL in pugixml. The functions that operate on
+	  STL types are no longer present (i.e. load/save via iostream)
+	  if this macro is defined.  This option is provided in case
+	  your target platform does not have a standard-compliant STL
+	  implementation.
+
+config BR2_PACKAGE_PUGIXML_NO_EXCEPTIONS
+	bool "Disable exceptions"
+	help
+	  Disables use of exceptions in pugixml. This option is provided
+	  in case your target platform does not have exception handling
+	  capabilities.
+
+config BR2_PACKAGE_PUGIXML_HEADER_ONLY
+	bool "Enable header-only version"
+	help
+	  All source code for pugixml will be included in every
+	  translation unit that includes pugixml.hpp. This is how most
+	  of Boost and STL libraries work.
+
+	  http://pugixml.org/docs/manual.html#install.building.header
+
+config BR2_PACKAGE_PUGIXML_HAS_LONG_LONG
+	bool "Enable long long support"
+	help
+	  Enables support for long long type in pugixml. This define is
+	  automatically enabled if your platform is known to have long
+	  long support (i.e. has C++11 support or uses a reasonably
+	  modern version of a known compiler); if pugixml does not
+	  recognize that your platform supports long long but in fact it
+	  does, you can enable the define manually.
+endif
+
 comment "pugixml needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index e5188e5f53..02706e36f5 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -10,4 +10,30 @@ PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
 PUGIXML_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PUGIXML_WCHAR_MODE),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_WCHAR_MODE
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_NO_XPATH_SUPPORT),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_NO_STL_SUPPORT),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_STL
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_NO_EXCEPTIONS),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_EXCEPTIONS
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_HAS_LONG_LONG),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
+endif
+
+ifneq (,$(PUGIXML_BUILD_DEFINES))
+PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(strip $(PUGIXML_BUILD_DEFINES)))"
+endif
+
 $(eval $(cmake-package))
-- 
2.19.2
