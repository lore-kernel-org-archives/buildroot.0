From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 17:44:54 +0200
Subject: [Buildroot] [git commit] postgresql: enable ldap support for
	pg_service.conf
Message-ID: <20161024154529.4DBF8807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=548b0d541c8bdd890d7af5eb3094c4a606304c63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just needed to add --with-ldap to POSTGRESQL_CONF_OPTS and add openldap
to POSTGRESQL_DEPENDENCIES when BR2_PACKAGE_OPENLDAP is on

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e2756bf..1b184e7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -57,6 +57,13 @@ POSTGRESQL_DEPENDENCIES += openssl
 POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+POSTGRESQL_DEPENDENCIES += openldap
+POSTGRESQL_CONF_OPTS += --with-ldap
+else
+POSTGRESQL_CONF_OPTS += --without-ldap
+endif
+
 define POSTGRESQL_USERS
 	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
 endef
