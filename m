From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:53:05 +0200
Subject: [Buildroot] [git commit] package/apparmor: add option to install
 binutils
Message-ID: <20200420075435.9A7868F448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa9466f5a47dd7248ec13f369336c0aca0f53d12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/Config.in   | 10 ++++++++++
 package/apparmor/apparmor.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index e219507803..edc837366d 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_APPARMOR
 
 	  http://wiki.apparmor.net
 
+if BR2_PACKAGE_APPARMOR
+
+config BR2_PACKAGE_APPARMOR_BINUTILS
+	bool "binutils"
+	help
+	  A set of utilities (written in C):
+	    aa-enabled    aa-exec
+
+endif # BR2_PACKAGE_APPARMOR
+
 comment "apparmor needs a toolchain w/ headers >= 3.16, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index cab37d06a6..9ee5304a16 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -17,6 +17,10 @@ APPARMOR_DEPENDENCIES = libapparmor
 APPARMOR_TOOLS = parser
 APPARMOR_MAKE_OPTS = USE_SYSTEM=1
 
+ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
+APPARMOR_TOOLS += binutils
+endif
+
 define APPARMOR_BUILD_CMDS
 	$(foreach tool,$(APPARMOR_TOOLS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
