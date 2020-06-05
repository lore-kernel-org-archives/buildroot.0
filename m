From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:26:31 +0200
Subject: [Buildroot] [git commit] package/redis: add optional support for
 TLS connections
Message-ID: <20200605222828.47D94811F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee3c81341807631b176ba4e05e6e473485bc6d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TLS support is only enabled when BUILD_TLS is set to 'yes'. Anoy other
value, as well as empty or not set, will disable TLS. However, for
consistency with the rest of the code (e.g. for autotools packages where
we use both the --enable and --disable flags), we explcitly pass
BUILD_TLS=no. This also avoids an environment variable to leak into the
build.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr: add and explain the =no case]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/redis/redis.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 1578f97e0d..ae823429b3 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,6 +30,13 @@ endif
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+REDIS_DEPENDENCIES += libopenssl
+REDIS_BUILDOPTS += BUILD_TLS=yes
+else
+REDIS_BUILDOPTS += BUILD_TLS=no
+endif
+
 define REDIS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
 endef
