From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 11:50:02 +0200
Subject: [Buildroot] [PATCH 4/5] glibc: two-stage gcc simplifications
In-Reply-To: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410688203-28621-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After switching to a two stage gcc solution, there is no longer a need
to do weird things in the glibc build. We can greatly simplify
GLIBC_CONFIGURE_CMDS to only do the configuration, and let the
existing GLIBC_BUILD_CMDS do the build.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0f63445..09b57fa 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -92,18 +92,7 @@ define GLIBC_CONFIGURE_CMDS
 		--without-gd \
 		--enable-obsolete-rpc \
 		--with-headers=$(STAGING_DIR)/usr/include)
-	# Install headers and start files
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build \
-		install_root=$(STAGING_DIR) \
-		install-bootstrap-headers=yes \
-		install-headers
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build csu/subdir_lib
-	cp $(@D)/build/csu/crt1.o $(STAGING_DIR)/usr/lib/
-	cp $(@D)/build/csu/crti.o $(STAGING_DIR)/usr/lib/
-	cp $(@D)/build/csu/crtn.o $(STAGING_DIR)/usr/lib/
 	$(GLIBC_ADD_MISSING_STUB_H)
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
 endef
 
 
-- 
2.0.0
