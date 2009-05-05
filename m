From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 May 2009 09:29:16 +0200
Subject: [Buildroot] [PATCH] gcc-4.3.3: add a patch to link with the
	math lib to	 get copysignal (updated)
In-Reply-To: <4A0026240200007000014C65@gwia.alliedtelesyn.co.nz> (angus
	salkeld's message of "Tue\, 05 May 2009 11\:42\:28 +1200")
References: <4A0026240200007000014C65@gwia.alliedtelesyn.co.nz>
Message-ID: <87my9sgg8j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "angus" == angus salkeld <angus.salkeld@alliedtelesis.co.nz> writes:

 angus> I have just tried powerpc-603e and it has the same problem, so
 angus> I have altered the logic slightly.

 angus> Conditionally apply the following patch by Bernhard Reutner-Fischer which
 angus> solves a link error on powerpc when using a shared libgcc_s

.. and BR2_SOFT_FLOAT I guess? Without soft float it works fine here
(why would you not use the hardware FPU of the 603e)?

Bernhard, is this the most uptodate version of your patch?

 angus> See: http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
 angus> http://www.nabble.com/PPC-won't-build-with-soft-float-td22772110.html
 angus> ---
 angus>  .../powerpc-link-with-math-lib.patch.conditional   |  130 ++++++++++++++++++++
 angus>  toolchain/gcc/gcc-uclibc-4.x.mk                    |    5 +
 angus>  2 files changed, 135 insertions(+), 0 deletions(-)
 angus>  create mode 100644 toolchain/gcc/4.3.3/powerpc-link-with-math-lib.patch.conditional

 angus> diff --git a/toolchain/gcc/4.3.3/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.3.3/powerpc-link-with-math-lib.patch.conditional
 angus> new file mode 100644
 angus> index 0000000..7d6aa5e
 angus> --- /dev/null
 angus> +++ b/toolchain/gcc/4.3.3/powerpc-link-with-math-lib.patch.conditional
 angus> @@ -0,0 +1,130 @@
 angus> +See: http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
 angus> +Patch by: Bernhard Reutner-Fischer
 angus> +
 angus> +diff -rdup gcc-4.4.0.old/gcc/config/t-slibgcc-elf-ver gcc-4.4.0/gcc/config/t-slibgcc-elf-ver
 angus> +--- gcc-4.4.0.old/gcc/config/t-slibgcc-elf-ver	2005-10-31 18:03:08.000000000 +0100
 angus> ++++ gcc-4.4.0/gcc/config/t-slibgcc-elf-ver	2008-10-07 19:28:13.000000000 +0200
 angus> +@@ -9,7 +9,7 @@ SHLIB_MAP = @shlib_map_file@
 angus> + SHLIB_OBJS = @shlib_objs@
 angus> + SHLIB_DIR = @multilib_dir@
 angus> + SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
 angus> +-SHLIB_LC = -lc
 angus> ++SHLIB_LC = @libgcc_libm@ -lc
 angus> + 
 angus> + SHLIB_LINK = $(GCC_FOR_TARGET) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
 angus> + 	-Wl,--soname=$(SHLIB_SONAME) \
 angus> +diff -rdup gcc-4.4.0.old/libgcc/configure gcc-4.4.0/libgcc/configure
 angus> +--- gcc-4.4.0.old/libgcc/configure	2008-07-17 10:40:53.000000000 +0200
 angus> ++++ gcc-4.4.0/libgcc/configure	2008-10-07 19:40:48.000000000 +0200
 angus> +@@ -272,7 +272,7 @@ PACKAGE_STRING='GNU C Runtime Library 1.
 angus> + PACKAGE_BUGREPORT=''
 angus> + 
 angus> + ac_unique_file="static-object.mk"
 angus> +-ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
 angus> ++ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
 angus> + ac_subst_files=''
 angus> + ac_pwd=`pwd`
 angus> + 
 angus> +@@ -3522,6 +3522,39 @@ if test "$enable_tls $gcc_cv_have_cc_tls
 angus> + fi
 angus> + 
 angus> + 
 angus> ++# On powerpc libgcc_s references copysignl which is a libm function but
 angus> ++# glibc apparently also provides it via libc as opposed to uClibc where
 angus> ++# it lives in libm.
 angus> ++echo "$as_me:$LINENO: checking for library containing copysignl" >&5
 angus> ++echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
 angus> ++if test "${libgcc_cv_copysignl_lib+set}" = set; then
 angus> ++  echo $ECHO_N "(cached) $ECHO_C" >&6
 angus> ++else
 angus> ++
 angus> ++    echo '#include <features.h>' > conftest.c
 angus> ++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
 angus> ++    libgcc_cv_copysignl_lib="-lc"
 angus> ++    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
 angus> ++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
 angus> ++  (eval $ac_try) 2>&5
 angus> ++  ac_status=$?
 angus> ++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 angus> ++  (exit $ac_status); }; }
 angus> ++    then
 angus> ++	libgcc_cv_copysignl_lib="-lm"
 angus> ++    fi
 angus> ++    rm -f conftest.*
 angus> ++
 angus> ++fi
 angus> ++echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
 angus> ++echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
 angus> ++
 angus> ++case /${libgcc_cv_copysignl_lib}/ in
 angus> ++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
 angus> ++  *) LIBGCC_LIBM= ;;
 angus> ++esac
 angus> ++
 angus> ++
 angus> + # Conditionalize the makefile for this target machine.
 angus> + tmake_file_=
 angus> + for f in ${tmake_file}
 angus> +@@ -4242,6 +4275,7 @@ s, at enable_decimal_float@,$enable_decimal
 angus> + s, at fixed_point@,$fixed_point,;t t
 angus> + s, at vis_hide@,$vis_hide,;t t
 angus> + s, at set_have_cc_tls@,$set_have_cc_tls,;t t
 angus> ++s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
 angus> + s, at tmake_file@,$tmake_file,;t t
 angus> + s, at extra_parts@,$extra_parts,;t t
 angus> + s, at asm_hidden_op@,$asm_hidden_op,;t t
 angus> +diff -rdup gcc-4.4.0.old/libgcc/configure.ac gcc-4.4.0/libgcc/configure.ac
 angus> +--- gcc-4.4.0.old/libgcc/configure.ac	2008-07-17 10:40:53.000000000 +0200
 angus> ++++ gcc-4.4.0/libgcc/configure.ac	2008-10-07 19:34:48.000000000 +0200
 angus> +@@ -203,6 +203,27 @@ if test "$enable_tls $gcc_cv_have_cc_tls
 angus> + fi
 angus> + AC_SUBST(set_have_cc_tls)
 angus> + 
 angus> ++# On powerpc libgcc_s references copysignl which is a libm function but
 angus> ++# glibc apparently also provides it via libc as opposed to uClibc where
 angus> ++# it lives in libm.
 angus> ++AC_CACHE_CHECK([for library containing copysignl],
 angus> ++  libgcc_cv_copysignl_lib, [
 angus> ++    echo '#include <features.h>' > conftest.c
 angus> ++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
 angus> ++    libgcc_cv_copysignl_lib="-lc"
 angus> ++    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
 angus> ++    then
 angus> ++	libgcc_cv_copysignl_lib="-lm"
 angus> ++    fi
 angus> ++    rm -f conftest.*
 angus> ++  ])
 angus> ++
 angus> ++case /${libgcc_cv_copysignl_lib}/ in
 angus> ++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
 angus> ++  *) LIBGCC_LIBM= ;;
 angus> ++esac
 angus> ++AC_SUBST(LIBGCC_LIBM)
 angus> ++
 angus> + # Conditionalize the makefile for this target machine.
 angus> + tmake_file_=
 angus> + for f in ${tmake_file}
 angus> +diff -rdup gcc-4.4.0.old/libgcc/Makefile.in gcc-4.4.0/libgcc/Makefile.in
 angus> +--- gcc-4.4.0.old/libgcc/Makefile.in	2008-07-17 10:40:53.000000000 +0200
 angus> ++++ gcc-4.4.0/libgcc/Makefile.in	2008-10-07 19:28:13.000000000 +0200
 angus> +@@ -40,6 +40,7 @@ enable_shared = @enable_shared@
 angus> + decimal_float = @decimal_float@
 angus> + enable_decimal_float = @enable_decimal_float@
 angus> + fixed_point = @fixed_point@
 angus> ++LIBGCC_LIBM = @LIBGCC_LIBM@
 angus> + 
 angus> + host_noncanonical = @host_noncanonical@
 angus> + 
 angus> +@@ -786,9 +787,10 @@ libgcc_s$(SHLIB_EXT): $(libgcc-s-objects
 angus> + 		@multilib_dir@,$(MULTIDIR),$(subst \
 angus> + 		@shlib_objs@,$(objects),$(subst \
 angus> + 		@shlib_base_name@,libgcc_s,$(subst \
 angus> ++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
 angus> + 		@shlib_map_file@,$(mapfile),$(subst \
 angus> + 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
 angus> +-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
 angus> ++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
 angus> + 
 angus> + libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
 angus> + 	# @multilib_flags@ is still needed because this may use
 angus> +
 angus> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
 angus> index 4fe3fa5..6b27d63 100644
 angus> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
 angus> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
 angus> @@ -185,6 +185,11 @@ ifeq ("$(strip $(ARCH))","armeb")
 angus>  	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) arm-softfloat.patch.conditional
 angus>  endif
 angus>  endif
 angus> +ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 angus> +ifeq ("$(strip $(ARCH))","powerpc")
 angus> +	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
 angus> +endif
 angus> +endif
 angus>  	touch $@
 
 angus>  #############################################################
 angus> -- 
 angus> 1.5.6

-- 
Bye, Peter Korsgaard
