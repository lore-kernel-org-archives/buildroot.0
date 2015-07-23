From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:35:12 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: fix test-unicode static
	linking issue
Message-ID: <20150723213519.B40AB803F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d38cfbf4f541b1d3a3332372169363dcc18d7365
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking test-unicode statically, it needs $(ICU_LIBS)
which contains all required flags.
Especially -lstdc++.

Fixes:
http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-static-linking-with-icu-uc.patch      |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

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
