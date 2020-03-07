From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 22:05:58 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/imagemagick:
 explicitly disable opencl
Message-ID: <20200307210640.B2AAF8FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cc17126f41c1fe43a9b99b1846f875cc6d12577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Some packages installs libOpenCL without declaring
BR2_PACKAGE_PROVIDES_LIBOPENCL (e.g.  imx-gpu-viv).  ImageMagick will detect
the library and will require libtool.  Since libtool is not in dependencies,
build might fail.

To prevent that situation, explicitly disable opencl support for target and host.

Signed-off-by: Julien Olivain <juju@cotds.org>
[Peter: drop unneeded ax_cv_check_cl_libcl=no]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9056908e93daae5af08a123e0bc05072c6e6c58e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0bac0b4fc3..eaa291a1bd 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -22,6 +22,7 @@ IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 
 IMAGEMAGICK_CONF_OPTS = \
 	--program-transform-name='s,,,' \
+	--disable-opencl \
 	--disable-openmp \
 	--without-djvu \
 	--without-dps \
@@ -152,6 +153,7 @@ IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
 HOST_IMAGEMAGICK_CONF_OPTS = \
+	--disable-opencl \
 	--disable-openmp \
 	--without-djvu \
 	--without-dps \
