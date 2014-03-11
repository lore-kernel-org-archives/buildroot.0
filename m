From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:03:24 +0100
Subject: [Buildroot] [git commit] httping: bump to version 2.3.4
Message-ID: <20140311220647.A15009BEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cf9d302a23addd99ab8e5af7ff5f42c65b6a1b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/Config.in  |    5 +++++
 package/httping/httping.mk |    7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/httping/Config.in b/package/httping/Config.in
index 92c7a20..cd97e72 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -1,5 +1,10 @@
+comment "httping needs a toolchain w/ char"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_HTTPING
 	bool "httping"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Httping is like 'ping' but for http-requests.
 	  Give it an url, and it'll show you how long it takes to connect,
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 8385aaf..dd8abb3 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 2.2.1
+HTTPING_VERSION = 2.3.4
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
+HTTPING_LDFLAGS = $(if $(BR2_NEEDS_GETTEXT),-lintl) $(TARGET_LDFLAGS)
 HTTPING_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
@@ -20,7 +22,8 @@ HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
 define HTTPING_BUILD_CMDS
-	$(HTTPING_MAKE_OPT) $(MAKE) OFLAGS= DEBUG=no -C $(@D)
+	$(HTTPING_MAKE_OPT) LDFLAGS="$(HTTPING_LDFLAGS)" \
+		$(MAKE) DEBUG=no -C $(@D)
 endef
 
 define HTTPING_INSTALL_TARGET_CMDS
