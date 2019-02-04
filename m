From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:14:33 +0100
Subject: [Buildroot] [git commit] package/pugixml: add support for a limited
 set of configuration options
Message-ID: <20190204141958.05B4C837A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48b2e50eb8df36e3e3ab18692bd9e0dde3b38702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pugixml/Config.in  | 32 ++++++++++++++++++++++++++++++++
 package/pugixml/pugixml.mk | 14 ++++++++++++++
 2 files changed, 46 insertions(+)

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
