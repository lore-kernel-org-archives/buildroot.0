From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:18 +0200
Subject: [Buildroot] [PATCH 098/100] toolchain: drop BR2_NEEDS_GETTEXT{,
	_IF_LOCALE}
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-99-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all packages have been migrated to the new gettext logic, we
can remove the BR2_NEEDS_GETTEXT and BR2_NEEDS_GETTEXT_IF_LOCALE
variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in     |  1 -
 toolchain/toolchain-common.in | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0dea03d..60f8d4f 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -22,5 +22,4 @@ config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 endif
 
 comment "gettext needs a toolchain w/ wchar"
-	depends on BR2_NEEDS_GETTEXT
 	depends on !BR2_USE_WCHAR
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 56de9ed..1e4182e 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -74,20 +74,6 @@ config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
 
 	  Note: the full set of gconv libs are ~8MiB (on ARM).
 
-# glibc and eglibc directly include gettext, so a separatly compiled
-# gettext isn't needed and shouldn't be built to avoid conflicts. Some
-# packages always need gettext, other packages only need gettext when
-# locale support is enabled. See the documentation for how packages
-# should rely on the following two options.
-
-config BR2_NEEDS_GETTEXT
-	bool
-	default y if BR2_TOOLCHAIN_USES_UCLIBC
-
-config BR2_NEEDS_GETTEXT_IF_LOCALE
-	bool
-	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
-
 # This boolean is true if the toolchain provides a built-in full
 # featured gettext implementation (glibc), and false if only a stub
 # gettext implementation is provided (uclibc, musl)
-- 
2.9.4
