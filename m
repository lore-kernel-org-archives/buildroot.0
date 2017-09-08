From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  8 Sep 2017 16:02:49 +0200
Subject: [Buildroot] [PATCH] bind: fix compilation when lmdb.h is present on
	host
Message-ID: <20170908140249.24338-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Robin Jarry <robin.jarry@6wind.com>

Bind autoconf scripts look for lmdb.h in /usr/include (even when
cross-compiling). When liblmdb-dev is installed, this causes the
following error:

    ...
    checking for lmdb library... yes
    checking for library containing mdb_env_create... no
    configure: error: found lmdb include but not library.

Fix this by disabling explicitly lmdb support.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c65568e9e380..c3d48729deeb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,6 +30,7 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--with-libtool \
 	--with-gssapi=no \
+	--with-lmdb=no \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.13.1
