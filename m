From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 21:25:15 +0200
Subject: [Buildroot] [git commit] package/bind: remove threads dependency
Message-ID: <20190509202328.A6AE788EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8935dae1d4efb81ea4d30cb1aef5c7451644664b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Threads dependency has been added in 2015 with commit
07c1ad4647b6a8e60338fc01ddcb2d629de0ad14 however bind can be built
without threads thanks to --disable-threads

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/Config.in | 5 -----
 package/bind/bind.mk   | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 5b34b66f7a..60546f691b 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  BIND (Berkeley Internet Name Domain) is an
 	  implementation of the Domain Name System (DNS) protocols
@@ -39,7 +38,3 @@ config BR2_PACKAGE_BIND_TOOLS
 	  Install tools (dig, host, nslookup, nsupdate)
 
 endif
-
-comment "bind needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9d1f5a1ecb..feec6fe27d 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -24,6 +24,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
