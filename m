From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 22 Feb 2014 21:49:00 +0100
Subject: [Buildroot] [PATCH 1/1] iputils: disable on older uclibc versions
Message-ID: <1393102140-5880-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable when using a uclibc version before 0.9.33 since __dn_comp
function support was added in this version. Also disabling on AVR32
since any AVR32 toolchain will be based on a uclibc version older
than 0.9.33 (for using an external AVR32 toolchain).

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/iputils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index d4d2829..b24f34f 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_IPUTILS
 	bool "iputils"
 	select BR2_OPENSSL if BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
+	# requires __dn_comp (only available in since uclibc 0.9.33)
+	depends on !BR2_avr32
+	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
-- 
1.8.3.2
