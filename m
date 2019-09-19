From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Sep 2019 22:02:57 +0200
Subject: [Buildroot] [PATCH] package/ytree: needs glibc/uclibc toolchain
 (re_comp/re_exec)
Message-ID: <20190919200257.7960-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  match.o: In function `SetMatchSpec':
  match.c:(.text+0x9c): undefined reference to `re_comp'
  match.o: In function `Match':
  match.c:(.text+0xca): undefined reference to `re_exec'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ytree/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ytree/Config.in b/package/ytree/Config.in
index 3ac9283a56..c6f75b5590 100644
--- a/package/ytree/Config.in
+++ b/package/ytree/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_YTREE
 	bool "ytree"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # re_comp/re_exec
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Ytree - a (curses-based) file manager similar to DOS Xtree(tm)

 	  https://www.han.de/~werner/ytree.html
+
+comment "ytree needs a glibc or uClibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
--
2.23.0
