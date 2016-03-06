From: Alan Yaniger <alan@tkos.co.il>
Date: Sun,  6 Mar 2016 22:29:10 +0200
Subject: [Buildroot] [PATCH 1/2] Set PGROOT dir owner to be "postgres".
In-Reply-To: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
References: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
Message-ID: <1457296152-4047-2-git-send-email-alan@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Without this
 change, the postgres server fails to start on boot.

Signed-off-by: Alan Yaniger <alan@tkos.co.il>
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 444c1b1..5906ce9 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -17,6 +17,10 @@ POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
 POSTGRESQL_AUTORECONF = YES
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
+define POSTGRESQL_PERMISSIONS
+	/var/lib/pgsql d 755 postgres postgres - - - - -
+endef
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
-- 
1.9.1
