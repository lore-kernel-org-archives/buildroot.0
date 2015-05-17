From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 13:42:34 +0200
Subject: [Buildroot] [git commit] ipmiutil: openssl is an optional dependency
Message-ID: <20150517120754.B038F8010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a07f5e4fe2543f8fbee4cdc680318bc426bd83d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So handle it as such (it is only needed for the lanplus functionality).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/Config.in   |    1 -
 package/ipmiutil/ipmiutil.mk |    9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
index 2500583..a2a898b 100644
--- a/package/ipmiutil/Config.in
+++ b/package/ipmiutil/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_IPMIUTIL
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_x86_64 || BR2_i386
-	select BR2_PACKAGE_OPENSSL
 	help
 	  The ipmiutil package provides easy-to-use utilities to view
 	  the SEL, perform an IPMI chassis reset, set up the IPMI LAN
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index c7a8dd8..f03ad9b 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -10,10 +10,15 @@ IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
-IPMIUTIL_CONF_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
-IPMIUTIL_DEPENDENCIES = openssl
+IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
+IPMIUTIL_DEPENDENCIES += openssl
+else
+IPMIUTIL_CONF_OPTS += --disable-lanplus
+endif
 
 $(eval $(autotools-package))
