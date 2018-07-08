From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 util-linux
Message-ID: <20180708110809.E1EDD863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0bc0e94ab0d6cc4a0a30835f162987d5cd0614e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk       | 1 +
 package/util-linux/util-linux.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c42c4a470a..38f0246b4f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
 	$(if $(BR2_PACKAGE_WHOIS),whois)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 80a8a08051..76f4b97f5f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -31,12 +31,6 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 # We also don't want the host-python dependency
 HOST_UTIL_LINUX_CONF_OPTS = --without-python
 
-# If both util-linux and busybox are selected, make certain util-linux
-# wins the fight over who gets to have their utils actually installed
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-UTIL_LINUX_DEPENDENCIES += busybox
-endif
-
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
