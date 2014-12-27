From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:25 +0100
Subject: [Buildroot] [PATCH 07/10] package/libxmlrpc: handle static/shared
	only install
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-8-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not possible to disable/enable static and shared libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
To be tested with static only build.
(probably brocken since shared libraries will be build)
---
 package/libxmlrpc/libxmlrpc.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index c3788d6..5796ae6 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -35,4 +35,15 @@ LIBXMLRPC_MAKE_ENV = \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
 
+
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBXMLRPC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) \
+	install-shared-libraries install-headers install-bin
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBXMLRPC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) \
+	install-static-libraries install-headers install-bin
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
