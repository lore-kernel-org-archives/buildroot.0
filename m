From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 23 May 2015 15:56:39 +0200
Subject: [Buildroot] [PATCH] package/efl/libelementary: disable on static
	lib only build
Message-ID: <1432389399-12671-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libelementary sources include dlfcn.h header when HAVE_FORK symbol is defined;
this is always the case because elf already depends on BR2_USE_MMU.

Fixes:
  http://autobuild.buildroot.org/results/07c/07c97918dab24215f5c5130a9cd2788adca0a27d/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/efl/libelementary/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index c193ef1..4f62592 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,5 +1,5 @@
-comment "libelementary needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libelementary needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on !BR2_STATIC_LIBS
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
-- 
2.4.1
