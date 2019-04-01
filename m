From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:48:16 +0200
Subject: [Buildroot] [git commit] package/quota: add optional openldap
 dependency
Message-ID: <20190401204430.2D02389115@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6779367ad5faf10cd3ca79b17da81952b0f0ca64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't enable openldap in static build because openldap has too many
optional dependencies (gmp, gnutls, nss, openssl, ...) and openldap
doesn't provide a pkg-config file (and does not want to do it:
http://www.openldap.org/lists/openldap-bugs/201406/msg00020.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/quota.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 836baf6071..e356d91a06 100644
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
