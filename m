From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 25 Feb 2016 23:08:47 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing monodoc leaking path
Message-ID: <1456438127-15919-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a leak in host compiler path for monodoc.
This bug is solved upstream but the fix is not included
in the latest stable release.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...-monodoc-Fixing-wrong-monodoc-search-path.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch

diff --git a/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch b/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
new file mode 100644
index 0000000..58fa323
--- /dev/null
+++ b/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
@@ -0,0 +1,29 @@
+From 18bba65adf58d54645398de26eac24081d48f793 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Thu, 25 Feb 2016 22:19:31 +0100
+Subject: [PATCH] mcs/class/monodoc/Makefile: Fixing wrong monodoc search path
+
+mono_libdir actually leaks host compiler path, fixing
+by hardcoding correct path for our usecase.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ mcs/class/monodoc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mcs/class/monodoc/Makefile b/mcs/class/monodoc/Makefile
+index 3ebba80..ddc2098 100644
+--- a/mcs/class/monodoc/Makefile
++++ b/mcs/class/monodoc/Makefile
+@@ -135,7 +135,7 @@ test-local: setup-doc-sources
+ dist-local: Monodoc.Ecma/EcmaUrlParser.cs
+ 
+ $(the_lib).config: Makefile monodoc.dll.config.in
+-	sed 's, at monodoc_refdir@,$(mono_libdir)/monodoc,g' monodoc.dll.config.in > $@
++	sed 's, at monodoc_refdir@,/usr/lib/monodoc,g' monodoc.dll.config.in > $@
+ 
+ Monodoc.Ecma/EcmaUrlParser.cs: Monodoc.Ecma/EcmaUrlParser.jay $(topdir)/jay/skeleton.cs jay.sh
+ 	$(topdir)/$(thisdir)/jay.sh $(topdir) $< $@ $(JAY_FLAGS)
+-- 
+1.9.1
+
-- 
1.9.1
