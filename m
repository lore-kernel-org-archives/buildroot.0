From: Stephan Hoffmann <sho@relinux.de>
Date: Tue,  5 Feb 2013 11:54:17 +0100
Subject: [Buildroot] [PATCH 1/2] ProFTPD: Add config option to enable
	mod_rewrite
Message-ID: <1360061657-2329-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/proftpd/Config.in  |    6 ++++++
 package/proftpd/proftpd.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index abdedc9..7866e0a 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -4,3 +4,9 @@ config BR2_PACKAGE_PROFTPD
 	  ProFTPD, a highly configurable FTP server.
 
 	  http://www.proftpd.org/
+
+config BR2_PACKAGE_PROFTPD_MOD_REWRITE
+	bool "proftpd mod_rewrite"
+	depends on BR2_PACKAGE_PROFTPD
+	help
+	  Compile ProFTPD with mod_rewrite
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 1d02194..92644a8 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -20,6 +20,10 @@ PROFTPD_CONF_OPT = --localstatedir=/var/run \
 		--enable-shadow \
 		--with-gnu-ld
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
+PROFTPD_CONF_OPT += --with-modules=mod_rewrite
+endif
+
 define PROFTPD_MAKENAMES
 	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
 endef
-- 
1.7.0.4
