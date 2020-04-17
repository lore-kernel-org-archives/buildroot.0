From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Fri, 17 Apr 2020 13:36:43 +0000
Subject: [Buildroot] [PATCH 1/1] package/nftables: use --with-mini-gmp when
 gmp is not selected
Message-ID: <20200417133643.1756986-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/nftables/Config.in   | 1 -
 package/nftables/nftables.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 6452ab4f52..8d172b7256 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NFTABLES
 	bool "nftables"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
 	help
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 210e950c11..1fac9dd3bf 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -7,12 +7,18 @@
 NFTABLES_VERSION = 0.9.3
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
-NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
+NFTABLES_DEPENDENCIES = libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
 NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
 
+ifeq ($(BR2_PACKAGE_GMP),y)
+NFTABLES_DEPENDENCIES += gmp
+else
+NFTABLES_CONF_OPTS += --with-mini-gmp
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
-- 
2.25.2
