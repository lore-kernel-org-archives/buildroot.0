From: Petar Koretic <petar.koretic@qaap.io>
Date: Mon, 31 Jul 2017 22:32:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5declarative: backport 'Fix alignment
	issue on ARMv7' patch to 5.9.1
Message-ID: <20170731203206.17875-1-petar.koretic@qaap.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This resolves a QML issues reported in
https://bugreports.qt.io/browse/QTBUG-61522 that will be fixed in the
5.9.2.

Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
---
v2:
 - add patch to 5.9.1 subfolder
 - add missing bug report link and Signed-off-by to upstream patch

 .../5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/qt5/qt5declarative/5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch

diff --git a/package/qt5/qt5declarative/5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch b/package/qt5/qt5declarative/5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch
new file mode 100644
index 0000000000..1d36b805f2
--- /dev/null
+++ b/package/qt5/qt5declarative/5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch
@@ -0,0 +1,37 @@
+From 03c2661b1243cc529fc3d8cfa65073f1da420307 Mon Sep 17 00:00:00 2001
+From: Simon Hausmann <simon.hausmann@qt.io>
+Date: Thu, 22 Jun 2017 13:34:09 +0200
+Subject: [PATCH 1/1] Fix alignment issue on ARMv7
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
+commit: https://codereview.qt-project.org/#/c/198278/
+
+Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
+---
+ src/qml/compiler/qv4compiler.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/qml/compiler/qv4compiler.cpp b/src/qml/compiler/qv4compiler.cpp
+index e32749bbf7..c32e1685a0 100644
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
