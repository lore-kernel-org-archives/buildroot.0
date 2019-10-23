From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Oct 2019 13:06:05 +0200
Subject: [Buildroot] [PATCH] package/jitterentropy-library: fix build
 failure due to missing -fPIC
Message-ID: <20191023110605.23836-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jitterentropy-library needs -fPIC flag to build so add it when building.

Fixes:
http://autobuild.buildroot.net/results/505/5059207ec9ab0b502717626cc84956dafd0c3c32/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/jitterentropy-library/jitterentropy-library.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 4e791e19dd..b8db1ccb80 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -10,8 +10,11 @@ JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
 
+JITTERENTROPY_LIBRARY_CFLAGS = $(TARGET_CFLAGS)
+JITTERENTROPY_LIBRARY_CFLAGS += -fPIC
+
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(JITTERENTROPY_LIBRARY_CFLAGS)"
 endef
 
 define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
-- 
2.20.1
