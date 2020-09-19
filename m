From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:59:57 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: fix bison-3.7.1
 related compile failure
Message-ID: <20200919125046.5A2F282A1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c5804cf758f812004341d22aff3cd2157868cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add gentoo patch to fix bison-3.7.1 related compile failure and
an additional one doing a similare change for another bison call
in Source/WebCore/DerivedSources.pri.

Fixes:

  generated/XPathGrammar.tab.c:124:10: fatal error: XPathGrammar.tab.h: No such file or directory

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...enerate-the-header-directly-to-fix-build-.patch | 52 ++++++++++++++++++++++
 ...enerate-the-header-directly-to-fix-build-.patch | 31 +++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch b/package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch
new file mode 100644
index 0000000000..7bb81b1259
--- /dev/null
+++ b/package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch
@@ -0,0 +1,52 @@
+From 894a5448ee8ce0f134845c877b4c0a2a660e4ab3 Mon Sep 17 00:00:00 2001
+From: Dmitry Shachnev <mitya57@gmail.com>
+Date: Tue, 4 Aug 2020 21:04:06 +0300
+Subject: [PATCH] Let Bison generate the header directly, to fix build with
+ Bison 3.7
+
+Starting with Bison 3.7, the generated C++ file #include's the header
+by default, instead of duplicating it. So we should not delete it.
+
+Remove the code to add #ifdef guards to the header, since Bison adds
+them itself since version 2.6.3.
+
+[Original patch taken from
+https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-qt/qtwebkit/files/qtwebkit-5.212.0_pre20200309-bison-3.7.patch?id=69e618c88a9134f754264efc11aa0b1fdc028b88
+ported to qtwebkit-opensource-src-5.9.1]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Source/WebCore/css/makegrammar.pl | 21 +--------------------
+ 1 file changed, 1 insertion(+), 20 deletions(-)
+
+diff --git a/Source/WebCore/css/makegrammar.pl b/Source/WebCore/css/makegrammar.pl
+index 4e0452ed..9ef32963 100644
+--- a/Source/WebCore/css/makegrammar.pl
++++ b/Source/WebCore/css/makegrammar.pl
+@@ -73,23 +73,4 @@ if ($suffix eq ".y.in") {
+ }
+ 
+ my $fileBase = File::Spec->join($outputDir, $filename);
+-system("$bison -d -p $symbolsPrefix $grammarFilePath -o $fileBase.cpp");
+-
+-open HEADER, ">$fileBase.h" or die;
+-print HEADER << "EOF";
+-#ifndef CSSGRAMMAR_H
+-#define CSSGRAMMAR_H
+-EOF
+-
+-open HPP, "<$fileBase.cpp.h" or open HPP, "<$fileBase.hpp" or die;
+-while (<HPP>) {
+-    print HEADER;
+-}
+-close HPP;
+-
+-print HEADER "#endif\n";
+-close HEADER;
+-
+-unlink("$fileBase.cpp.h");
+-unlink("$fileBase.hpp");
+-
++system("$bison --defines=$fileBase.h -p $symbolsPrefix $grammarFilePath -o $fileBase.cpp");
+-- 
+2.28.0
+
diff --git a/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch b/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch
new file mode 100644
index 0000000000..9deb2d8c63
--- /dev/null
+++ b/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch
@@ -0,0 +1,31 @@
+From 8959e226fac7f73b9a40e202610bd5e12334561b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 15 Sep 2020 19:11:18 +0200
+Subject: [PATCH] let bison generate the header directly, to fix build with
+ bison 3.7
+
+Do the same as the patch taken from [1] for the bison call in
+Source/WebCore/DerivedSources.pri to fix file generation
+for bison 3.7.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Source/WebCore/DerivedSources.pri | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/DerivedSources.pri b/Source/WebCore/DerivedSources.pri
+index 57a6b0f7..e9f52614 100644
+--- a/Source/WebCore/DerivedSources.pri
++++ b/Source/WebCore/DerivedSources.pri
+@@ -987,7 +987,7 @@ GENERATORS += pluginsresources
+ # GENERATOR 11: XPATH grammar
+ xpathbison.output = ${QMAKE_FILE_BASE}.cpp
+ xpathbison.input = XPATHBISON
+-xpathbison.commands = bison -d -p xpathyy ${QMAKE_FILE_NAME} -o ${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.tab.c && $(MOVE) ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.tab.c ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.cpp && $(MOVE) ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.tab.h ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.h
++xpathbison.commands = bison --defines=${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.h -p xpathyy ${QMAKE_FILE_NAME} -o ${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.cpp
+ xpathbison.depends = ${QMAKE_FILE_NAME}
+ GENERATORS += xpathbison
+ 
+-- 
+2.28.0
+
