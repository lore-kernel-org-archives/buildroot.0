From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 20:39:58 +0200
Subject: [Buildroot] [PATCHv2 2/3] ecryptfs-utils: select gettext,
	needed for command line utilities
In-Reply-To: <1408127999-2352-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408127999-2352-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408127999-2352-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ecryptfs-utils package requires the 'gettext' program, which is
provided by the gettext package, to get translated strings. This is
needed regardless of whether the toolchain uses glibc or uClibc.

This issue was reported by 'ausjke' on IRC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ecryptfs-utils/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 076e1d4..7999ea5 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	bool "ecryptfs-utils"
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBNSS
+	# runtime dependency only, some scripts are using the
+	# 'gettext' program to get translations
+	select BR2_PACKAGE_GETTEXT
+	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
 	depends on BR2_LARGEFILE # libnss
@@ -23,8 +27,8 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ largefile, threads"
+comment "ecryptfs-utils needs a toolchain w/ largefile, threads, wchar"
 	depends on !BR2_avr32 && !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.0.0
