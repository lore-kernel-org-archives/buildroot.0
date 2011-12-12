From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 21:22:40 +0100
Subject: [Buildroot] [git commit] libeXosip: bump version,
	use upstream directly
Message-ID: <20111212202251.09A6A8F92D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02ad75e9ee750782a8186d6aec8c478528735f1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of Debian.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libeXosip2/libeXosip2-fix-non-ipv6-build.patch |   22 ++++++++++++++++++++
 package/libeXosip2/libeXosip2.mk                   |   22 +++----------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/package/libeXosip2/libeXosip2-fix-non-ipv6-build.patch b/package/libeXosip2/libeXosip2-fix-non-ipv6-build.patch
new file mode 100644
index 0000000..bec833f
--- /dev/null
+++ b/package/libeXosip2/libeXosip2-fix-non-ipv6-build.patch
@@ -0,0 +1,22 @@
+[PATCH] Fix build on systems without IPV6_TCLASS support
+
+The wrong variable name was used.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/eXtl_udp.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libeXosip2-3.6.0/src/eXtl_udp.c
+===================================================================
+--- libeXosip2-3.6.0.orig/src/eXtl_udp.c
++++ libeXosip2-3.6.0/src/eXtl_udp.c
+@@ -178,7 +178,7 @@
+ 		res = setsockopt(udp_socket, IPPROTO_IPV6, IPV6_TCLASS,
+ 			(SOCKET_OPTION_VALUE)&tos, sizeof(tos));
+ #else
+-		retval = setsockopt(udp_socket, IPPROTO_IPV6, IP_TOS,
++		res = setsockopt(udp_socket, IPPROTO_IPV6, IP_TOS,
+ 			(SOCKET_OPTION_VALUE)&tos, sizeof(tos));
+ #endif
+ 	}
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 7c4753d..4b778a9 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -3,10 +3,10 @@
 # libeXosip2
 #
 #############################################################
-LIBEXOSIP2_VERSION = 3.5.0
-LIBEXOSIP2_SOURCE = libexosip2_$(LIBEXOSIP2_VERSION).orig.tar.gz
-LIBEXOSIP2_PATCH = libexosip2_$(LIBEXOSIP2_VERSION)-1.diff.gz
-LIBEXOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libe/libexosip2
+
+LIBEXOSIP2_VERSION = 3.6.0
+LIBEXOSIP2_SOURCE = libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
+LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
 
 LIBEXOSIP2_DEPENDENCIES = host-pkg-config libosip2
@@ -18,18 +18,4 @@ else
 LIBEXOSIP2_CONF_OPT += --disable-openssl
 endif
 
-ifneq ($(LIBEXOSIP2_PATCH),)
-define LIBEXOSIP2_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		(cd $(@D)/debian/patches && for i in *; \
-		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBEXOSIP2_VERSION)/,+++ cvs-$(LIBEXOSIP2_VERSION)/,' $$i; \
-		 done; \
-		); \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
-	fi
-endef
-endif
-
-LIBEXOSIP2_POST_PATCH_HOOKS += LIBEXOSIP2_DEBIAN_PATCHES
-
 $(eval $(call AUTOTARGETS))
