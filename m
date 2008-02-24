From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Feb 2008 12:18:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ezxml
Message-ID: <20080224201802.8978B12C5C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-24 12:18:00 -0800 (Sun, 24 Feb 2008)
New Revision: 21102

Log:
ezxml package


Added:
   trunk/buildroot/package/ezxml/
   trunk/buildroot/package/ezxml/Config.in
   trunk/buildroot/package/ezxml/ezxml-0.8.6-allow-compiler-override.patch
   trunk/buildroot/package/ezxml/ezxml.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-02-24 20:17:53 UTC (rev 21101)
+++ trunk/buildroot/package/Config.in	2008-02-24 20:18:00 UTC (rev 21102)
@@ -423,6 +423,7 @@
 
 if BR2_XML_SUPPORT
 source "package/expat/Config.in"
+source "package/ezxml/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/xerces/Config.in"

Added: trunk/buildroot/package/ezxml/Config.in
===================================================================
--- trunk/buildroot/package/ezxml/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ezxml/Config.in	2008-02-24 20:18:00 UTC (rev 21102)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EZXML
+	bool "ezxml"
+	default n
+	help
+	  ezXML is a XML parser C library that is simple and easy to use.
+
+	  http://ezxml.sf.net

Added: trunk/buildroot/package/ezxml/ezxml-0.8.6-allow-compiler-override.patch
===================================================================
--- trunk/buildroot/package/ezxml/ezxml-0.8.6-allow-compiler-override.patch	                        (rev 0)
+++ trunk/buildroot/package/ezxml/ezxml-0.8.6-allow-compiler-override.patch	2008-02-24 20:18:00 UTC (rev 21102)
@@ -0,0 +1,17 @@
+diff -urpN ezxml/GNUmakefile ezxml.patched/GNUmakefile
+--- ezxml/GNUmakefile	2006-03-25 18:44:04.000000000 +0100
++++ ezxml.patched/GNUmakefile	2008-02-24 13:57:37.000000000 +0100
+@@ -21,10 +21,10 @@
+ # TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ # SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-CC = gcc
+-AR = ar
++CC ?= gcc
++AR ?= ar
+ RM = rm -f
+-CFLAGS = -Wall -O2
++CFLAGS ?= -Wall -O2
+ DEBUG_CFLAGS = -O0 -g
+ OBJS = ezxml.o
+ LIB = libezxml.a

Added: trunk/buildroot/package/ezxml/ezxml.mk
===================================================================
--- trunk/buildroot/package/ezxml/ezxml.mk	                        (rev 0)
+++ trunk/buildroot/package/ezxml/ezxml.mk	2008-02-24 20:18:00 UTC (rev 21102)
@@ -0,0 +1,47 @@
+#############################################################
+#
+# ezxml
+#
+#############################################################
+
+EZXML_VERSION:=0.8.6
+EZXML_SOURCE:=ezxml-$(EZXML_VERSION).tar.gz
+EZXML_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ezxml/
+EZXML_DIR:=$(BUILD_DIR)/ezxml
+
+$(DL_DIR)/$(EZXML_SOURCE):
+	$(WGET) -P $(DL_DIR) $(EZXML_SITE)/$(EZXML_SOURCE)
+
+$(EZXML_DIR)/.unpacked: $(DL_DIR)/$(EZXML_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(EZXML_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(EZXML_DIR) package/ezxml/ ezxml-$(EZXML_VERSION)\*.patch
+	touch $@
+
+$(EZXML_DIR)/.configured: $(EZXML_DIR)/.unpacked
+	touch $@
+
+$(EZXML_DIR)/libezxml.a: $(EZXML_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
+	-f GNUmakefile -C $(EZXML_DIR)
+
+$(STAGING_DIR)/usr/lib/libezxml.a: $(EZXML_DIR)/libezxml.a
+	cp $(EZXML_DIR)/ezxml.h $(STAGING_DIR)/usr/include
+	cp $(EZXML_DIR)/libezxml.a $(STAGING_DIR)/usr/lib
+
+ezxml: uclibc $(STAGING_DIR)/usr/lib/libezxml.a
+
+ezxml-source: $(DL_DIR)/$(EZXML_SOURCE)
+
+ezxml-clean:
+	-$(MAKE) -C $(EZXML_DIR) -f GNUmakefile clean
+
+ezxml-dirclean:
+	rm -rf $(EZXML_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_EZXML)),y)
+TARGETS+=ezxml
+endif
