From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Nov 2018 18:46:29 +0100
Subject: [Buildroot] [PATCH 1/1] libcorrect: fix debug build
Message-ID: <20181119174629.1613-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_ENABLE_DEBUG is set, Debug release will be used and as a result
-fsanitize=address will be added to CFLAGS which will fail on some
toolchains because it requires asan library

So add -DCMAKE_BUILD_TYPE=Release unconditionally

Fixes:
 - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcorrect/libcorrect.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
index 0a84aa5c26..cb25e0d0cd 100644
--- a/package/libcorrect/libcorrect.mk
+++ b/package/libcorrect/libcorrect.mk
@@ -9,5 +9,7 @@ LIBCORRECT_SITE = $(call github,quiet,libcorrect,$(LIBCORRECT_VERSION))
 LIBCORRECT_LICENSE = BSD-3-Clause
 LIBCORRECT_LICENSE_FILES = LICENSE
 LIBCORRECT_INSTALL_STAGING = YES
+# Debug release adds -fsanitize=address so always use Release
+LIBCORRECT_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
 
 $(eval $(cmake-package))
-- 
2.14.1
