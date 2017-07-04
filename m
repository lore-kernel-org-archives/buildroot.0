From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:35 +0200
Subject: [Buildroot] [git commit] toolchain: drop BR2_NEEDS_GETTEXT{,
	_IF_LOCALE}
Message-ID: <20170704233520.BDEAC80420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4460da3e147a65377478bc5937b67fff831651d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all packages have been migrated to the new gettext logic, we
can remove the BR2_NEEDS_GETTEXT and BR2_NEEDS_GETTEXT_IF_LOCALE
variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index 59115f3..c570cc8 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -79,20 +79,6 @@ config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
 
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
