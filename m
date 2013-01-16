From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Jan 2013 09:48:44 +0100
Subject: [Buildroot] [git commit] httping: also pass configuration
	(SSL/TFO/DEBUG) doing make install
Message-ID: <20130116085039.5040F9A21B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d93f102e181b23359f0763ffa7f2b467ca98ec8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/144e146ad3223748c4f06f884aeff93e8c0c2de3

When SSL is enabled (which it is by default) an extra source file is built,
so ensure the same configuration is used at 'make install' time as during
the build step.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/httping/httping.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 3ec1dae..4c4d755 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -10,16 +10,17 @@ HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
 HTTPING_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
+	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
+	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
+	DEBUG=no
 
 define HTTPING_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
-		TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
-		DEBUG=no -C $(@D)
+	$(MAKE) $(HTTPING_MAKE_OPT) -C $(@D)
 endef
 
 define HTTPING_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(MAKE) $(HTTPING_MAKE_OPT) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 define HTTPING_CLEAN_CMDS
