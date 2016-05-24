From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 21:49:33 +0200
Subject: [Buildroot] [git commit] strongswan: needs __atomic operations
Message-ID: <20160524195008.8DC068042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45eaede51b6817abc53e71d9e73c4c17ee29039e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strongswan uses the __atomic_*() intrinsics, so we make it depend on
BR2_TOOLCHAIN_HAS_ATOMIC and link with libatomic when available. This
allows to fix the build on SPARC, therefore fixing:

  http://autobuild.buildroot.org/results/7e090237801874fb889c76f84863dc4c2ca20450/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/Config.in     | 2 ++
 package/strongswan/strongswan.mk | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index cada78b..b49435c 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,11 +1,13 @@
 comment "strongswan needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_STATIC_LIBS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index e7606c0..36b5148 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -35,6 +35,10 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+STRONGSWAN_CONF_ENV += LIBS='-latomic'
+endif
+
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
 STRONGSWAN_CONF_OPTS += \
 	--enable-eap-sim \
