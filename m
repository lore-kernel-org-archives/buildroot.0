From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Nov 2020 21:26:32 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/rhash: add host variant
In-Reply-To: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
References: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
Message-ID: <20201106202632.2424688-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to compute sha3 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rhash/rhash.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 55fb08ecea..a4ce1d20ea 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -35,6 +35,15 @@ define RHASH_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_RHASH_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure \
+		--prefix="$(HOST_DIR)" \
+		--disable-gettext \
+		--disable-openssl \
+		--extra-ldflags="$(HOST_LDFLAGS) -L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib" \
+	)
+endef
+
 ifeq ($(BR2_SHARED_LIBS),y)
 RHASH_BUILD_TARGETS = lib-shared build-shared
 RHASH_INSTALL_TARGETS = install-lib-shared install-so-link
@@ -71,3 +80,4 @@ define RHASH_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-autotools-package))
-- 
2.27.0
