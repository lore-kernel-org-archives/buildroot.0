From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 23:59:03 +0200
Subject: [Buildroot] [git commit] package/nftables: use bundled mini-gmp
 without full-blown system gmp
Message-ID: <20200419214454.B0C158F359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e93621d532da2e7fe2ac5b1855b43f6c49d539fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ntables bundles a mini implementation of gmp that can be used if the
system lacks the full-blown gmp.

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
[yann.morin.1998 at free.fr:
  - explicitly disable mini-gmp when full one is enabled
  - reword and expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/Config.in   | 1 -
 package/nftables/nftables.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index 210e950c11..1eef43586c 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -7,12 +7,19 @@
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
+NFTABLES_CONF_OPTS += --without-mini-gmp
+else
+NFTABLES_CONF_OPTS += --with-mini-gmp
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
