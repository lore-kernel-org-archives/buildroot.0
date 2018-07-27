From: Thomas Ehrhardt <TEhrhardt@innovaphone.com>
Date: Fri, 27 Jul 2018 07:06:48 +0000
Subject: [Buildroot] [PATCH 1/1] postgresql --with-libxml configure option
 added
In-Reply-To: <F73717A01AEC1F4CB9A3D10E39CBB88F443662EA@INNO-EX-2010.innovaphone.sifi>
References: <20180608062231.2345-1-dde@innovaphone.com>
 <F73717A01AEC1F4CB9A3D10E39CBB88F4424CD47@INNO-EX-2010.innovaphone.sifi>
 <F73717A01AEC1F4CB9A3D10E39CBB88F443662EA@INNO-EX-2010.innovaphone.sifi>
Message-ID: <AD312B93A689234094FC24F3B98DBF33437A1708@INNO-EX-2010.innovaphone.sifi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The postgresql package is now built with --with-libxml if BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in postgresql.

Signed-off-by: Daniel Deterding <dde@innovaphone.com>
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
--
2.11.0


_______________________________________________________________________________

Thomas Ehrhardt | Development
_______________________________________________________________________________

innovaphone AG
PURE IP COMMUNICATIONS

B?blinger Stra?e 76 | 71065 Sindelfingen | Germany
Tel: +49(7031)73009-648 | Fax: +49(7031)73009-9
E-Mail: tehrhardt at innovaphone.com | http://www.innovaphone.com

[Sitz der Gesellschaft: Sindelfingen | HRB Nr. 245196 Amtsgericht Stuttgart | Vorstand: Dagmar Geer (Vorsitzende), Carsten Bode, Guntram Diehl, Gerd Hornig | Vorsitzender des Aufsichtsrates: Gebhard Michel]


Campaign - https://www.youtube.com/user/innovaphoneTV
[X]
