From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Nov 2014 17:48:54 +0100
Subject: [Buildroot] [PATCH 3/3] package/lxc: disable broken toolchains on
	nios2
In-Reply-To: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1417366134-2098-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed with Thomas
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
only the current toolchains are broken:
"it's better to blacklist the individual toolchains that are known
to be broken, so that if we add another toolchain, we will be able
to see if the same bug happens as well or not."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lxc/Config.in |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index cf85712..a90e58e 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,7 +6,9 @@ config BR2_PACKAGE_LXC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
-	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
+	# the toolchain doesn't support setns syscall
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
@@ -18,6 +20,7 @@ config BR2_PACKAGE_LXC
 comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
-	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
                 || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.7.10.4
