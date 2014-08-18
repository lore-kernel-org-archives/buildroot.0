From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 Aug 2014 00:50:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools: don't use
	config.site when cross-compiling
Message-ID: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On fedora 20 64bits host, the file /usr/share/config.site contains
a fix for installing libraries into /lib/lib64 on 64bits systems
that redefine libdir in the generated Makefile

For safety, disable loading this file when running the configure
script for the target and the host.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index bcc648d..cdc31bf 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -126,6 +126,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
+	CONFIG_SITE="no" \
 	./configure \
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
@@ -159,6 +160,7 @@ define $(2)_CONFIGURE_CMDS
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
                 $$($$(PKG)_CONF_ENV) \
+		CONFIG_SITE="no" \
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
-- 
1.9.3
