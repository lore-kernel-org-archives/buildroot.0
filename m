From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:26:42 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-numpy: add
 reverse dependency on packages using python-numpy
Message-ID: <20190902164129.E3BDB8A432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a834e423c0b51ca5f2b798aa34570e25d952067f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Since commit 1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed[1] is merged, a
new build failure occurs when selecting packages which needs
python-numpy as dependency.

This fix a build issue[2] by adding the correct reverse dependencies
to the following packages :
- gnuradio (for python support)
- opencv3 (for python support)
- piglit
- python-matplotlib

So :
- adding to every listed packages
  `depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)`
  and add a comment to explain what happend.

[1] https://git.buildroot.net/buildroot/commit/?id=1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed
[2] http://autobuild.buildroot.org/results/b76/b76b6cf9602bcf5df69a7276762eab54cf74007b

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Damien DUVAL <damien.duval@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a546b87d5b8781b03f3ba5d311d61f4169ee899)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/Config.in | 4 ++++
 package/opencv3/Config.in  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 6d0669779f..80f6a1c535 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -66,11 +66,15 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	help
 	  Enable python component
 
+comment "python support needs glibc or musl"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 61405a7c64..c308cd4d87 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -157,11 +157,15 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
+comment "python support needs glibc or musl"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
 config BR2_PACKAGE_OPENCV3_LIB_SHAPE
 	bool "shape"
 	# opencv_core dependency is already enabled
