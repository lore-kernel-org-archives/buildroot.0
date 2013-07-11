From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 15:51:33 +0200
Subject: [Buildroot] [PATCH] gcc: provide an option to enable mudflap support
Message-ID: <1373550693-14815-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mudflap library is only useful if one uses the -fmudflap gcc
option, to do more checks on pointers/arrays, which is typically not
the case. Until now, it was always being built. This commit disables
it by default to save a little bit of build time, and provides an
option to enable it when needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 12 ++++++++++++
 package/gcc/gcc.mk         |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0836f9f..86f7fdc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -118,3 +118,15 @@ config BR2_GCC_ENABLE_OPENMP
 	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
 	help
 	  Enable OpenMP support for the compiler
+
+config BR2_GCC_ENABLE_LIBMUDFLAP
+	bool "Enable libmudflap support"
+	help
+	  libmudflap is a gcc library used for the mudflap pointer
+	  debugging functionality. It is only needed if you intend to
+	  use the -fmudflap gcc flag.
+
+	  See http://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging and
+	  the help of the gcc -fmudflap option for more details.
+
+	  If you're unsure, leave this option disabled.
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index d3e9bc0..608fa95 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -117,6 +117,12 @@ else
 HOST_GCC_COMMON_CONF_OPT += --disable-tls
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
+HOST_GCC_COMMON_CONF_OPT += --enable-libmudflap
+else
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPT += \
 	--disable-threads \
-- 
1.8.1.2
