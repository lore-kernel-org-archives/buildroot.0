From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 14 Jan 2016 14:55:55 +0300
Subject: [Buildroot] [PATCH 1/2] Disabling trousers package for arc
In-Reply-To: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
References: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1452772556-18734-2-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts
to generate PIE binaries as of today PIE is not really supported
for user-space applications. Trousers configure scripts don't provide any
options which can disable pie usage. So there is no easy way to prevent
linking with -pie on ARC. The easiest solution is just to make
the trousers package not available on ARC.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/trousers/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index 6ab74bf..837c69f 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TROUSERS
 	bool "trousers"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on !BR2_arc # requires pie
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
-- 
2.5.0
