From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:59 +0200
Subject: [Buildroot] [PATCH 16/19] toolchain: mark uClibc 0.9.31 + locale +
	C++ as broken
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <60f945e47a15e10f0e777f69b05492b6f7ba918d.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fails to build with:

ctype_members.cc: In constructor 'std::ctype_byname<_CharT>::ctype_byname(const char*, size_t) [with _CharT = char]':
ctype_members.cc:59: error: invalid use of incomplete type 'struct __uclibc_locale_struct'
/home/test/avr32-br/usr/avr32-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85: error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:60: error: invalid use of incomplete type 'struct __uclibc_locale_struct'
/home/test/avr32-br/usr/avr32-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85: error: forward declaration of 'struct __uclibc_locale_struct'
ctype_members.cc:61: error: invalid use of incomplete type 'struct __uclibc_locale_struct'
/home/test/avr32-br/usr/avr32-unknown-linux-uclibc/sys-include/bits/uClibc_locale.h:85: error: forward declaration of 'struct __uclibc_locale_struct'
make[5]: *** [ctype_members.lo] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bea0c7c..3c70f9c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -157,6 +157,7 @@ config BR2_GCC_CROSS_CXX
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
 	select BR2_GCC_CROSS_CXX
+	depends on !(BR2_avr32 && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31)
 	help
 	  If you are building your own toolchain and want to build and install
 	  the C++ compiler and library then you need to enable this option.
@@ -164,6 +165,9 @@ config BR2_INSTALL_LIBSTDCPP
 	  support and you want to use the compiler / library then you need 
 	  to select this option.
 
+comment "C++ support broken in uClibc 0.9.31 with locale enabled"
+	depends on BR2_avr32 && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31
+
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-pipe"
-- 
1.7.0.4
