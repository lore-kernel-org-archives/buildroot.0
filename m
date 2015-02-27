From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:19 +0100
Subject: [Buildroot] [PATCH 2/7] libxmlrpc: add missing braces for variable
	CURL_CONFIG in patch 4
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change $CURL_CONFIG to $(CURL_CONFIG) in the patch
0004-use-correct-curl-config.patch because in a makefile the braces are
required to expand a variable.

Fix error messages:
make[3]: Entering directory '/home/tetsuya/buildroot/br2/output/build/libxmlrpc-1.25.30/lib/curl_transport'
make[3]: URL_CONFIG: Command not found
/bin/sh: line 0: test: <: unary operator expected
make[3]: URL_CONFIG: Command not found

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libxmlrpc/0004-use-correct-curl-config.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libxmlrpc/0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
index c0646d3..b581643 100644
--- a/package/libxmlrpc/0004-use-correct-curl-config.patch
+++ b/package/libxmlrpc/0004-use-correct-curl-config.patch
@@ -55,7 +55,7 @@ Index: b/lib/curl_transport/Makefile
  $(SRCDIR)/common.mk: srcdir blddir
  
 -CURL_VERSION := $(shell curl-config --vernum)
-+CURL_VERSION := $(shell $CURL_CONFIG --vernum)
++CURL_VERSION := $(shell $(CURL_CONFIG) --vernum)
  
  # Some time at or before Curl 7.12, <curl/types.h> became an empty file
  # (no-op).  Some time after Curl 7.18, <curl/types.h> ceased to exist.
@@ -64,7 +64,7 @@ Index: b/lib/curl_transport/Makefile
  endif
  
 -CURL_INCLUDES := $(shell curl-config --cflags)
-+CURL_INCLUDES := $(shell $CURL_CONFIG --cflags)
++CURL_INCLUDES := $(shell $(CURL_CONFIG) --cflags)
  # We expect that curl-config --cflags just gives us -I options, because
  # we need just the -I options for 'make dep'.  Plus, it's scary to think
  # of what any other compiler flag would do to our compile.
@@ -77,7 +77,7 @@ Index: b/src/cpp/test/Makefile
  
  ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
 -  LIBS += $(shell curl-config --libs)
-+  LIBS += $(shell $CURL_CONFIG --libs)
++  LIBS += $(shell $(CURL_CONFIG) --libs)
  endif
  ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
    LIBS += $(shell libwww-config --libs)
@@ -90,7 +90,7 @@ Index: b/tools/common.mk
  endif
  ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
 -  CLIENT_LDLIBS += $(shell curl-config --libs)
-+  CLIENT_LDLIBS += $(shell $CURL_CONFIG --libs)
++  CLIENT_LDLIBS += $(shell $(CURL_CONFIG) --libs)
  endif
  ifeq ($(MUST_BUILD_WININET_CLIENT),yes)
    CLIENT_LDLIBS += $(shell wininet-config --libs)
-- 
2.3.0
