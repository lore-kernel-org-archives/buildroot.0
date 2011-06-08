From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Wed,  8 Jun 2011 15:57:27 +0200
Subject: [Buildroot] [PATCH 2/3] oprofile: Make it possible to select it
	with external toolchain
In-Reply-To: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
References: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
Message-ID: <1307541448-15176-2-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

---
 package/oprofile/Config.in |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 0e3652d..6c9e149 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_OPROFILE
 	# The dependency on binutils_target does not work with
 	# external toolchains since the binutils version was not
 	# choosen in the config. This will have to be fixed later.
-	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
-	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_BINUTILS_LIBBFD
+	depends on BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_EXTERNAL
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -23,5 +23,8 @@ config BR2_PACKAGE_OPROFILE
 	  interrupt handlers, kernel modules, the kernel, shared
 	  libraries, and applications.
 
+	  If you compile oprofile with external toolchain, make sure
+	  you have C++ support enabled.
+
 comment "oprofile requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL && !BR2_INSTALL_LIBSTDCPP
-- 
1.7.5.2
