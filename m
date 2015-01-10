From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:45:45 +0100
Subject: [Buildroot] [git commit] nftables: making interactive console
	optional
Message-ID: <20150110165103.EFE8580105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d1aa46c9e42670513d02c428f452fef7baa481a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This lets you (by default enabled) compile out its readline
dependency.

[Thomas:
  - remove the patch, which is now unneeded, since we've bumped to
    nftables 0.4, which as the patch to make readline optional.
  - remove the new Config.in option, just enable the interactive
    console when the readline package is enabled.]

Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nftables/Config.in   |    1 -
 package/nftables/nftables.mk |   10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 4ddfdbd..1e0798e 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_NFTABLES
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  nftables is the project that aims to replace the existing
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 6be05ed..35c56e8 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -7,12 +7,18 @@
 NFTABLES_VERSION = 0.4
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
-NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
+NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(if $(BR2_NEEDS_GETTEXT),gettext)
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
-NFTABLES_LIBS = -lncurses
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NFTABLES_DEPENDENCIES += readline
+NFTABLES_LIBS += -lncurses
+else
+NFTABLES_CONF_OPTS = --without-cli
+endif
+
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
