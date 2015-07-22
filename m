From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 23:47:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/harfbuzz: fix test-unicode static
	linking issue
In-Reply-To: <1437601623-3001-1-git-send-email-romain.naour@openwide.fr>
References: <1437601623-3001-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437601623-3001-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking test-unicode statically, it needs $(ICU_LIBS)
which contains all required flags.
Especially -lstdc++.

Fixes:
http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0001-fix-static-linking-with-icu-uc.patch      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch

diff --git a/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch b/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch
new file mode 100644
index 0000000..dd64393
--- /dev/null
+++ b/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch
@@ -0,0 +1,33 @@
+From 5752d3f17072aa97a056dc081e402f43e1a3ba32 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 22 Jul 2015 23:26:23 +0200
+Subject: [PATCH] fix static linking with icu-uc
+
+When linking test-unicode statically it needs $(ICU_LIBS)
+which contains all required flags.
+Especially -lstdc++.
+
+Fixes:
+http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ test/api/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/api/Makefile.am b/test/api/Makefile.am
+index 4ff14fa..314a09f 100644
+--- a/test/api/Makefile.am
++++ b/test/api/Makefile.am
+@@ -34,7 +34,7 @@ test_unicode_CPPFLAGS += $(GLIB_CFLAGS)
+ endif
+ if HAVE_ICU
+ test_unicode_CPPFLAGS += $(ICU_CFLAGS)
+-test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la
++test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la $(ICU_LIBS)
+ endif
+ 
+ 
+-- 
+2.4.3
+
-- 
2.4.3
