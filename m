From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 6 Aug 2007 16:24:54 -0700
Subject: [Buildroot] [buildroot 0001408]: Fail to build glib 2.12.9 (No
	iconv() implementation found in C library or libiconv)
Message-ID: <c5a684230ec703e95b4aebac6f80597d@busybox.net>
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
Last Modified:              08-06-2007 16:24 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-28-07 12:55  pavko          New Issue                                    
06-28-07 12:55  pavko          Status                   new => assigned     
06-28-07 12:55  pavko          Assigned To               => buildroot       
07-22-07 10:25  pavko          Note Added: 0002626                          
08-02-07 21:27  gururaj        Note Added: 0002649                          
08-06-07 16:24  gururaj        Note Added: 0002650                          
======================================================================
