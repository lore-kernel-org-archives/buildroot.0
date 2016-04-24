From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:42:37 +0200
Subject: [Buildroot] [git commit] qt5base: fix sparc glibc libatomic link
	problem
Message-ID: <20160424214242.74D04801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6046c1c93a5c0d67ac7260cee671e75aa7a200cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  undefined reference to `__atomic_fetch_add_4'

Upstream patch from QTBUG-51621 ([2], [3]).

[1] http://autobuild.buildroot.net/results/8e7/8e7ff74abdd6274c257a928113e50f534a142650
[2] https://bugreports.qt.io/browse/QTBUG-51621
[3] https://codereview.qt-project.org/#/c/151273/3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0007-build-with-explicitlib-after-all.patch    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch b/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
new file mode 100644
index 0000000..a878ba6
--- /dev/null
+++ b/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
@@ -0,0 +1,51 @@
+From 523c7e3fd55c853dd424d57f28e225d57439cf89 Mon Sep 17 00:00:00 2001
+From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+Date: Thu, 3 Mar 2016 14:12:16 +0100
+Subject: [PATCH] build with explicitlib after all
+
+unlike speculated in 2fe363514, this is not a workaround at all: it
+causes that libraries' public link interfaces (LIBS) are exported in the
+first place. unlike with staticlib, this does not export LIBS_PRIVATE,
+so it wouldn't even be a particularly effective workaround for rpath
+brokenness anyway.
+
+the problem was pretty well hidden by the qt module system, which at the
+level of libraries is pretty redundant with the .prl file handling,
+which shows just how stupid the whole "design" is.
+
+unlike before, we now enable explicitlib for all libraries, not just qt
+modules - we enable create_prl for all of them as well, after all.
+
+an immediate effect of this change is that it fixes linking on RaspPI:
+the qtcore headers make the user code require linking libatomic, so we
+must add it to our public link interface.
+
+Task-number: QTBUG-51621
+Change-Id: I5742c88694db8e8a9b79d17222dc6df2b38e5ab2
+Reviewed-by: Joerg Bornemann <joerg.bornemann@theqtcompany.com>
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+
+Upstream: https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=commit;h=523c7e3fd55c853dd424d57f28e225d57439cf89
+Signed-off: Peter Seiderer <ps.report@gmx.net>
+---
+ mkspecs/features/qt_build_config.prf | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mkspecs/features/qt_build_config.prf b/mkspecs/features/qt_build_config.prf
+index 518fd93..b3081b9 100644
+--- a/mkspecs/features/qt_build_config.prf
++++ b/mkspecs/features/qt_build_config.prf
+@@ -72,6 +72,10 @@ CONFIG += \
+     # However, testcases should be still built with exceptions.
+     exceptions_off testcase_exceptions
+ 
++# Under Windows, this is neither necessary (transitive deps are automatically
++# resolved), nor functional (.res files end up in .prl files and break things).
++unix: CONFIG += explicitlib
++
+ 
+ defineTest(qtBuildPart) {
+     bp = $$eval($$upper($$section(_QMAKE_CONF_, /, -2, -2))_BUILD_PARTS)
+-- 
+2.7.4
+
