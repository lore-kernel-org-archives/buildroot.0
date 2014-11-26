From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 23:25:01 +0100
Subject: [Buildroot] [git commit] nftables: fix static build
Message-ID: <20141126222614.ACDA07FF19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30362526a081c7dcbb568e3d543fc83b8a294b56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnftnl needs -ljansson when built with json support.

Fixes:
http://autobuild.buildroot.net/results/68a/68ab2101a0b2b7d5482aafe0d88c87a50491159f/
http://autobuild.buildroot.net/results/87e/87ecbba5b9b16d592a48fe827fa88ef5a5c6d09b/

libnftl also needs -mxml when built with XML support.

Fixes:
http://autobuild.buildroot.net/results/58f/58f592d823db14e4e7558134f1b479f4f8659a23/
http://autobuild.buildroot.net/results/1cf/1cf23f2b38236f43971c65e704793b5bc762ecfe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b3abbc0..16d7c6f 100644
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
