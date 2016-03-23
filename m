From: Matt Weber <matt@thewebers.ws>
Date: Tue, 22 Mar 2016 21:02:42 -0500
Subject: [Buildroot] [PATCH 1/1] setools: disable arch sparc64
Message-ID: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the buildroot sparc64 toolchain encounters a series of relocation
errors.  i.e.
policy_scan.c: relocation truncated to fit: R_SPARC_GOT13 against symbol ....

Workaround for numerous autobuilder failures, including:
http://autobuild.buildroot.net/results/ba1/ba1e473178bb66ebc43897b20e534606d2577ee3/

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
 package/setools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index c291b21..fb4044e 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -12,7 +12,8 @@ config BR2_PACKAGE_SETOOLS
 	# nios2: triggers some toolchain issue "No symbol version
 	# section for versioned symbol"
 	# arc: libselinux not available
-	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
+	# sparc64: relocation truncated to fit: R_SPARC_GOT13 against sym
+	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc && !BR2_sparc64
 	help
 	  SETools is an open source project designed to facilitate
 	  SELinux policy analysis. The primary tools are:
@@ -31,4 +32,4 @@ config BR2_PACKAGE_SETOOLS
 comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
+	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc && !BR2_sparc64
-- 
2.5.0
