From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:27:06 +0100
Subject: [Buildroot] [git commit] can-festival: disable on musl
Message-ID: <20160227222849.D84057FC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d00a4058b9e522f34a00c4c0c1b2a6be6dc13fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous attempts to fix it failed [1], so disable it instead.

[1] http://patchwork.ozlabs.org/patch/509731/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/canfestival/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index 7c7b370..4e73496 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -2,13 +2,16 @@ config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
 
-comment "canfestival needs a toolchain w/ threads and dynamic library"
+comment "canfestival needs a (e)glibc or uClibc toolchain w/ threads and dynamic library"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_CANFESTIVAL
 	bool "canfestival"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
