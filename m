From: Danijel Tudek <danijel.tudek@bylapis.com>
Date: Tue, 6 Sep 2016 16:25:22 +0200
Subject: [Buildroot] [Buildroot} [PATCH] Remove qt5base explicitlib patch
Message-ID: <CAAcXeukkVNMK3E21M_aZMEc2m5nCmC75e1co2acWdmN=7QtUCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After pulling the latest master, Qt5base can't be built anymore because the
patch 0007-build-with-explicitlib-after-all.patch seems to be applied
upstream (it stops with "already applied" error).

Simply removing this patch from the package solves the problem.

diff --git
a/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
b/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
deleted file mode 100644
index a878ba6..0000000
--- a/package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 523c7e3fd55c853dd424d57f28e225d57439cf89 Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
-Date: Thu, 3 Mar 2016 14:12:16 +0100
-Subject: [PATCH] build with explicitlib after all
-
-unlike speculated in 2fe363514, this is not a workaround at all: it
-causes that libraries' public link interfaces (LIBS) are exported in the
-first place. unlike with staticlib, this does not export LIBS_PRIVATE,
-so it wouldn't even be a particularly effective workaround for rpath
-brokenness anyway.
-
-the problem was pretty well hidden by the qt module system, which at the
-level of libraries is pretty redundant with the .prl file handling,
-which shows just how stupid the whole "design" is.
-
-unlike before, we now enable explicitlib for all libraries, not just qt
-modules - we enable create_prl for all of them as well, after all.
-
-an immediate effect of this change is that it fixes linking on RaspPI:
-the qtcore headers make the user code require linking libatomic, so we
-must add it to our public link interface.
-
-Task-number: QTBUG-51621
-Change-Id: I5742c88694db8e8a9b79d17222dc6df2b38e5ab2
-Reviewed-by: Joerg Bornemann <joerg.bornemann@theqtcompany.com>
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
-
-Upstream:
https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=commit;h=523c7e3fd55c853dd424d57f28e225d57439cf89
-Signed-off: Peter Seiderer <ps.report@gmx.net>
----
- mkspecs/features/qt_build_config.prf | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mkspecs/features/qt_build_config.prf
b/mkspecs/features/qt_build_config.prf
-index 518fd93..b3081b9 100644
---- a/mkspecs/features/qt_build_config.prf
-+++ b/mkspecs/features/qt_build_config.prf
-@@ -72,6 +72,10 @@ CONFIG += \
-     # However, testcases should be still built with exceptions.
-     exceptions_off testcase_exceptions
-
-+# Under Windows, this is neither necessary (transitive deps are
automatically
-+# resolved), nor functional (.res files end up in .prl files and break
things).
-+unix: CONFIG += explicitlib
-+
-
- defineTest(qtBuildPart) {
-     bp = $$eval($$upper($$section(_QMAKE_CONF_, /, -2, -2))_BUILD_PARTS)
---
-2.7.4
-


Regards,
Danijel Tudek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160906/6c6490dc/attachment.html>
