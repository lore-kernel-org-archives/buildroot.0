From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu, 18 Sep 2014 11:27:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/squid: enable ICAP server support
	in squid and define logdir, pidfile and swapdir
In-Reply-To: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1411032426-11463-2-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds ICAP server support to squid and also defines logdir, 
pidfile and swapdir.

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/squid/squid.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6dffae8..f68a402 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -26,7 +26,11 @@ SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-auth-negotiate="wrapper" \
 			--enable-auth-ntlm="fake" \
 			--disable-strict-error-checking \
-			--enable-external-acl-helpers="file_userip"
+			--enable-external-acl-helpers="file_userip" \
+			--with-logdir=/var/log/squid/ \
+			--with-pidfile=/var/run/squid.pid \
+			--with-swapdir=/var/cache/squid/ \
+			--enable-icap-client
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
@@ -45,6 +49,10 @@ define SQUID_CLEANUP_TARGET
 		cachemgr.conf mime.conf.default squid.conf.default)
 endef
 
-SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
+define SQUID_CREATE_MISSING_FOLDER
+	mkdir -p $(TARGET_DIR)/var/log/squid/
+endef
+
+SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET SQUID_CREATE_MISSING_FOLDER
 
 $(eval $(autotools-package))
-- 
1.8.4.5
