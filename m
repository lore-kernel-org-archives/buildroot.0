From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 23:20:03 +0100
Subject: [Buildroot] [git commit] libnspr: fix static build
Message-ID: <20141126222614.A48B37FF18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05aa5b49739e528b85fcf3efbe8948a3db2ff09d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable shared library in a static build.

Fixes:
http://autobuild.buildroot.net/results/6ff/6ffae151ec3eaca175923ab860cf42167871164c/
http://autobuild.buildroot.net/results/cab/cab19721c43b3256dd51ae511016bc9ea440512a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index c071d85..1930870 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -21,6 +21,12 @@ LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
+LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SHARED_LIBRARY= install
+LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) SHARED_LIBRARY= install
+endif
+
 ifeq ($(BR2_arm),y)
 ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
 LIBNSPR_CONF_OPTS += --enable-thumb2
