From: Petar Koretic <petar.koretic@qaap.io>
Date: Mon, 31 Jul 2017 19:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] qt5declarative: backport 'Fix alignment
	issue on ARMv7' patch to 5.9.1
Message-ID: <20170731171359.32471-1-petar.koretic@qaap.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This resolves a QML issues reported in
https://bugreports.qt.io/browse/QTBUG-61522 that will be fixed in the 5.9.2.

Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
---
 .../0003-Fix-alignment-issue-on-ARMv7.patch        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch

diff --git a/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
new file mode 100644
index 0000000000..da68826ccb
--- /dev/null
+++ b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
@@ -0,0 +1,34 @@
+From 03c2661b1243cc529fc3d8cfa65073f1da420307 Mon Sep 17 00:00:00 2001
+From: Simon Hausmann <simon.hausmann@qt.io>
+Date: Thu, 22 Jun 2017 13:34:09 +0200
+Subject: [PATCH] Fix alignment issue on ARMv7
+
+As analyzed in the bug report, it appears that we may get
+QV4::CompiledData::Function pointers for writing that are not aligned
+for the 64-bit fields at the beginning.
+
+[ChangeLog][QtQml] Fix crash due to misaligned data structures on ARMv7
+
+Task-number: QTBUG-61552
+Change-Id: I6b2c166b725496150c8850475577628ccd811d65
+Reviewed-by: Erik Verbruggen <erik.verbruggen@qt.io>
+---
+ src/qml/compiler/qv4compiler.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/qml/compiler/qv4compiler.cpp b/src/qml/compiler/qv4compiler.cpp
+index e32749bbf..c32e1685a 100644
+--- a/src/qml/compiler/qv4compiler.cpp
++++ b/src/qml/compiler/qv4compiler.cpp
+@@ -406,6 +406,8 @@ QV4::CompiledData::Unit QV4::Compiler::JSUnitGenerator::generateHeader(QV4::Comp
+     *jsClassDataOffset = nextOffset;
+     nextOffset += jsClassData.size();
+ 
++    nextOffset = (nextOffset + 7) & ~quint32(0x7);
++
+     for (int i = 0; i < irModule->functions.size(); ++i) {
+         QV4::IR::Function *f = irModule->functions.at(i);
+         functionOffsets[i] = nextOffset;
+-- 
+2.13.3
+
-- 
2.13.3
