From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Sep 2007 13:17:42 -0700
Subject: [Buildroot] [buildroot 0001408]: Fail to build glib 2.12.9 (No
	iconv() implementation found in C library or libiconv)
Message-ID: <a0b7ab3e64015b281dd7b0e4462d409b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1408 
====================================================================== 
Reported By:                pavko
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1408
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-28-2007 12:55 PDT
Last Modified:              09-12-2007 13:17 PDT
====================================================================== 
Summary:                    Fail to build glib 2.12.9 (No iconv() implementation
found in C library or libiconv)
Description: 
uClibc has been build with locale suport, gcc 4.2.0, arch i686
also tried to compile newest 2.12.12 glib but without success
(error dump is for 2.12.12 but 2.12.9 is behaving exactly the same)
====================================================================== 

---------------------------------------------------------------------- 
 pavko - 07-22-07 10:25  
---------------------------------------------------------------------- 
Solution on maillist:
Hello,

This patch disables building of iconv binary in uclibc ( it's failed when
locale support is enabled).
In turn correct building of uclibc with locale support gives correct build
for glibc 2.12.9 - a bug was recently opened: 
 [buildroot 0001408]: Fail to build glib 2.12.9 (No iconv() implementation
found in C library or libiconv)

Actually it's just Assen Stoyanov's patch but made from root of buildroot
for suitable applying in svn for maintainer.

Without this patch glib build fails.

Best regards, Ivan

---

diff -urN buildroot.orig/toolchain/uClibc/uClibc.iconv.patch
buildroot.new/toolchain/uClibc/uClibc.iconv.patch
--- buildroot.orig/toolchain/uClibc/uClibc.iconv.patch	1970-01-01 03:00:00
+0300
+++ buildroot.new/toolchain/uClibc/uClibc.iconv.patch	2007-06-29 16:15:24
+0300
@@ -0,0 +1,22 @@
+--- uClibc-0.9.29-orig/utils/Makefile.in	2007-06-29 11:34:47.000000000
+0300
++++ uClibc-0.9.29/utils/Makefile.in	2007-06-29 11:33:03.000000000 +0300
+@@ -52,7 +52,8 @@
+ 
+ utils_ICONV_OBJ =
+ ifeq ($(UCLIBC_HAS_LOCALE),y)
+-utils_ICONV_OBJ := $(utils_OUT)/iconv
++# temporary disabled - compilation is broken!
++#utils_ICONV_OBJ := $(utils_OUT)/iconv
+ endif
+ 
+ utils_OBJ := $(patsubst %,$(utils_OUT)/%,$(utils_OBJ))
+@@ -85,7 +86,8 @@
+ 	$(INSTALL) -m 755 $(utils_OUT)/ldconfig
$(PREFIX)$(RUNTIME_PREFIX)sbin/ldconfig
+ endif
+ ifeq ($(UCLIBC_HAS_LOCALE),y)
+-	$(INSTALL) -m 755 $(utils_OUT)/iconv
$(PREFIX)$(RUNTIME_PREFIX)usr/bin/iconv
++	# temporary disabled - compilation is broken!
++	#$(INSTALL) -m 755 $(utils_OUT)/iconv
$(PREFIX)$(RUNTIME_PREFIX)usr/bin/iconv
+ endif
+ 
+ objclean-y += utils_clean

Works OK with iconv problem. But:

