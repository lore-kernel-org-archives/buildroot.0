From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 09:20:23 +0200
Subject: [Buildroot] [PATCH] samba: disable on AVR32
Message-ID: <1400570423-26735-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

samba produces particularly large binaries, and the relocations needed
for it do not fit in the possible relocation mechanisms available on
AVR32. Since samba is very unlikely to be used on AVR32, let's just
disable it, as we've already done for samba4.

Fixes:

  http://autobuild.buildroot.net/results/0142b1d5b8c3f20f1bff76ece646d901407f7490/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index c5b7e48..70ff960 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_SAMBA
 	bool "samba"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# binary too large, relocations don't fit
+	depends on !BR2_avr32
 	select BR2_PACKAGE_POPT
 	help
 	  Provides secure, stable and fast file and print services
@@ -14,6 +16,7 @@ config BR2_PACKAGE_SAMBA
 		so choose only the components you need.
 
 comment "samba needs a toolchain w/ threads"
+	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
1.9.3
