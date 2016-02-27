From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 11:58:46 +0100
Subject: [Buildroot] [git commit] package/mono: fixing monodoc leaking path
Message-ID: <20160227105930.0ECBE7FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0028ae2e6d1e7359eaa5aecef35863022328add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a leak in host compiler path for monodoc.
This bug is solved upstream but the fix is not included
in the latest stable release.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-monodoc-Fixing-wrong-monodoc-search-path.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

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
