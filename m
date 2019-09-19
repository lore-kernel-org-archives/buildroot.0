From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:44:25 +0200
Subject: [Buildroot] [git commit] package/libglib2: fix building on older
 distributions
Message-ID: <20190919203931.E52288EB77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf023aaf103a41e1de0d598b0789483559d8c769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When updating to libglib2 2.62.0, the file 0002-add-option-to-build-tests.patch
had to be refactored to work with the new build_tests checks. In the process of
refactoring, a missing check was overlooked in glib/meson.build causing
distributions with older versions of objcopy to fail because the older version
does not contain the --add-symbol argument.

Adding the check for the build_tests argument fixes the issue.

Fixes:
http://autobuild.buildroot.net/results/dcc2352a036aba9650eae8abaaa23819fc67332d

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libglib2/0002-add-option-to-build-tests.patch  | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0002-add-option-to-build-tests.patch b/package/libglib2/0002-add-option-to-build-tests.patch
index 3b7d6753ca..5caaaff6b2 100644
--- a/package/libglib2/0002-add-option-to-build-tests.patch
+++ b/package/libglib2/0002-add-option-to-build-tests.patch
@@ -1,6 +1,6 @@
-From 3a137f52869fdbc7050d606bfba0e5b1e41bd8e6 Mon Sep 17 00:00:00 2001
+From cdccbc6ec36243463613cb32d7058c26c3c51e16 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
-Date: Mon, 16 Sep 2019 10:08:52 -0700
+Date: Wed, 18 Sep 2019 09:50:00 -0700
 Subject: [PATCH] add option to build tests.
 
 Upstream won't build tests when cross-compiling. However; this means still
@@ -15,11 +15,12 @@ building any tests, even when building the host variant.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- gio/meson.build     | 1 -
- gobject/meson.build | 1 -
- meson.build         | 2 +-
- meson_options.txt   | 5 +++++
- 4 files changed, 6 insertions(+), 3 deletions(-)
+ gio/meson.build       |  1 -
+ glib/meson.build      |  3 +-
+ gobject/meson.build   |  1 -
+ meson.build           |  2 +-
+ meson_options.txt     |  5 +++++
+ 5 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
 index 9a9e621..6adc014 100644
@@ -33,6 +34,20 @@ index 9a9e621..6adc014 100644
  if build_tests
      subdir('tests')
  endif
+diff --git a/glib/meson.build b/glib/meson.build
+index 91a48f1..230d562 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -458,8 +458,7 @@ if enable_systemtap
+   )
+ endif
+ 
+-# Don???t build the tests unless we can run them (either natively or in an exe wrapper)
+-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++build_tests = get_option('tests')
+ if build_tests
+   subdir('tests')
+ endif
 diff --git a/gobject/meson.build b/gobject/meson.build
 index c7805c5..fb5874d 100644
 --- a/gobject/meson.build
