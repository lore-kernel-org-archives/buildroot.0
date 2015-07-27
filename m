From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 27 Jul 2015 12:06:24 +0200
Subject: [Buildroot] [PATCH v2] package/mono: fixing missing locale
Message-ID: <1437991584-27267-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes compilation error in case of a missing locale in toolchain.

Fixes: http://autobuild.buildroot.net/results/a0fc33a4ed90844f9529acc76a6ba183fe253771/
       http://autobuild.buildroot.net/results/3ff839e894f0b8f9c2e3af9629d45e8efc09aecd/
       http://autobuild.buildroot.net/results/5e11117048d965bc1fc44c738bb51f11164304af/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:

v1->v2:
 * Added libiconv mono dependency as suggested by Thomas

 package/mono/Config.in | 1 +
 package/mono/mono.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 4445f4b..0c7129b 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 9cb8564..8668aa0 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -36,6 +36,10 @@ endef
 
 MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MONO_DEPENDENCIES += libiconv
+endif
+
 MONO_DEPENDENCIES += host-mono
 
 ## Mono managed
-- 
1.9.1
