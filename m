From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Tue, 15 Nov 2016 11:50:44 +0100
Subject: [Buildroot] [PATCH v3 1/1] libxmlrpc: bump to 1.39.11
In-Reply-To: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
References: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
Message-ID: <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous version patches are still needed, but they have been
upgraded to apply cleanly.

This also reverts aa9fde1c459dbc20b268694eafd7a1d3341dbf76, as that
patch is already on upstream.

Signed-off-by: Alvaro Gamez <alvaro.gamez@hazent.com>
---
 package/libxmlrpc/0001-fix-gennmtab-build.patch    |  2 +-
 .../libxmlrpc/0004-use-correct-curl-config.patch   | 36 +++-------------------
 package/libxmlrpc/0006-narrowing.patch             | 20 ------------
 package/libxmlrpc/libxmlrpc.hash                   |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  4 +--
 5 files changed, 9 insertions(+), 55 deletions(-)
 delete mode 100644 package/libxmlrpc/0006-narrowing.patch

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
diff --git a/package/libxmlrpc/0006-narrowing.patch b/package/libxmlrpc/0006-narrowing.patch
deleted file mode 100644
index 43a5ca5..0000000
--- a/package/libxmlrpc/0006-narrowing.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix build with gcc6
-
-Downloaded from
-https://build.opensuse.org/package/view_file/devel:libraries:c_c++/xmlrpc-c/narrowing.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: xmlrpc-c-1.33.18/src/cpp/base64.cpp
-===================================================================
---- xmlrpc-c-1.33.18.orig/src/cpp/base64.cpp
-+++ xmlrpc-c-1.33.18/src/cpp/base64.cpp
-@@ -14,7 +14,7 @@ using namespace xmlrpc_c;
- 
- namespace {
- 
--char const table_a2b_base64[] = {
-+signed char const table_a2b_base64[] = {
-     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
-     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
-     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,62, -1,-1,-1,63,
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index d37fcfc..8ec1e14 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8ae6ed4ec57d50ed132b1150fc5258346eef3e291501a564f14fa97586902f98 xmlrpc-c-1.25.30.tgz
+sha256 2e56cdcdd5c5fa564bcdc7a56bca108a88f5b78b34ccc85558366efabdc8b8e8 xmlrpc-c-1.39.11.tgz
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 03a7095..caaeb12 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.25.30
+LIBXMLRPC_VERSION = 1.39.11
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
@@ -39,7 +39,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
 endif
 
-LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
+LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS) AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)"
 LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(STAGING_DIR) install
 LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
-- 
2.7.0
