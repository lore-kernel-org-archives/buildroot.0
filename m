From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  2 Feb 2019 21:25:59 +0100
Subject: [Buildroot] [PATCHv3] package/pugixml: add support for a limited
 set of configuration options
Message-ID: <20190202202559.19535-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Wouter Vermeiren <wouter.vermeiren@nokia.com>

Signed-off-by: Wouter Vermeiren <wouter.vermeiren@nokia.com>
[ThomasDS:
- align with Buildroot coding style
- rename some options
- always enable 'long long' type
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pugixml/Config.in  | 62 ++++++++++++++++++++++++++++++++++++++
 package/pugixml/pugixml.mk | 25 +++++++++++++++
 2 files changed, 87 insertions(+)

v3:
- always enable 'long long' type (feedback Arnout Vandecappelle)
- remove unnecessary 'strip' on PUGIXML_BUILD_DEFINES
v2: (feedback Thomas Petazzoni)
- change 'disable' options into 'enable' and reorder them to be first
- rename 'has-long-long' option

diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index c37b1df9e5..421f19f0f2 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -18,5 +18,67 @@ config BR2_PACKAGE_PUGIXML
 	  http://pugixml.org/
 	  https://github.com/zeux/pugixml
 
+if BR2_PACKAGE_PUGIXML
+
+config BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
+	bool "Enable XPath support"
+	default y
+	help
+	  Enables XPath support in pugixml.
+	  When disabled, both XPath interfaces and XPath implementation
+	  are excluded from compilation. This option is provided in case
+	  you do not need XPath functionality and need to save code
+	  space.
+
+config BR2_PACKAGE_PUGIXML_STL_SUPPORT
+	bool "Enable STL support"
+	default y
+	help
+	  Enables use of STL in pugixml.
+	  When disabled, the functions that operate on STL types are no
+	  longer present (i.e. load/save via iostream). This option is
+	  provided in case your target platform does not have a
+	  standard-compliant STL implementation.
+
+config BR2_PACKAGE_PUGIXML_EXCEPTIONS
+	bool "Enable exceptions"
+	default y
+	help
+	  Enables use of exceptions in pugixml. This option is provided
+	  in case your target platform does not have exception handling
+	  capabilities.
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
+config BR2_PACKAGE_PUGIXML_HEADER_ONLY
+	bool "Enable header-only version"
+	help
+	  All source code for pugixml will be included in every
+	  translation unit that includes pugixml.hpp. This is how most
+	  of Boost and STL libraries work.
+
+	  http://pugixml.org/docs/manual.html#install.building.header
+
+endif
+
 comment "pugixml needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index e5188e5f53..faeec4368a 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -10,4 +10,29 @@ PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
 PUGIXML_INSTALL_STAGING = YES
 
+# gcc always supports 'long long' type, see
+# https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
+PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
+
+ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_STL_SUPPORT),)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_STL
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_EXCEPTIONS),)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_EXCEPTIONS
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_WCHAR_MODE),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_WCHAR_MODE
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
+endif
+
+PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
+
 $(eval $(cmake-package))
-- 
2.19.2
