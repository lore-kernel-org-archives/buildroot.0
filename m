From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:31:58 +0100
Subject: [Buildroot] [git commit] squid: create a user/group
Message-ID: <20150114193540.EAE2280DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e001837c22c4e3074458791379bd9c5bf3fe04a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though squid uses nobody/nogroup it ain't good for security if
every daemon around uses it, specially since squid is used as a caching
proxy most of the time and that would mean other daemons/scripts run as
nobody would have access to potentially sensitive information.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

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
