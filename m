From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 11:06:13 +0100
Subject: [Buildroot] [PATCHv4] package/pugixml: add support for a limited
 set of configuration options
Message-ID: <20190204100613.25609-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Wouter Vermeiren <wouter.vermeiren@nokia.com>

Add config options for a few pugixml configurables.

- Xpath support is enabled by default but has a size impact. Disabling it
  reduces the size significantly (it almost halves). Output of 'size' on the
  library compiled for x86:
  - Xpath support enabled
 160374	   1244	     28	 161646	  2776e	output/target/usr/lib/libpugixml.so.1.7
  - Xpath support disabled
  92754	    880	      8	  93642	  16dca	usr/lib/libpugixml.so.1.7

- Compact and header-only modes are not strictly needed for our use case, but we
  did the work anyway and may be useful for someone else.

Signed-off-by: Wouter Vermeiren <wouter.vermeiren@nokia.com>
[ThomasDS:
- align with Buildroot coding style
- retain only feature options: xpath, compact mode, header-only]
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pugixml/Config.in  | 32 ++++++++++++++++++++++++++++++++
 package/pugixml/pugixml.mk | 14 ++++++++++++++
 2 files changed, 46 insertions(+)

v4:
- drop options for exceptions, stl, wchar
- drop forced 'long long' support: enabled by C++11 anyway (gcc 4.8+).
v3:
- always enable 'long long' type (feedback Arnout Vandecappelle)
- remove unnecessary 'strip' on PUGIXML_BUILD_DEFINES
v2: (feedback Thomas Petazzoni)
- change 'disable' options into 'enable' and reorder them to be first
- rename 'has-long-long' option


diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index c37b1df9e5..6b7d2e3259 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -18,5 +18,37 @@ config BR2_PACKAGE_PUGIXML
 	  http://pugixml.org/
 	  https://github.com/zeux/pugixml
 
+if BR2_PACKAGE_PUGIXML
+
+config BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
+	bool "Enable XPath support"
+	default y
+	help
+	  When disabled, both XPath interfaces and XPath implementation
+	  are excluded from compilation. This option is provided in case
+	  you do not need XPath functionality and need to save code
+	  space.
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
index e5188e5f53..acf22604c4 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -10,4 +10,18 @@ PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
 PUGIXML_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
+PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
+endif
+ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
+PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
+endif
+
+ifdef PUGIXML_BUILD_DEFINES
+PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
+endif
+
 $(eval $(cmake-package))
-- 
2.19.2
