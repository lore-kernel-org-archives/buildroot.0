From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:25:02 +0200
Subject: [Buildroot] [git commit] bind: fix compilation when lmdb.h is
	present on host
Message-ID: <20170909201815.9BA4F80298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c0ecd4d7526dedce85a49172b031f45cde19a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c65568e..c3d4872 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,6 +30,7 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--with-libtool \
 	--with-gssapi=no \
+	--with-lmdb=no \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
