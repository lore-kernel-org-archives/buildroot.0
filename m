From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Jul 2013 17:59:53 +0200
Subject: [Buildroot] [PATCH] toolchain: disable C++ support on AVR32 gcc 4.2
	with uClibc
Message-ID: <1373299193-9419-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 25c3160092d7 ("uClibc 0.9.31: remove stray kludges/conditions"), a
conditional that prevents the combination gcc 4.2-avr / C++ / locale
with uClibc 0.9.31 was removed. However, it turns out that the same
problem is affecting uClibc 0.9.33, described at
http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/24260.

Therefore, we prevent the combination of gcc 4.2-avr / C++ / locale to
happen.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 9bbf016..e223d9d 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -7,11 +7,16 @@ comment "Toolchain Options"
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
+	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
+		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
 	help
 	  Enable this option if you want your toolchain to support the
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
+comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
+	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
+
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
 	help
-- 
1.8.1.2
