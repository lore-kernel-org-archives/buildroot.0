From: Alexander Dahl <post@lespocky.de>
Date: Wed, 17 Mar 2021 07:01:45 +0100
Subject: [Buildroot] [PATCH] package/squid: Use external libltdl
Message-ID: <20210317060145.25009-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When enabling BR2_PACKAGE_LIBTOOL it depended on the build order if
squid used the external libltdl or built it from its internal copy. That
broke the build in fli4l where we have additional post build checks
analyzing runtime dependencies and a separate step for copying build
artefacts to target packages.

Depend on the external libltdl unconditionally like done with commit
3efc5a250c1c ("package/siproxd: new package") for package siproxd
recently as well. For reproducibility, size, and security.

Link: https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-sunxi/672/
Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/squid/Config.in | 1 +
 package/squid/squid.mk  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 726160b01d..0df2aedef6 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_SQUID
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 473af2ac12..a3ccbbcf8e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -10,7 +10,7 @@ SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
-SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
+SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
 	ac_cv_epoll_works=yes \
@@ -33,6 +33,8 @@ SQUID_CONF_OPTS = \
 	--enable-auth-ntlm="fake" \
 	--disable-strict-error-checking \
 	--enable-external-acl-helpers="file_userip" \
+	--disable-ltdl-install \
+	--without-included-ltdl \
 	--with-logdir=/var/log/squid/ \
 	--with-pidfile=/var/run/squid.pid \
 	--with-swapdir=/var/cache/squid/ \

base-commit: 54d3d94b6e3846447b5796ef8587b08b537cd348
-- 
2.20.1
