From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 16:14:43 -0300
Subject: [Buildroot] [PATCH 1/2] squid: create a user/group
Message-ID: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though squid uses nobody/nogroup it ain't good for security if
every daemon around uses it, specially since squid is used as a caching
proxy most of the time and that would mean other daemons/scripts run as
nobody would have access to potentially sensitive information.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c8d7417..5e2e659 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -39,7 +39,8 @@ SQUID_CONF_OPTS = \
 	--with-logdir=/var/log/squid/ \
 	--with-pidfile=/var/run/squid.pid \
 	--with-swapdir=/var/cache/squid/ \
-	--enable-icap-client
+	--enable-icap-client \
+	--with-default-user=squid
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
@@ -60,4 +61,8 @@ endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
 
+define SQUID_USERS
+	squid -1 squid -1 * - - - Squid proxy cache
+endef
+
 $(eval $(autotools-package))
-- 
2.0.5
