From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:51:59 +0200
Subject: [Buildroot] [PATCH 07/20] Prevent C++ + locale + uClibc 0.9.31 +
	gcc 4.2 to be selected
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f4ffc04bbd066d4b59b4f07486ac485f28fb7f00.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem fixed by 60f945e47a15e10f0e777f69b05492b6f7ba918d is in
fact not limited to the AVR32 architecture, as reported by Will Newton
on the list. The issue is the combination uClibc 0.9.31 with gcc 4.2,
C++ support and locales.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 3c70f9c..ea06ace 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -157,7 +157,7 @@ config BR2_GCC_CROSS_CXX
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	select BR2_GCC_CROSS_CXX
-	depends on !(BR2_avr32 && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31)
+	depends on !(! BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31)
 	help
 	  If you are building your own toolchain and want to build and install
 	  the C++ compiler and library then you need to enable this option.
@@ -165,8 +165,8 @@ config BR2_INSTALL_LIBSTDCPP
 	  support and you want to use the compiler / library then you need 
 	  to select this option.
 
-comment "C++ support broken in uClibc 0.9.31 with locale enabled"
-	depends on BR2_avr32 && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31
+comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
+	depends on !BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31
 
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
-- 
1.7.0.4
