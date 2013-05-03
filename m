From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 13:10:23 +0200
Subject: [Buildroot] [git commit] libjson: ensure shared lib is built with
	-fPIC
Message-ID: <20130503111042.6C51A99A4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80e7419680d5eb57da0b0b34248e49dcd81619a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/72e6c260c9028dd636965b8bf76bb7ba216aa1a4/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libjson/libjson.mk |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index deca0f8..9b1aca3 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -11,8 +11,16 @@ LIBJSON_INSTALL_STAGING = YES
 LIBJSON_LICENSE = BSD-2c
 LIBJSON_LICENSE_FILES = License.txt
 
-LIBJSON_MAKE_OPT = BUILD_TYPE= SHARED=$(if $(BR2_PREFER_STATIC_LIB),0,1) \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -DNDEBUG"
+LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBJSON_MAKE_OPT += SHARED=0
+else
+LIBJSON_MAKE_OPT += SHARED=1
+LIBJSON_CXXFLAGS += -fPIC
+endif
+
+LIBJSON_MAKE_OPT += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
 
 define LIBJSON_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
