From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Feb 2021 15:12:56 +0100
Subject: [Buildroot] [PATCH 7/7] package/sysrepo: remove explicit setting of
 CMAKE_BUILD_TYPE
In-Reply-To: <20210210141256.6438-1-patrickdepinguin@gmail.com>
References: <20210210141256.6438-1-patrickdepinguin@gmail.com>
Message-ID: <20210210141256.6438-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

sysrepo explicitly set CMAKE_BUILD_TYPE=Release, ignoring any possible
value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).

With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
longer be necessary. Users that do not wish to have additional runtime
debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/sysrepo/sysrepo.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index e4d553cdbd..e0ac4cd245 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -13,7 +13,6 @@ SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
 HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
 
 SYSREPO_CONF_OPTS = \
-	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -26,7 +25,6 @@ define SYSREPO_INSTALL_INIT_SYSV
 endef
 
 HOST_SYSREPO_CONF_OPTS = \
-	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_EXAMPLES=OFF \
 	-DREPO_PATH=$(TARGET_DIR)/etc/sysrepo
 
-- 
2.26.2
