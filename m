From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Nov 2018 22:00:09 +0200
Subject: [Buildroot] [PATCH next 2/2] nftables: bump to version 0.9.0
In-Reply-To: <7a1b057bfd52cb51158a55a39e01fc98b482740b.1542139209.git.baruch@tkos.co.il>
References: <7a1b057bfd52cb51158a55a39e01fc98b482740b.1542139209.git.baruch@tkos.co.il>
Message-ID: <2c5222be5d5f5f3f779631034dd54fe883efcdf8.1542139209.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to https download site to save a redirect.

Optionally depend on the jansson for the newly introduced JSON output
support.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nftables/nftables.hash |  7 ++-----
 package/nftables/nftables.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 3effe68f2ebd..a0e0d5e77929 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,6 +1,3 @@
-# From http://www.netfilter.org/projects/nftables/downloads.html
-sha1	533cb3bf17e90579d24f9621fdb22bdb4f7e3287 	nftables-0.8.3.tar.bz2
-# Locally calculated after checking pgp signature
-# http://www.netfilter.org/projects/nftables/files/nftables-0.8.3.tar.bz2.sig
-sha256	d16be1f5db88e95d29fc0b0e4df88acd079f3ee8e2b872ec7673f9a0d5d95e38	nftables-0.8.3.tar.bz2
+# From https://netfilter.org/projects/nftables/downloads.html
+sha256	ad8181b5fcb9ca572f444bed54018749588522ee97e4c21922648bb78d7e7e91	nftables-0.9.0.tar.bz2
 sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 571cd33ad5f1..9f12e42c58d3 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.8.3
+NFTABLES_VERSION = 0.9.0
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
-NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
+NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
@@ -20,6 +20,13 @@ else
 NFTABLES_CONF_OPTS += --without-cli
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+NFTABLES_DEPENDENCIES += jansson
+NFTABLES_CONF_OPTS += --with-json
+else
+NFTABLES_CONF_OPTS += --without-json
+endif
+
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
-- 
2.19.1
