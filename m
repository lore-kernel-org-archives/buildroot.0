From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Nov 2014 21:49:02 +0200
Subject: [Buildroot] [PATCH] nftables: fix static build
Message-ID: <3e17fd6cd2d116233ebb766596c7d26254d9d698.1417031342.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnftnl needs -ljansson when built with json support.

Fixes:
http://autobuild.buildroot.net/results/68a/68ab2101a0b2b7d5482aafe0d88c87a50491159f/
http://autobuild.buildroot.net/results/87e/87ecbba5b9b16d592a48fe827fa88ef5a5c6d09b/

libnftl also needs -mxml when built with XML support.

Fixes:
http://autobuild.buildroot.net/results/58f/58f592d823db14e4e7558134f1b479f4f8659a23/
http://autobuild.buildroot.net/results/1cf/1cf23f2b38236f43971c65e704793b5bc762ecfe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nftables/nftables.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b3abbc0dd9a9..16d7c6f21247 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -12,8 +12,16 @@ NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
 NFTABLES_LICENSE = GPLv2
 NFTABLES_LICENSE_FILES = COPYING
 
+NFTABLES_LIBS = -lncurses
+ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
+NFTABLES_LIBS += -ljansson -lm
+endif
+ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBNFTNL_XML),yy)
+NFTABLES_LIBS += -lmxml -lpthread
+endif
+
 NFTABLES_CONF_ENV = \
 	ac_cv_prog_CONFIG_PDF=no \
-	LIBS="-lncurses"
+	LIBS="$(NFTABLES_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.1.3
