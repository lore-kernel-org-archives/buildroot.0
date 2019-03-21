From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Mar 2019 20:07:56 +0100
Subject: [Buildroot] [PATCH v1] package/at-spi2-core: fix build with meson
 0.50.0
Message-ID: <20190321190756.32410-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch [1] to fix build with meson 0.50.0 (as suggested
by Thomas Petazzoni ).

Fixes [2]:

  atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.

[1] https://github.com/GNOME/at-spi2-core/commit/44a812ea51223d82f21a098a2d45fcc5c329ce7a.patch
[1] http://autobuild.buildroot.net/results/83250522c79b5749fc8236ba2b0e873a12747413

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - no need to apply the patch as the meson bump to 0.50.0 is reverted
    (see [3])

[3] https://git.buildroot.net/buildroot/commit/?id=c37b81af64dd8d6729325d8edbe633e6a186bb3d
---
 ...001-Fix-meson.build-for-meson-0.50.0.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch

diff --git a/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch b/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch
new file mode 100644
index 0000000000..53ca3e9e1a
--- /dev/null
+++ b/package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch
@@ -0,0 +1,35 @@
+From 3b154996a27ede1c94cbc590e2db3858389d18c2 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Tue, 12 Mar 2019 11:46:24 +0100
+Subject: [PATCH] Fix meson.build for meson 0.50.0.
+
+Since meson 0.50.0 it is not possible anymore to specify an
+absolute directory for subdir. To keep current functionality,
+use install_dir instead.
+
+atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream: https://github.com/GNOME/at-spi2-core/commit/44a812ea51223d82f21a098a2d45fcc5c329ce7a.patch
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ atspi/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atspi/meson.build b/atspi/meson.build
+index 17bfc45..2e44ffd 100644
+--- a/atspi/meson.build
++++ b/atspi/meson.build
+@@ -57,7 +57,7 @@ atspi_headers = [
+
+ atspi_includedir = join_paths(get_option('prefix'), get_option('includedir'), 'at-spi-2.0', 'atspi')
+
+-install_headers(atspi_headers, subdir: atspi_includedir)
++install_headers(atspi_headers, install_dir: atspi_includedir)
+
+ atspi_enums = gnome.mkenums('atspi-enum-types',
+                             sources: [ 'atspi-constants.h', 'atspi-types.h' ],
+--
+2.21.0
+
--
2.21.0
