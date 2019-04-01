From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Apr 2019 19:13:11 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/quota: add optional openldap dependency
Message-ID: <20190401171311.28799-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't enable openldap in static build because openldap has too many
optional dependencies (gmp, gnutls, nss, openssl, ...) and openldap
doesn't provide a pkg-config file (and does not want to do it:
http://www.openldap.org/lists/openldap-bugs/201406/msg00020.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Disable openldap in static build

 package/quota/quota.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 3377250766..5f1e427d0b 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -29,6 +29,13 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP):$(BR2_STATIC_LIBS),y:)
+QUOTA_DEPENDENCIES += openldap
+QUOTA_CONF_OPTS += --enable-ldapmail
+else
+QUOTA_CONF_OPTS += --disable-ldapmail
+endif
+
 QUOTA_CONF_ENV = LIBS="$(QUOTA_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.14.1
