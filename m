From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 22:06:03 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/imagemagick:
 explicitly disable opencl
Message-ID: <20200307210651.850238FC7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f31498587a4b0b6d7f8efab2b63d8f8041bab091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
index a0c91f9183..d85682b416 100644
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
