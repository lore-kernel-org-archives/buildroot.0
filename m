From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 May 2017 14:00:40 +0100
Subject: [Buildroot] [PATCH] sudo: fix static linking with openldap having
	openssl support
Message-ID: <20170511130040.26036-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we are building sudo statically and openldap was linked with openssl,
then when we link sudo with openldap we need to specify the openssl
libs, otherwise it will fail with "undefined reference" errors.

Fixes:
  http://autobuild.buildroot.net/results/ebb/ebbb4c3138b5023a0c8bd938db1932a25ba5b6fb/
  http://autobuild.buildroot.net/results/58e/58ee4fddea85f0c79b26582b04a573258e27eb47/
  http://autobuild.buildroot.net/results/051/05151c4ef7f0b3702a6cd5e6df4888d826a37431/
  http://autobuild.buildroot.net/results/b1d/b1dfae81985daee106700191fcb82387833c2e3f/
  http://autobuild.buildroot.net/results/5b4/5b42e8505856156389d480d0da19f6982cf120d8/
  http://autobuild.buildroot.net/results/30a/30a76190428f902f03bcf54ba9f1f4f4377c6fc9/
  http://autobuild.buildroot.net/results/e8c/e8c6bdc314b9a8d5de303633a3abd7b7e44beb2e/
  http://autobuild.buildroot.net/results/483/4830c69cc6a62080e1516f0d9009c2ba619c23c1/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sudo/sudo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0fcd740..56f83ea 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -40,6 +40,13 @@ endif
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 SUDO_DEPENDENCIES += openldap
 SUDO_CONF_OPTS += --with-ldap
+# If we are building sudo statically and openldap was linked with openssl, then
+# when we link sudo with openldap we need to specify the openssl libs, otherwise
+# it will fail with "undefined reference" errors.
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
+SUDO_DEPENDENCIES += host-pkgconf
+SUDO_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+endif
 else
 SUDO_CONF_OPTS += --without-ldap
 endif
-- 
2.10.2
