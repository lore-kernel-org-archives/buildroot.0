From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:51:14 +0100
Subject: [Buildroot] [PATCH] package/imagemagick: fix configure error
 with --disable-opencl in setups without libltdl
In-Reply-To: <20200204212910.13935-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Feb 2020 22:29:09 +0100")
References: <20200204212910.13935-1-peter@korsgaard.com>
Message-ID: <87k13sorwd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d9a/d9a84b642357f758c3f84270fb9a109abd7e2684/

 > configure.ac contains a test using $ax_cv_check_cl_libcl:

 > if test "$build_modules" != 'no' || test "X$ax_cv_check_cl_libcl" != Xno; then
 >   AC_MSG_RESULT([-------------------------------------------------------------])
 >   AC_MSG_CHECKING([for libltdl])

 > But ax_cv_check_cl_libcl is only assigned a value (yes/no) if
 > --disable-opencl is NOT passed, as the assignment logic is inside a
 > conditional:

 > AC_ARG_ENABLE([opencl],
 >     [AC_HELP_STRING([--disable-opencl],
 >                     [do not use OpenCL])],
 >     [disable_opencl=$enableval],
 >     [disable_opencl='yes'])

 > if test "$disable_opencl" = 'yes'; then
 >   ..
 >   AC_CACHE_CHECK([for OpenCL library], [ax_cv_check_cl_libcl],

 > So configure errors out if --disable-opencl is passed on setups where
 > libltdl isn't available:

 > checking if libltdl package is complete... no
 > configure: error: in `/home/naourr/work/instance-0/output-1/build/imagemagick-7.0.8-59':
 > configure: error: libltdl is required for modules and OpenCL builds

 > As a workaround, explictly set ax_cv_check_cl_libcl=no to skip this
 > conditional.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
