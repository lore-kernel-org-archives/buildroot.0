From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2020 10:22:03 +0200
Subject: [Buildroot] [PATCH] package/unbound: fix detection of libexpat
Message-ID: <20200405082203.24014-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

unbound open-codes the detection of libexpat, and as all packages doing
so, look in host paths (/usr/local /opt/local /usr/lib /usr/pkg /usr/sfw
/usr). Obviously this is wrong for cross-compilation.

Do for libexpat as we do for openssl, and point unbound to staging dir,
when we know expat is.

Fixes:
    http://autobuild.buildroot.org/results/a89ea6aa1cd8c253b1260ea227fea3dc9b095fe8/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Stefan Ott <stefan@ott.net>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 937165eca7..59543438fd 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -16,6 +16,7 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
 # uClibc-ng does not have MSG_FASTOPEN
-- 
2.20.1
