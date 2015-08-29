From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 12:15:13 +0200
Subject: [Buildroot] [PATCH] package/setools: needs wchar
Message-ID: <1440843313-16263-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though setools itself does not require wide chars, the configure
script needs them when testing for C99 support.

Since:
  - it is not clear whether wchar are mandatory for C99 or not,
  - only uClibc may miss support for wide chars,
  - using SELinux would probably involve rather big systems (i.e. glibc
    would not be such a huge overhead),
just make setools depend on the toolchain having widechar.

Fixes:
    http://autobuild.buildroot.org/results/051/051a7f72ebadd56407700c22b57e942f08eb1c09/
    http://autobuild.buildroot.org/results/a4b/a4b2a6f1920430af43c23239de17200e70951b3b/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/setools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 046957f..7bab789 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	# bfin: infamous _ symbol prefix issue
 	# nios2: triggers some toolchain issue "No symbol version
 	# section for versioned symbol"
@@ -25,7 +26,7 @@ config BR2_PACKAGE_SETOOLS
 	   * secmds - command-line tools to analyze and search SELinux
 	     policy.
 
-comment "setools needs a toolchain w/ threads, C++, dynamic library"
+comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP
+		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_nios2 && !BR2_bfin && !BR2_arc
-- 
1.9.1
