From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:42:22 +0100
Subject: [Buildroot] [PATCH] aiccu: disable for uClibc 0.9.31/0.9.32
Message-ID: <1388079742-24548-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aiccu uses the dn_skipname() function, which was only introduced in
uClibc 0.9.33. Therefore, we disable this package when uClibc 0.9.31
and 0.9.32. Most likely, only AVR32 users will be affected by this, so
we don't add a specific kconfig comment for that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index f56ad75..17e6449 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -4,6 +4,9 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# Uses dn_skipname(), only available since 0.9.33
+	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
-- 
1.8.3.2
