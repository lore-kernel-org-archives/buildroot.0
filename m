From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 May 2010 22:33:25 +0200
Subject: [Buildroot] [PATCH 1/3] Improve gettext integration
In-Reply-To: <cover.1274733199.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274733199.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4caf78882ce0a5046504f94545a98296913f2f25.1274733199.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having a BR2_NEEDS_GETTEXT option, as introduced by
54d64798e1e14b526c3cc1142961972cff9f1e8a isn't sufficient to express
the different kind of dependencies on gettext.

This commit, based on an idea by Peter Korsgaard, introduces two
different options :

 * BR2_NEEDS_GETTEXT, which is true as soon as the toolchain doesn't
   provide gettext itself (i.e, when the toolchain is uClibc based, be
   it an internal or external toolchain)

 * BR2_NEEDS_GETTEXT_IF_LOCALE, which is true when the toolchain
   doesn't provide gettext *and* locale support has been enabled in
   Buildroot.

A following commit adds some documentation that details how these
configuration variables should be used by packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in.2 |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index fc6759d..595ab87 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -56,13 +56,20 @@ config BR2_ENABLE_LOCALE_WHITELIST
 	  will be available on the target - That purely depends on the
 	  support for that locale in the selected packages.
 
-# uClibc toolchains require a separatly-compiled gettext/libintl when
-# locale support is enabled. This isn't necessary with glibc
-#  toolchains as glibc includes gettext/libintl.
+# glibc and eglibc directly include gettext, so a separatly compiled
+# gettext isn't needed and shouldn't be built to avoid conflicts. Some
+# packages always need gettext, other packages only need gettext when
+# locale support is enabled. See the documentation for how packages
+# should rely on the following two options.
+
 config BR2_NEEDS_GETTEXT
 	bool
-	default y if (BR2_TOOLCHAIN_BUILDROOT && BR2_ENABLE_LOCALE)
-	default y if (BR2_TOOLCHAIN_EXTERNAL_UCLIBC && BR2_ENABLE_LOCALE)
+	default y if BR2_TOOLCHAIN_BUILDROOT
+	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_NEEDS_GETTEXT_IF_LOCALE
+	bool
+	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_WCHAR
 	bool "Enable WCHAR support"
-- 
1.6.3.3
