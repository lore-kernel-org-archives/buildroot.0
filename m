From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Fri, 11 Nov 2016 08:58:06 +0100
Subject: [Buildroot] [PATCH v2] Bump libxmlrpc to version 1.39.10
In-Reply-To: <20161102232646.69bfff3d@free-electrons.com>
References: <20161102232646.69bfff3d@free-electrons.com>
Message-ID: <1478851086-19073-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous version patches are still needed, but they have been upgraded to apply cleanly.

Bumped version fixes compilation issue on some architectures (arm, microblaze).

Fixes:
http://autobuild.buildroot.net/results/c45530f34bf2074bd204c485615124df928f246c


Signed-off-by: Alvaro Gamez <alvaro.gamez@hazent.com>
---
 package/libxmlrpc/0001-fix-gennmtab-build.patch    |  2 +-
 .../libxmlrpc/0004-use-correct-curl-config.patch   | 36 +++-------------------
 package/libxmlrpc/libxmlrpc.hash                   |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  4 +--
 4 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/package/libxmlrpc/0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
index 8cdd932..e98e5cb 100644
--- a/package/libxmlrpc/0001-fix-gennmtab-build.patch
+++ b/package/libxmlrpc/0001-fix-gennmtab-build.patch
@@ -19,7 +19,7 @@ Index: b/lib/expat/gennmtab/Makefile
 +	$(CC_FOR_BUILD) -c $< -o $@ $(CFLAGS_FOR_BUILD) $(INCLUDES)
  
  gennmtab:%:%.o
--	$(BUILDTOOL_CCLD) -o $@ $(LDFLAGS) $^
+-	$(BUILDTOOL_CCLD) -o $@ $(LDFLAGS_ALL) $^
 +	$(CC_FOR_BUILD) -o $@ $(LDFLAGS_FOR_BUILD) $^
  
  include depend.mk
diff --git a/package/libxmlrpc/0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
index b581643..f2f1c55 100644
--- a/package/libxmlrpc/0004-use-correct-curl-config.patch
+++ b/package/libxmlrpc/0004-use-correct-curl-config.patch
@@ -12,15 +12,15 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -56,7 +56,7 @@
-   TRANSPORT_MODS += blddir/lib/curl_transport/curltransaction
-   TRANSPORT_MODS += blddir/lib/curl_transport/curlmulti
-   TRANSPORT_MODS += blddir/lib/curl_transport/lock_pthread
+@@ -57,7 +57,7 @@
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
 -  TRANSPORT_LIBDEP += $(shell curl-config --libs)
 +  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
+   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
  endif
  ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
-   TRANSPORT_MODS += blddir/lib/libwww_transport/xmlrpc_libwww_transport
 Index: b/config.mk.in
 ===================================================================
 --- a/config.mk.in
@@ -68,29 +68,3 @@ Index: b/lib/curl_transport/Makefile
  # We expect that curl-config --cflags just gives us -I options, because
  # we need just the -I options for 'make dep'.  Plus, it's scary to think
  # of what any other compiler flag would do to our compile.
-Index: b/src/cpp/test/Makefile
-===================================================================
---- a/src/cpp/test/Makefile
-+++ b/src/cpp/test/Makefile
-@@ -20,7 +20,7 @@
- LIBS := $(shell $(XMLRPC_C_CONFIG) client --ldadd)
- 
- ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
--  LIBS += $(shell curl-config --libs)
-+  LIBS += $(shell $(CURL_CONFIG) --libs)
- endif
- ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
-   LIBS += $(shell libwww-config --libs)
-Index: b/tools/common.mk
-===================================================================
---- a/tools/common.mk
-+++ b/tools/common.mk
-@@ -15,7 +15,7 @@
-   CLIENT_LDLIBS += $(shell libwww-config --libs)
- endif
- ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
--  CLIENT_LDLIBS += $(shell curl-config --libs)
-+  CLIENT_LDLIBS += $(shell $(CURL_CONFIG) --libs)
- endif
- ifeq ($(MUST_BUILD_WININET_CLIENT),yes)
-   CLIENT_LDLIBS += $(shell wininet-config --libs)
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index d37fcfc..0bcc646 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8ae6ed4ec57d50ed132b1150fc5258346eef3e291501a564f14fa97586902f98 xmlrpc-c-1.25.30.tgz
+sha256 b82d871a6ef63bf0c29b7b303e4ab723a4a004f16ab96b341ccab30b2609edec xmlrpc-c-1.39.10.tgz
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 03a7095..e88f643 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.25.30
+LIBXMLRPC_VERSION = 1.39.10
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.7.0
