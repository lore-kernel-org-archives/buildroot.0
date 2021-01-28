From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:23:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libupnp: security
 bump to version 1.14.0
Message-ID: <20210128200123.787C8813B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83f894b7bb8f92823827b2b4d81959acb965c3a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848
- Update indentation in hash file (two spaces)
- Backport all changes from libupnp18 to libupnp:
  - Use COPYING instead of LICENSE (no license change)
  - Add host-pkgconf dependency
  - Add --enable-reuseaddr
  - Add openssl optional dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 118648d161d504113d5ab278b09086e5d52c3b57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
index 8831885ba4..d44abe2794 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,12 +4,24 @@
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
