From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Oct 2016 13:54:23 +0100
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0
Message-ID: <20161011125423.38125-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- With the release of BIND 9.11.0, ISC is changing the open source
  license for BIND from the ISC license to the Mozilla Public License
  (MPL 2.0). See release notes:
  http://ftp.isc.org/isc/bind9/9.11.0/RELEASE-NOTES-bind-9.11.0.html

- Explicitly enable/disable zlib support, otherwise the configure script
  will fail like this:

  checking for zlib library... yes
  checking for library containing deflate... no
  configure: error: found zlib include but not library.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bind/bind.hash |  4 ++--
 package/bind/bind.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8acfda5..bc46604 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.10.4-P3/bind-9.10.4-P3.tar.gz.sha256.asc
-sha256 a075e5ce89fddccb0e64d1777d59161387dd5151cf4e7d1a93875a487812baef  bind-9.10.4-P3.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.11.0/bind-9.11.0.tar.gz.sha256.asc
+sha256 6f0b403036e0281b272a0fbdd0dc3417f3050b625cb059c5409432611418058b  bind-9.11.0.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e6bf204..cda9fed 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.10.4-P3
+BIND_VERSION = 9.11.0
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-BIND_LICENSE = ISC
+BIND_LICENSE = MPLv2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
 BIND_TARGET_SERVER_SBIN += dnssec-importkey dnssec-keygen dnssec-revoke
@@ -32,6 +32,13 @@ BIND_CONF_OPTS = \
 	--enable-rrl \
 	--enable-filter-aaaa
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BIND_CONF_OPTS += --with-zlib
+BIND_DEPENDENCIES += zlib
+else
+BIND_CONF_OPTS += --without-zlib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BIND_CONF_OPTS += --enable-linux-caps
 BIND_DEPENDENCIES += libcap
-- 
2.10.0
