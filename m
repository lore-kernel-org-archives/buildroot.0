From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 14:27:53 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/feh: Cleanup build configuration
In-Reply-To: <20171115132754.9755-1-petr.vorel@gmail.com>
References: <20171115132754.9755-1-petr.vorel@gmail.com>
Message-ID: <20171115132754.9755-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* add variables before make as it's required by config.mk
* build in parallel
* use TARGET_CONFIGURE_OPTS
* cleanup FEH_INSTALL_TARGET_CMDS

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 98e580f5bf..e0ca21b9ca 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,13 +12,12 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" $(MAKE1) \
-		CC="$(TARGET_CC) $(TARGET_LDFLAGS)" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" \
+		$(MAKE) -C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.15.0
