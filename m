From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:45 +0400
Subject: [Buildroot] [PATCH v2 4/9] pulseaudio: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-4-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pulseaudio requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/d463f3bf730a600a07ed6cd33695bf45e9fd3540/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/pulseaudio/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index ac6222c..de99fc8 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_SPEEX
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
@@ -30,6 +31,7 @@ config BR2_PACKAGE_PULSEAUDIO_DAEMON
 
 endif
 
-comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
+comment "pulseaudio needs a toolchain w/ wchar, largefile, threads, atomic intrinsics"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-- 
1.8.4.1
