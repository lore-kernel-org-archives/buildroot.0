From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 20:27:12 +0200
Subject: [Buildroot] [git commit] package/qt5base: fix libtool la file
 dependency_libs entries
Message-ID: <20190803182548.CF17688988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ad73bf5e6326f7a414ecc94dbac0c79f5d33b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  libtool: error: cannot find the library '' or unhandled argument '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so'

Add upstream suggested patch ([2]) to change la file dependency_libs entries
to -L<path> -l<library> version.

[1] http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994
[2] https://codereview.qt-project.org/c/qt/qtbase/+/269146

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...05-Fix-dependency_libs-entry-of-.la-files.patch | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch b/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
new file mode 100644
index 0000000000..5081d56b4b
--- /dev/null
+++ b/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
@@ -0,0 +1,75 @@
+From 23e437bb5cba5b13ee327c36d8199a49aad9a8da Mon Sep 17 00:00:00 2001
+From: Joerg Bornemann <joerg.bornemann@qt.io>
+Date: Wed, 31 Jul 2019 10:55:14 +0200
+Subject: [PATCH] Fix dependency_libs entry of .la files
+
+Libtool cannot cope with absolute paths in the dependency_libs entry.
+We split absolute paths into -L and -l here.
+
+Change-Id: I30bf11e490d1993d2a4d88c114e07bbae12def6d
+Fixes: QTBUG-76625
+
+Upstream: https://codereview.qt-project.org/c/qt/qtbase/+/269146
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ qmake/generators/unix/unixmake2.cpp | 36 +++++++++++++++++++++++++----
+ 1 file changed, 31 insertions(+), 5 deletions(-)
+
+diff --git a/qmake/generators/unix/unixmake2.cpp b/qmake/generators/unix/unixmake2.cpp
+index d9bcccf2e2..ddc3b063d4 100644
+--- a/qmake/generators/unix/unixmake2.cpp
++++ b/qmake/generators/unix/unixmake2.cpp
+@@ -1450,6 +1450,33 @@ UnixMakefileGenerator::libtoolFileName(bool fixify)
+ void
+ UnixMakefileGenerator::writeLibtoolFile()
+ {
++    auto fixAbsolutePaths
++            = [this](const ProStringList &libs)
++              {
++                  ProStringList result;
++                  for (auto lib : libs) {
++                      auto fi = fileInfo(lib.toQString());
++                      if (fi.isAbsolute()) {
++                          const QString libDirArg = "-L" + fi.path();
++                          if (!result.contains(libDirArg))
++                              result += libDirArg;
++                          QString namespec = fi.fileName();
++                          int dotPos = namespec.lastIndexOf('.');
++                          if (dotPos != -1 && namespec.startsWith("lib")) {
++                              namespec.truncate(dotPos);
++                              namespec.remove(0, 3);
++                          } else {
++                              namespec.prepend(':');
++                          }
++                          result += "-l" + namespec;
++                      } else {
++
++                          result += lib;
++                      }
++                  }
++                  return result;
++              };
++
+     QString fname = libtoolFileName(), lname = fname;
+     mkdir(fileInfo(fname).path());
+     int slsh = lname.lastIndexOf(Option::dir_sep);
+@@ -1488,12 +1515,11 @@ UnixMakefileGenerator::writeLibtoolFile()
+                          << ".a'\n\n";
+
+     t << "# Libraries that this one depends upon.\n";
++    static const ProKey libVars[] = { "LIBS", "QMAKE_LIBS" };
+     ProStringList libs;
+-    libs << "LIBS" << "QMAKE_LIBS";
+-    t << "dependency_libs='";
+-    for (ProStringList::ConstIterator it = libs.begin(); it != libs.end(); ++it)
+-        t << fixLibFlags((*it).toKey()).join(' ') << ' ';
+-    t << "'\n\n";
++    for (auto var : libVars)
++        libs += fixLibFlags(var);
++    t << "dependency_libs='" << fixAbsolutePaths(libs).join(' ') << "'\n\n";
+
+     t << "# Version information for " << lname << "\n";
+     int maj = project->first("VER_MAJ").toInt();
+--
+2.22.0
+
