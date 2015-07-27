From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:19:55 +0200
Subject: [Buildroot] [git commit] package/mono: fixing missing locale
Message-ID: <20150727212000.7AB6C81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a35b7c4e91be9ffe02fe96cb66148fa5d53d3325
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes compilation error in case of a missing locale in toolchain.

Fixes: http://autobuild.buildroot.net/results/a0fc33a4ed90844f9529acc76a6ba183fe253771/
       http://autobuild.buildroot.net/results/3ff839e894f0b8f9c2e3af9629d45e8efc09aecd/
       http://autobuild.buildroot.net/results/5e11117048d965bc1fc44c738bb51f11164304af/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/Config.in |    1 +
 package/mono/mono.mk   |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

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
