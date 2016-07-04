From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:20 +0200
Subject: [Buildroot] [PATCH 09/83 v2] package/mono: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <1c9519ae3a9607d6d11266c43ae99e77077ccc60.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bit overkill, as there is only one sub-item. However, this
commit is not about judging whether it makes sense or not to have a
sub-menu, but to cleanup the 'config'+'menu' situation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in      | 5 -----
 package/mono/Config.in | 8 +++++++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d312347..819224b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -569,11 +569,6 @@ endif
 	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
-if BR2_PACKAGE_MONO
-menu "Mono libraries/modules"
-	source "package/mono-gtksharp3/Config.in"
-endmenu
-endif
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono/Config.in b/package/mono/Config.in
index d45ad37..4f1f78d 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
 		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
 
-config BR2_PACKAGE_MONO
+menuconfig BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -14,6 +14,12 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
+if BR2_PACKAGE_MONO
+
+source "package/mono-gtksharp3/Config.in"
+
+endif
+
 comment "mono needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.7.4
