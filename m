From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Sat, 3 Jan 2015 02:02:17 +0000
Subject: [Buildroot] Newbie: hdf5 package build error:
 /lib/ld64-uClibc.so.0: bad ELF interpreter: No such file or directory
Message-ID: <05f72d28c20a415880148126c8124951@exch13-mail06.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, and all

I am still working on a new package  "hdf5

I have made it to the compile stage but have a few problems:
Thanks, Yann for helping me with configure stage :)

During the compile stage I encountered the following error:
********************************************************************************************************************************
make[1]: Entering directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14'
Making all in src
make[2]: Entering directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/src'
/usr/bin/make  all-am
make[3]: Entering directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/src'
LD_LIBRARY_PATH="$LD_LIBRARY_PATH`echo  |                  \
        sed -e 's/-L/:/g' -e 's/ //g'`"                               \
 ./H5make_libsettings > H5lib_settings.c  ||                               \
    (test $HDF5_Make_Ignore && echo "*** Error ignored") ||          \
    (rm -f H5lib_settings.c ; exit 1)
LD_LIBRARY_PATH="$LD_LIBRARY_PATH`echo  |                  \
        sed -e 's/-L/:/g' -e 's/ //g'`"                               \
 ./H5detect > H5Tinit.c  ||                               \
    (test $HDF5_Make_Ignore && echo "*** Error ignored") ||          \
    (rm -f H5Tinit.c ; exit 1)
/bin/sh: ./H5make_libsettings: /lib/ld64-uClibc.so.0: bad ELF interpreter: No such file or directory
make[3]: *** [H5lib_settings.c] Error 1
make[3]: *** Waiting for unfinished jobs....
Makefile:1682: recipe for target 'H5lib_settings.c' failed
/bin/sh: ./H5detect: /lib/ld64-uClibc.so.0: bad ELF interpreter: No such file or directory
make[3]: *** [H5Tinit.c] Error 1
Makefile:1670: recipe for target 'H5Tinit.c' failed
make[2]: *** [all] Error 2
make[3]: Leaving directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/src'
Makefile:850: recipe for target 'all' failed
make[2]: Leaving directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/src'
make[1]: *** [all-recursive] Error 1
make: *** [/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_built] Error 2
Makefile:586: recipe for target 'all-recursive' failed
make[1]: Leaving directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14'
package/pkg-generic.mk:182: recipe for target '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_built' failed
[ernesto at localhost buildroot-uclibc-x86_64]$
**********************************************************************************************************************************************************************




By the way, I needed to add   "-D_GNU_SOURCE"  to take care of another error regarding  ":O_DIRECT"
*****************************************************************************************************************************************************
H5FDdirect.c: In function 'H5FD_direct_open':
H5FDdirect.c:492:16: error: 'O_DIRECT' undeclared (first use in this function)
     o_flags |= O_DIRECT;
                ^
H5FDdirect.c:492:16: note: each undeclared identifier is reported only once for each function it appears in
Makefile:1226: recipe for target 'H5FDdirect.lo' failed
make[3]: *** [H5FDdirect.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/src'
Makefile:850: recipe for target 'all' failed
*******************************************************************************************************************************

But  " O_DIRECT" is located in the following:
/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/staging/usr/include/bits
fcntl.h:# define O_DIRECT        040000 /* Direct disk access.  */

So, I added   "-D_GNU_SOURCE"  to CFLAGS

My  "package/hdf5/hdf5.mk"  is below:
################################################################################
#
# hdf5
#
################################################################################

HDF5_VERSION = 1.8.14
HDF5_SITE = http://www.hdfgroup.org/ftp/HDF5/current/src
HDF5_LICENSE = hdf5 license
HDF5_LICENSE_FILES = COPYING
HDF5_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
HDF5_INSTALL_STAGING = YES

#HDF5_AUTORECONF = YES
#HDF5_DEPENDENCIES += zlib
#HDF5_CONF_ENV = hdf5_cv_have_lfs=$(if $(BR2_LARGEFILE),yes,no)

#HDF5_CONF_ENV += ac_cv_func_gettimeofday=$(if $(BR2_LARGEFILE),yes)
HDF5_CONF_ENV = hdf5_cv_have_lfs=yes \
        hdf5_cv_gettimeofday_tz=yes \
        hdf5_cv_szlib_can_encode=yes \
        hdf5_cv_vsnprintf_works=yes \
        hdf5_cv_printf_ll=ll \
        hdf5_cv_system_scope_threads=yes \
        hdf5_cv_direct_io=yes \
        hdf5_cv_ldouble_to_integer_works=yes \
        hdf5_cv_ulong_to_float_accurate=yes \
        hdf5_cv_ulong_to_fp_bottom_bit_accurate=yes \
        hdf5_cv_fp_to_ullong_accurate=yes \
        hdf5_cv_fp_to_ullong_right_maximum=yes \
        hdf5_cv_ldouble_to_uint_accurate=yes \
        hdf5_cv_fp_to_ullong_right_maximum=yes \
        hdf5_cv_ldouble_to_uint_accurate=yes \
        hdf5_cv_ullong_to_ldouble_precision=yes \
        hdf5_cv_fp_to_integer_overflow_works=yes \
        hdf5_cv_ldouble_to_long_special=no \
        hdf5_cv_long_to_ldouble_special=no \
        hdf5_cv_ldouble_to_llong_accurate=yes \
        hdf5_cv_llong_to_ldouble_correct=yes

HDF5_CONF_OPTS += --enable-threadsafe

HDF5_CONF_ENV += \
   CFLAGS="-D_GNU_SOURCE" \
   CPPFLAGS="-D_GNU_SOURCE"

$(eval $(autotools-package))


Cheers.
Ernesto
