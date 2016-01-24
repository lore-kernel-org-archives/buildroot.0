From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:07:47 +0100
Subject: [Buildroot] [PATCH 01/21] libftdi: C++ bindings need boost
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to libftdi configure.in:

"""
dnl libftdi C++ wrapper. Needs boost.
[...]
        if test "x$HAVE_BOOST" != "xyes"; then
            AC_MSG_ERROR(Sorry, we need the boost library for the C++ wrapper)
        fi
"""

And indeed, if you enable BR2_PACKAGE_LIBTFDI_CPP but don't have Boost
enabled, the libfdipp library is not built. To fix this, this commit
changes BR2_PACKAGE_LIBTFDI_CPP to select Boost.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi/Config.in  | 9 ++++++++-
 package/libftdi/libftdi.mk | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index 76b30b1..c0ab0f2 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -12,11 +12,18 @@ config BR2_PACKAGE_LIBFTDI
 if BR2_PACKAGE_LIBFTDI
 
 config BR2_PACKAGE_LIBTFDI_CPP
-	depends on BR2_INSTALL_LIBSTDCPP
 	bool "C++ bindings"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BOOST
 	help
 	  C++ bindings for libftdi
 
+comment "libftdi C++ bindings need a toolchain w/ wchar, C++"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
 endif # BR2_PACKAGE_LIBFTDI
 
 comment "libftdi needs a toolchain w/ threads"
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 8370b0a..28f20e3 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -15,6 +15,7 @@ LIBFDTI_CONF_OPTS = --without-examples
 
 # configure detect it automaticaly so we need to force it
 ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
+LIBFTDI_DEPENDENCIES += boost
 LIBFDTI_CONF_OPTS += --enable-libftdipp
 else
 LIBFDTI_CONF_OPTS += --disable-libftdipp
-- 
2.6.4
