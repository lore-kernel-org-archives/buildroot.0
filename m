From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 13:39:49 +0100
Subject: [Buildroot] [git commit] ProFTPD: Add config option to enable
	mod_rewrite
Message-ID: <20130304123917.CA7C09A923@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06ae891a39655568cbf4956cb3217994207876dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: tweak Config.in text]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proftpd/Config.in  |    6 ++++++
 package/proftpd/proftpd.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index abdedc9..7793713 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -4,3 +4,9 @@ config BR2_PACKAGE_PROFTPD
 	  ProFTPD, a highly configurable FTP server.
 
 	  http://www.proftpd.org/
+
+config BR2_PACKAGE_PROFTPD_MOD_REWRITE
+	bool "mod_rewrite support"
+	depends on BR2_PACKAGE_PROFTPD
+	help
+	  Compile ProFTPD with mod_rewrite support
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
