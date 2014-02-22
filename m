From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 19:43:35 +0100
Subject: [Buildroot] [PATCH] aiccu: disable on AVR32
Message-ID: <1393094615-13012-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 87492d244a1dbf6114bb464e8d8dbedcf08fb399 ("aiccu: disable
for uClibc 0.9.31/0.9.32"), we made sure it was not possible to select
aiccu with uClibc 0.9.31 and 0.9.32, because they lack dn_skipname().

However, we still have the problem that external AVR32 toolchains can
select aiccu, which causes build failures. Therefore, we also disallow
aiccu on AVR32 altogether. We keep the 0.9.31/0.9.32 exclusions,
because if they are used on other architectures, it would also fail
due to the lack of dn_skipname().

Fixes:

  http://autobuild.buildroot.org/results/a24/a2490d434152625d9208615d83f4c5d6daea79d0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 17e6449..9865b5c 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_AICCU
 	# Uses dn_skipname(), only available since 0.9.33
 	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
 		!BR2_UCLIBC_VERSION_0_9_32
+	# AVR32 only has uClibc 0.9.31, so there's no way it can build
+	# due to the lack of dn_skipname(), even with external
+	# toolchains.
+	depends on !BR2_avr32
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
-- 
1.8.3.2
