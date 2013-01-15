From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 22:57:40 +0100
Subject: [Buildroot] [PATCH 21/33] rrdtool: add python binding support
In-Reply-To: <1353543503-8952-22-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:18:11 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-22-git-send-email-s.martin49@gmail.com>
Message-ID: <871udmkt2j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I was about to commit this, but it doesn't work here. I'm doing an ARM
build but get:

building 'rrdtoolmodule' extension
creating build
creating build/temp.linux-x86_64-2.7
/usr/bin/gcc -pthread -fno-strict-aliasing -O2 -I/home/peko/source/buildroot/testrrd/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I../../src -I/home/peko/source/buildroot/testrrd/host/usr/include/python2.7 -c rrdtoolmodule.c -o build/temp.linux-x86_64-2.7/rrdtoolmodule.o
rrdtoolmodule.c: In function ?PyRRD_info?:
rrdtoolmodule.c:450:9: warning: implicit declaration of function ?dst_conv? [-Wimplicit-function-declaration]
creating build/lib.linux-x86_64-2.7
/usr/bin/gcc -pthread -shared -L/home/peko/source/buildroot/testrrd/host/lib -L/home/peko/source/buildroot/testrrd/host/usr/lib -Wl,-rpath,/home/peko/source/buildroot/testrrd/host/usr/lib build/temp.linux-x86_64-2.7/rrdtoolmodule.o -L../../src/.libs -L/home/peko/source/buildroot/testrrd/host/usr/lib -Wl,-R/usr/lib -lrrd -lpython2.7 -o build/lib.linux-x86_64-2.7/rrdtoolmodule.so
/usr/bin/ld: skipping incompatible ../../src/.libs/librrd.so when searching for -lrrd
/usr/bin/ld: skipping incompatible ../../src/.libs/librrd.a when searching for -lrrd
/usr/bin/ld: cannot find -lrrd
collect2: error: ld returned 1 exit status

It looks like it's building for the host instead of for the target. Any
ideas?


 Samuel> ---
 Samuel>  package/rrdtool/Config.in                         |  8 +++++++
 Samuel>  package/rrdtool/rrdtool-fix-python-includes.patch | 29 +++++++++++++++++++++++
 Samuel>  package/rrdtool/rrdtool.mk                        | 19 +++++++++++++--
 Samuel>  3 files changed, 54 insertions(+), 2 deletions(-)
 Samuel>  create mode 100644 package/rrdtool/rrdtool-fix-python-includes.patch

 Samuel> diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
 Samuel> index d315b57..ed3f71e 100644
 Samuel> --- a/package/rrdtool/Config.in
 Samuel> +++ b/package/rrdtool/Config.in
 Samuel> @@ -11,5 +11,13 @@ config BR2_PACKAGE_RRDTOOL
 
 Samuel>  	  http://oss.oetiker.ch/rrdtool/
 
 Samuel> +if BR2_PACKAGE_RRDTOOL
 Samuel> +
 Samuel> +config BR2_PACKAGE_RRDTOOL_PYTHON
 Samuel> +	bool "Python bindings"
 Samuel> +	depends on BR2_PACKAGE_PYTHON
 Samuel> +
 Samuel> +endif
 Samuel> +
 Samuel>  comment "rrdtool requires a toolchain with WCHAR support"
 Samuel>  	depends on !BR2_USE_WCHAR
 Samuel> diff --git a/package/rrdtool/rrdtool-fix-python-includes.patch b/package/rrdtool/rrdtool-fix-python-includes.patch
 Samuel> new file mode 100644
 Samuel> index 0000000..07ff3df
 Samuel> --- /dev/null
 Samuel> +++ b/package/rrdtool/rrdtool-fix-python-includes.patch
 Samuel> @@ -0,0 +1,29 @@
 Samuel> +Allow to override the python include directories.
 Samuel> +When cross-compiling python extensions, python headers must be taken from the
 Samuel> +staging directory, not the host one.
 Samuel> +
 Samuel> +This patch avoids to run into some weird, ununderstable error about LONG_BIT
 Samuel> +definition, especially when the build and the target machine have different
 Samuel> +bitwises.
 Samuel> +
 Samuel> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> +
 Samuel> +--- rrdtool-1.2.30.orig/acinclude.m4	2012-11-17 11:33:40.194321803 +0100
 Samuel> ++++ rrdtool-1.2.30/acinclude.m4	2012-11-17 12:18:12.490326127 +0100
 Samuel> +@@ -467,9 +467,13 @@ AC_MSG_CHECKING(for headers required to
 Samuel> + dnl deduce PYTHON_INCLUDES
 Samuel> + py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
 Samuel> + py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
 Samuel> +-PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
 Samuel> +-if test "$py_prefix" != "$py_exec_prefix"; then
 Samuel> +-  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
 Samuel> ++if test "x$am_cv_python_includes" = "x" ; then
 Samuel> ++  PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
 Samuel> ++  if test "$py_prefix" != "$py_exec_prefix"; then
 Samuel> ++    PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
 Samuel> ++  fi
 Samuel> ++else
 Samuel> ++  PYTHON_INCLUDES="-I${am_cv_python_includes}"
 Samuel> + fi
 Samuel> + AC_SUBST(PYTHON_INCLUDES)
 Samuel> + dnl check if the headers exist:
 Samuel> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
 Samuel> index 7521aba..8799a85 100644
 Samuel> --- a/package/rrdtool/rrdtool.mk
 Samuel> +++ b/package/rrdtool/rrdtool.mk
 Samuel> @@ -11,8 +11,23 @@ RRDTOOL_AUTORECONF = YES
 Samuel>  RRDTOOL_INSTALL_STAGING = YES
 Samuel>  RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 Samuel>  			ac_cv_func_mmap_fixed_mapped=yes
 Samuel> -RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
 Samuel> -			--disable-tcl --program-transform-name=''
 Samuel> +RRDTOOL_CONF_OPT = --program-transform-name='' \
 Samuel> +			--disable-perl \
 Samuel> +			--disable-ruby \
 Samuel> +			--disable-tcl \
 Samuel> +
 Samuel> +ifneq ($(BR2_PACKAGE_RRDTOOL_PYTHON),)
 Samuel> +RRDTOOL_CONF_OPT += --enable-python
 Samuel> +RRDTOOL_CONF_ENV += \
 Samuel> +	am_cv_pathless_PYTHON=python \
 Samuel> +	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
 Samuel> +	am_cv_python_platform=linux2 \
 Samuel> +	am_cv_python_includes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 Samuel> +RRDTOOL_DEPENDENCIES += python
 Samuel> +else
 Samuel> +RRDTOOL_CONF_OPT += --disable-python
 Samuel> +endif
 Samuel> +
 Samuel>  RRDTOOL_MAKE = $(MAKE1)
 
 Samuel>  define RRDTOOL_REMOVE_EXAMPLES
 Samuel> -- 
 Samuel> 1.8.0

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
