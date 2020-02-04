From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 22:53:22 +0100
Subject: [Buildroot] [git commit] package/imagemagick: fix configure error
 with --disable-opencl in setups without libltdl
Message-ID: <20200204214312.F33EE8B823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9591660a09c33058805f146790f4731df57925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d9a/d9a84b642357f758c3f84270fb9a109abd7e2684/

configure.ac contains a test using $ax_cv_check_cl_libcl:

if test "$build_modules" != 'no' || test "X$ax_cv_check_cl_libcl" != Xno; then
  AC_MSG_RESULT([-------------------------------------------------------------])
  AC_MSG_CHECKING([for libltdl])

But ax_cv_check_cl_libcl is only assigned a value (yes/no) if
--disable-opencl is NOT passed, as the assignment logic is inside a
conditional:

AC_ARG_ENABLE([opencl],
    [AC_HELP_STRING([--disable-opencl],
                    [do not use OpenCL])],
    [disable_opencl=$enableval],
    [disable_opencl='yes'])

if test "$disable_opencl" = 'yes'; then
  ..
  AC_CACHE_CHECK([for OpenCL library], [ax_cv_check_cl_libcl],

So configure errors out if --disable-opencl is passed on setups where
libltdl isn't available:

checking if libltdl package is complete... no
configure: error: in `/home/naourr/work/instance-0/output-1/build/imagemagick-7.0.8-59':
configure: error: libltdl is required for modules and OpenCL builds

As a workaround, explictly set ax_cv_check_cl_libcl=no to skip this
conditional.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/imagemagick/imagemagick.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index eaa291a1bd..5ef04973a6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -18,7 +18,9 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
 endif
 
-IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
+IMAGEMAGICK_CONF_ENV = \
+	ac_cv_sys_file_offset_bits=64 \
+	ax_cv_check_cl_libcl=no
 
 IMAGEMAGICK_CONF_OPTS = \
 	--program-transform-name='s,,,' \
@@ -179,7 +181,9 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--with-zlib
 
 # uses clock_gettime, which was provided by librt in glibc < 2.17
-HOST_IMAGEMAGICK_CONF_ENV = LIBS="-lrt"
+HOST_IMAGEMAGICK_CONF_ENV = \
+	LIBS="-lrt" \
+	ax_cv_check_cl_libcl=no
 
 HOST_IMAGEMAGICK_DEPENDENCIES = \
 	host-libjpeg \
