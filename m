From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 09:24:44 +0200
Subject: [Buildroot] [git commit] package/ezxml: remove package
Message-ID: <20200517070910.30E2891A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94cb0cc77246075ad7fff7dcc8aa38726cecb38b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ezXML is affected by several CVEs and is not maintained anymore (no
release since 2006) so remove it.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                 |  7 +++++
 package/Config.in                                |  1 -
 package/ezxml/0001-allow-compiler-override.patch | 17 ------------
 package/ezxml/Config.in                          |  7 -----
 package/ezxml/ezxml.hash                         |  3 --
 package/ezxml/ezxml.mk                           | 35 ------------------------
 6 files changed, 7 insertions(+), 63 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c92023310d..5605ba1fad 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_EZXML
+	bool "ezxml package removed"
+	select BR2_LEGACY
+	help
+	  The ezXML package was removed as it is affected by several
+	  CVEs and is not maintained anymore (no release since 2006).
+
 config BR2_PACKAGE_COLLECTD_LVM
 	bool "lvm support in collectd was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c12676d859..c245abbc42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1562,7 +1562,6 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
-	source "package/ezxml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/ezxml/0001-allow-compiler-override.patch b/package/ezxml/0001-allow-compiler-override.patch
deleted file mode 100644
index 827872b714..0000000000
--- a/package/ezxml/0001-allow-compiler-override.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -urpN ezxml/GNUmakefile ezxml.patched/GNUmakefile
---- ezxml/GNUmakefile	2006-03-25 18:44:04.000000000 +0100
-+++ ezxml.patched/GNUmakefile	2008-02-24 13:57:37.000000000 +0100
-@@ -21,10 +21,10 @@
- # TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- # SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- 
--CC = gcc
--AR = ar
-+CC ?= gcc
-+AR ?= ar
- RM = rm -f
--CFLAGS = -Wall -O2
-+CFLAGS ?= -Wall -O2
- DEBUG_CFLAGS = -O0 -g
- OBJS = ezxml.o
- LIB = libezxml.a
diff --git a/package/ezxml/Config.in b/package/ezxml/Config.in
deleted file mode 100644
index 8a1643b118..0000000000
--- a/package/ezxml/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_EZXML
-	bool "ezxml"
-	help
-	  ezXML is a XML parser C library that is simple and easy to
-	  use.
-
-	  http://ezxml.sf.net
diff --git a/package/ezxml/ezxml.hash b/package/ezxml/ezxml.hash
deleted file mode 100644
index bf04b0e00e..0000000000
--- a/package/ezxml/ezxml.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  a68d52257dcb0ff2ad3d71c8c64311edb8030254bb8b581e229aeaba6231cdf9  ezxml-0.8.6.tar.gz
-sha256  e82e49402f6b21176c65eead46dbd39d8f7a3c28b052589d8b307dfc8f78a03f  license.txt
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
deleted file mode 100644
index f1e18aa680..0000000000
--- a/package/ezxml/ezxml.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# ezxml
-#
-################################################################################
-
-EZXML_VERSION = 0.8.6
-EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
-EZXML_INSTALL_STAGING = YES
-EZXML_LICENSE = MIT
-EZXML_LICENSE_FILES = license.txt
-
-EZXML_CFLAGS = $(TARGET_CFLAGS)
-
-# mmap code uses madvise which isn't available on nommu uClibc
-ifeq ($(BR2_USE_MMU),)
-EZXML_CFLAGS += -D EZXML_NOMMAP
-endif
-
-define EZXML_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f GNUmakefile \
-		CC="$(TARGET_CC)" CFLAGS="$(EZXML_CFLAGS)" AR=$(TARGET_AR)
-endef
-
-define EZXML_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/ezxml.h $(STAGING_DIR)/usr/include/ezxml.h
-	$(INSTALL) -D -m 0644 $(@D)/libezxml.a $(STAGING_DIR)/usr/lib/libezxml.a
-endef
-
-define EZXML_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/ezxml.h $(TARGET_DIR)/usr/include/ezxml.h
-	$(INSTALL) -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
-endef
-
-$(eval $(generic-package))
