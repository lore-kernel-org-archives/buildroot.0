From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 16:42:11 +0200
Subject: [Buildroot] [git commit] neard: add support for tools
Message-ID: <20130426144238.439909B857@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f14d9baedaca2f55299b7b616b9939336196963
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neard/Config.in |    6 ++++++
 package/neard/neard.mk  |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index bcf6171..ec1fcb3 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -14,5 +14,11 @@ config BR2_PACKAGE_NEARD
 
 	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
 
+config BR2_PACKAGE_NEARD_TOOLS
+	bool "neard tools"
+	depends on BR2_PACKAGE_NEARD
+	help
+	  Build and install neard tools.
+
 comment "neard requires a toolchain with WCHAR and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 056875c..cc6aeac 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -13,4 +13,8 @@ NEARD_AUTORECONF = YES
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
 NEARD_CONF_OPT = --disable-traces
 
+ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
+	NEARD_CONF_OPT += --enable-tools
+endif
+
 $(eval $(autotools-package))