checking for perl... /usr/bin/perl
checking for iconv_open... yes
checking how to run the C preprocessor...
/home/pavko/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-cpp
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking whether we are using the GNU C Library 2.1 or newer... yes
checking Whether to cache iconv descriptors... no
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking for LC_MESSAGES... yes
checking libintl.h usability... no
checking libintl.h presence... no
checking for libintl.h... no
configure: error:
*** You must have either have gettext support in your C library, or use
the
*** GNU gettext library.
(http://www.gnu.org/software/gettext/gettext.html

gettext library has been built without any problems - but glib does not
see it. Header problem? 

---------------------------------------------------------------------- 
 gururaj - 08-02-07 21:27  
---------------------------------------------------------------------- 
@pavko 

  What i observed just now is that "make gettext" builds & installs
libintl.h in correct $(BUILD_DIR)/staging_dir/usr/include directory but
when making libglib2 it checks for uclibc build whcih removes libintl.h
from $(BUILD_DIR)/staging_dir/usr/include directory. Also if i just again
try make gettext for the 2nd time, the same happens as gettext also looks
for uclibc build & this removes the libintl.h

  In my Buiuldroot config i have enabled Support for WCHAR

 kindly, anyone help us resolve this.

Regards
Gururaja 

---------------------------------------------------------------------- 
 gururaj - 08-06-07 16:24  
---------------------------------------------------------------------- 
Hi All,  

 I have explained in detail abt this error @
http://www.nabble.com/Kindly-help-me-to-build-glib2-on-arm926-platform-tf4222891.html
but still seems no one is there to help/sove this. 

Regards
Gururaja 

---------------------------------------------------------------------- 
 pavko - 08-14-07 11:59  
---------------------------------------------------------------------- 
it's getting better but still there are some bugs in ?makefile?

make[5]: Entering directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9/glib'
/bin/bash ../libtool --mode=link
/home/pavko/buildroot_svn/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
 -g -O2 -Wall   -o libglib-2.0.la -rpath /lib  -version-info 1200:9:1200
-export-dynamic  -export-symbols-regex "^[^_].*" garray.lo gasyncqueue.lo
gatomic.lo gbacktrace.lo gbase64.lo gbookmarkfile.lo gcache.lo
gcompletion.lo gconvert.lo gdataset.lo gdate.lo gdir.lo gerror.lo
gfileutils.lo ghash.lo ghook.lo giochannel.lo gkeyfile.lo glist.lo
gmain.lo gmappedfile.lo gmarkup.lo gmem.lo gmessages.lo gnode.lo
goption.lo gpattern.lo gprimes.lo gqsort.lo gqueue.lo grel.lo grand.lo
gscanner.lo gshell.lo gslice.lo gslist.lo gstdio.lo gstrfuncs.lo
gstring.lo gthread.lo gthreadpool.lo gtimer.lo gtree.lo guniprop.lo
gutf8.lo gunibreak.lo gunicollate.lo gunidecomp.lo gutils.lo gprintf.lo
libcharset/libcharset.la gnulib/libgnulib.la giounix.lo gspawn.lo    
-lintl  
libtool: link: unable to infer tagged configuration
libtool: link: defaulting to `CC'
libtool: link: if this is not correct, specify a tag with `--tag'
rm -fr  .libs/libglib-2.0.exp
generating symbol list for `libglib-2.0.la'
/home/pavko/buildroot_svn/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm
 .libs/garray.o .libs/gasyncqueue.o .libs/gatomic.o .libs/gbacktrace.o
.libs/gbase64.o .libs/gbookmarkfile.o .libs/gcache.o .libs/gcompletion.o
.libs/gconvert.o .libs/gdataset.o .libs/gdate.o .libs/gdir.o
.libs/gerror.o .libs/gfileutils.o .libs/ghash.o .libs/ghook.o
.libs/giochannel.o .libs/gkeyfile.o .libs/glist.o .libs/gmain.o
.libs/gmappedfile.o .libs/gmarkup.o .libs/gmem.o .libs/gmessages.o
.libs/gnode.o .libs/goption.o .libs/gpattern.o .libs/gprimes.o
.libs/gqsort.o .libs/gqueue.o .libs/grel.o .libs/grand.o .libs/gscanner.o
.libs/gshell.o .libs/gslice.o .libs/gslist.o .libs/gstdio.o
.libs/gstrfuncs.o .libs/gstring.o .libs/gthread.o .libs/gthreadpool.o
.libs/gtimer.o .libs/gtree.o .libs/guniprop.o .libs/gutf8.o
.libs/gunibreak.o .libs/gunicollate.o .libs/gunidecomp.o .libs/gutils.o
.libs/gprintf.o .libs/giounix.o .libs/gspawn.o 
libcharset/.libs/libcharset.a gnulib/.libs/libgnulib.a | sed -n -e 's/^.*[
    ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[         ][     
]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' |
/home/pavko/buildroot_svn/toolchain_build_i686/bin/sed 's/.* //' | sort |
uniq > .libs/libglib-2.0.exp
/bin/grep -E -e "^[^_].*" ".libs/libglib-2.0.exp" >
".libs/libglib-2.0.expT"
mv -f ".libs/libglib-2.0.expT" ".libs/libglib-2.0.exp"
c++ -shared -nostdlib
/usr/lib/gcc/i486-linux-gnu/4.1.2/../../../../lib/crti.o
/usr/lib/gcc/i486-linux-gnu/4.1.2/crtbeginS.o  .libs/garray.o
.libs/gasyncqueue.o .libs/gatomic.o .libs/gbacktrace.o .libs/gbase64.o
.libs/gbookmarkfile.o .libs/gcache.o .libs/gcompletion.o .libs/gconvert.o
.libs/gdataset.o .libs/gdate.o .libs/gdir.o .libs/gerror.o
.libs/gfileutils.o .libs/ghash.o .libs/ghook.o .libs/giochannel.o
.libs/gkeyfile.o .libs/glist.o .libs/gmain.o .libs/gmappedfile.o
.libs/gmarkup.o .libs/gmem.o .libs/gmessages.o .libs/gnode.o
.libs/goption.o .libs/gpattern.o .libs/gprimes.o .libs/gqsort.o
.libs/gqueue.o .libs/grel.o .libs/grand.o .libs/gscanner.o .libs/gshell.o
.libs/gslice.o .libs/gslist.o .libs/gstdio.o .libs/gstrfuncs.o
.libs/gstring.o .libs/gthread.o .libs/gthreadpool.o .libs/gtimer.o
.libs/gtree.o .libs/guniprop.o .libs/gutf8.o .libs/gunibreak.o
.libs/gunicollate.o .libs/gunidecomp.o .libs/gutils.o .libs/gprintf.o
.libs/giounix.o .libs/gspawn.o -Wl,--whole-archive
libcharset/.libs/libcharset.a gnulib/.libs/libgnulib.a
-Wl,--no-whole-archive  -lintl -L/usr/lib/gcc/i486-linux-gnu/4.1.2
-L/usr/lib/gcc/i486-linux-gnu/4.1.2/../../../../lib -L/lib/../lib
-L/usr/lib/../lib -lstdc++ -lm -lc -lgcc_s
/usr/lib/gcc/i486-linux-gnu/4.1.2/crtendS.o
/usr/lib/gcc/i486-linux-gnu/4.1.2/../../../../lib/crtn.o  -Wl,-soname
-Wl,libglib-2.0.so.0 -Wl,-retain-symbols-file -Wl,.libs/libglib-2.0.exp -o
.libs/libglib-2.0.so.0.1200.9
/usr/bin/ld: cannot find -lintl
collect2: ld returned 1 exit status
make[5]: *** [libglib-2.0.la] Error 1
make[5]: Leaving directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9/glib'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9/glib'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9/glib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/pavko/buildroot_svn/build_i686/glib-2.12.9'
make: ***
[/home/pavko/buildroot_svn/build_i686/glib-2.12.9/glib/.libs/libglib-2.0.a]
Error 2 

---------------------------------------------------------------------- 
 vanokuten - 09-09-07 10:00  
---------------------------------------------------------------------- 
Some summary r19807:

1) 

checking for iconv_open... no
checking for libiconv_open in -liconv... no
checking for iconv_open in -liconv... no
configure: error: *** No iconv() implementation found in C library or
libiconv

This error happens when using default uclibc config, also it's reproduced
when
using BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29-wchar.config" with
 not clean toolchain and build directories. If remove, for example,
build_arm and toolchain_build_arm and rebuild - this error is gone.

2) From pavko's log:
...

libtool: link: unable to infer tagged configuration
libtool: link: defaulting to `CC'
libtool: link: if this is not correct, specify a tag with `--tag'

...

/usr/bin/ld: cannot find -lintl
collect2: ld returned 1 exit status
make[5]: *** [libglib-2.0.la] Error 1

-----------

I have similar error but for arm arch:
...
libtool: compile: unable to infer tagged configuration
libtool: compile: defaulting to `CC'
libtool: compile: if this is not correct, specify a tag with `--tag'
...
 gfortran -shared  .libs/garray.o .libs/gasyncqueue.o .libs/gatomic.o
.libs/gbacktrace.o .libs/gbase64.o .libs/gbookmarkfile.o .libs/gcache.o
.libs/gcompletion.o .libs/gconvert.o .libs/gdataset.o .libs/gdate.o
.libs/gdir.o .libs/gerror.o .libs/gfileutils.o .libs/ghash.o .libs/ghook.o
.libs/giochannel.o .libs/gkeyfile.o .libs/glist.o .libs/gmain.o
.libs/gmappedfile.o .libs/gmarkup.o .libs/gmem.o .libs/gmessages.o
.libs/gnode.o .libs/goption.o .libs/gpattern.o .libs/gprimes.o
.libs/gqsort.o .libs/gqueue.o .libs/grel.o .libs/grand.o .libs/gscanner.o
.libs/gshell.o .libs/gslice.o .libs/gslist.o .libs/gstdio.o
.libs/gstrfuncs.o .libs/gstring.o .libs/gthread.o .libs/gthreadpool.o
.libs/gtimer.o .libs/gtree.o .libs/guniprop.o .libs/gutf8.o
.libs/gunibreak.o .libs/gunicollate.o .libs/gunidecomp.o .libs/gutils.o
.libs/gprintf.o .libs/giounix.o .libs/gspawn.o -Wl,--whole-archive
libcharset/.libs/libcharset.a gnulib/.libs/libgnulib.a
-Wl,--no-whole-archive  -lintl  -Wl,-soname -Wl,libglib-2.0.so.0
-Wl,-version-script -Wl,.libs/libglib-2.0.ver -o
.libs/libglib-2.0.so.0.1200.9
/usr/bin/ld: .libs/garray.o: Relocations in generic ELF (EM: 40)
.libs/garray.o: could not read symbols: File in wrong format
collect2: ld returned 1 exit status

-------

Buildroot trying to use system-wide compiler&linker - thus resulting in
"File in wrong format" or "/usr/bin/ld: cannot find -lintl" for x86 arch.

Reassuring this via:

grep ^CC= libtool
CC="/buildroot.orig/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os
-pipe  -I/buildroot.orig/build_arm/staging_dir/usr/include
-I/buildroot.orig/build_arm/staging_dir/include
--sysroot=/buildroot.orig/build_arm/staging_dir/ -isysroot
/buildroot.orig/build_arm/staging_dir -mtune=arm920t"
CC="c++"
CC="gfortran"

So it catched my system-wide c++ and gfortran. Let's prevent this:

Index: package/libglib2/libglib2.mk
===================================================================
--- package/libglib2/libglib2.mk        (revision 19807)
+++ package/libglib2/libglib2.mk        (working copy)
@@ -83,6 +83,8 @@
                ac_use_included_regex=no \
                gl_cv_c_restrict=no \
                ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+               ac_cv_prog_F77=no \
+               ac_cv_prog_CXX=no \
                ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \

--------

rebuild and check configuration tags:

grep ^CC= libtool
CC="/buildroot.orig/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os
-pipe  -I/buildroot.orig/build_arm/staging_dir/usr/include
-I/buildroot.orig/build_arm/staging_dir/include
--sysroot=/buildroot.orig/build_arm/staging_dir/ -isysroot
/buildroot.orig/build_arm/staging_dir -mtune=arm920t"

and now glib is correctly built.

Thanks for attention!

 

---------------------------------------------------------------------- 
 vanokuten - 09-09-07 10:26  
---------------------------------------------------------------------- 
The same problem with atk:
 atk-1.9.1]# grep ^CC= libtool
CC="/buildroot.orig/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os
-pipe  -I/buildroot.orig/build_arm/staging_dir/usr/include
-I/buildroot.orig/build_arm/staging_dir/include
--sysroot=/buildroot.orig/build_arm/staging_dir/ -isysroot
/buildroot.orig/build_arm/staging_dir -mtune=arm920t"
CC="g++"
CC="f95"

-----------
f95 -shared  .libs/atkaction.o .libs/atkcomponent.o .libs/atkdocument.o
.libs/atkeditabletext.o .libs/atkgobjectaccessible.o .libs/atkhyperlink.o
.libs/atkhypertext.o .libs/atkimage.o .libs/atknoopobject.o
.libs/atknoopobjectfactory.o .libs/atkobject.o .libs/atkobjectfactory.o
.libs/atkregistry.o .libs/atkrelation.o .libs/atkrelationset.o
.libs/atkselection.o .libs/atkstate.o .libs/atkstateset.o
.libs/atkstreamablecontent.o .libs/atktable.o .libs/atktext.o

...

/usr/bin/ld: .libs/atkaction.o: Relocations in generic ELF (EM: 40)
.libs/atkaction.o: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[4]: *** [libatk-1.0.la] Error 1 

---------------------------------------------------------------------- 
 pavko - 09-12-07 13:17  
---------------------------------------------------------------------- 
error:
/bin/bash: line 2: /usr/bin/glib-genmarshal: No such file or directory

solution:
You must either build glib on host system or install package
libglib2.0-dev (ubuntu, debian). 

reason:
During compilation glib-genmarshal is built and then used to generate "C
code marshallers for callback functions of the GClosure mechanism in the
GObject sublibrary of GLib".

suggestion for fix:
So either glib-genmarshal should be built by HOST-CC or BUILDROOT should
check wheter glib-genmarshal is present and if necessary suggest
installation of libglib2.0-dev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-28-07 12:55  pavko          New Issue                                    
06-28-07 12:55  pavko          Status                   new => assigned     
06-28-07 12:55  pavko          Assigned To               => buildroot       
07-22-07 10:25  pavko          Note Added: 0002626                          
08-02-07 21:27  gururaj        Note Added: 0002649                          
08-06-07 16:24  gururaj        Note Added: 0002650                          
08-14-07 11:59  pavko          Note Added: 0002662                          
09-09-07 10:00  vanokuten      Note Added: 0002736                          
09-09-07 10:00  vanokuten      Note Edited: 0002736                         
09-09-07 10:05  vanokuten      File Added: glib2-tagged-configuration-fix.patch 
                  
09-09-07 10:26  vanokuten      Note Added: 0002737                          
09-09-07 10:35  vanokuten      File Added:
glib2-atk-tagged-configuration-fix.patch                    
09-12-07 13:17  pavko          Note Added: 0002738                          
======================================================================
