From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Jul 2018 16:06:07 +0200
Subject: [Buildroot] [git commit] postgresql: add optional dependency on
 libxml2
Message-ID: <20180728140132.2D4698A4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=568172d35578eea8fd097611f2ce7a802da2fc4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The postgresql package is now built with --with-libxml if
BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in
postgresql.

Signed-off-by: Daniel Deterding <dde@innovaphone.com>
Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/postgresql/postgresql.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 94b3e60e59..0940873686 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -70,6 +70,14 @@ else
 POSTGRESQL_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+POSTGRESQL_DEPENDENCIES += libxml2
+POSTGRESQL_CONF_OPTS += --with-libxml
+POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+else
+POSTGRESQL_CONF_OPTS += --without-libxml
+endif
+
 define POSTGRESQL_USERS
 	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
 endef
