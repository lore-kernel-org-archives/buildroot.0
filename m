From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 20:49:44 +0100
Subject: [Buildroot] [PATCH v3,
 1/6] package/libupnp: security bump to version 1.14.0
Message-ID: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848
- Update indentation in hash file (two spaces)
- Backport all changes from libupnp18 to libupnp:
  - Use COPYING instead of LICENSE (no license change)
  - Add host-pkgconf dependency
  - Add --enable-reuseaddr
  - Add openssl optional dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Rebase on current master

Changes v1 -> v2:
 - Bump libupnp instead of libupnp18 and drop libupnp18
 - Update ushare and igd2-for-linux
 - Drop libupnp18

 package/libupnp/libupnp.hash |  4 ++--
 package/libupnp/libupnp.mk   | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index e52b7ea9d7..6b16eff3c8 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c5a300b86775435c076d58a79cc0d5a977d76027d2a7d721590729b7f369fa43	libupnp-1.6.25.tar.bz2
-sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
+sha256  ecb23d4291968c8a7bdd4eb16fc2250dbacc16b354345a13342d67f571d35ceb  libupnp-1.14.0.tar.bz2
+sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index b7836590c2..ebc5e83765 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,13 +4,25 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.25
+LIBUPNP_VERSION = 1.14.0
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
-LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
+LIBUPNP_SITE = \
+	http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
-LIBUPNP_LICENSE_FILES = LICENSE
+LIBUPNP_LICENSE_FILES = COPYING
 LIBUPNP_CPE_ID_VALID = YES
+LIBUPNP_DEPENDENCIES = host-pkgconf
+
+# Bind the internal miniserver socket with reuseaddr to allow clean restarts.
+LIBUPNP_CONF_OPTS += --enable-reuseaddr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBUPNP_CONF_OPTS += --enable-open-ssl
+LIBUPNP_DEPENDENCIES += openssl
+else
+LIBUPNP_CONF_OPTS += --disable-open-ssl
+endif
 
 $(eval $(autotools-package))
-- 
2.29.2
