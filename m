From: Miguel Angel Alvarez <ma.alvarez@ziv.es>
Date: Mon, 11 Sep 2006 18:12:41 +0200
Subject: [Buildroot] buildroot patches for gcc-4.2
Message-ID: <45058AF9.7010805@ziv.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Due to problems with gcc 4.1.1 release with my m68k architecture, I am 
trying to build up a toolchain based on uclibc and the source code in 
the svn trunk of gcc.

I have also added the patches of buildroot for gcc-4.2, but when I try 
to compile gcc I obtain the following.

/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/./gcc/xgcc 
-shared-libgcc 
-B/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/./gcc 
-nostdinc++ 
-L/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/src 
-L/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/src/.libs 
-B/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/stage/m68k-linux-uclibc/bin/ 
-B/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/stage/m68k-linux-uclibc/lib/ 
-isystem 
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/stage/m68k-linux-uclibc/include 
-isystem 
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/stage/m68k-linux-uclibc/sys-include 
-I/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/include/m68k-linux-uclibc 
-I/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/include 
-I/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot/libstdc++-v3/libsupc++ 
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual 
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -g 
-Os -c 
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot/libstdc++-v3/src/codecvt.cc  
-fPIC -DPIC -o .libs/codecvt.o
In file included from 
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/include/locale:46, 

                from 
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot/libstdc++-v3/src/codecvt.cc:30: 

/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/include/bits/locale_facets.tcc: 
In member function 'virtual _OutIter std::money_put<_CharT, 
_OutIter>::do_put(_OutIter, bool, std::ios_base&, _CharT, long double) 
const':
/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/include/bits/locale_facets.tcc:1805: 
error: no matching function for call to '__convert_from_v(int*&, char*&, 
int, const char [6], int, long double&)'
make[5]: *** [codecvt.lo] Error 1
make[5]: se sale del directorio 
`/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3/src' 

make[4]: *** [all-recursive] Error 1
make[4]: se sale del directorio 
`/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3' 

make[3]: *** [all] Error 2
make[3]: se sale del directorio 
`/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/m68k-linux-uclibc/libstdc++-v3' 

make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: se sale del directorio 
`/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final' 

make[1]: *** [all] Error 2
make[1]: se sale del directorio 
`/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final' 

make: *** 
[/home/mac/uSEL/trunk/output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot-final/.compiled] 
Error 2
mac at mac2:~/uSEL/trunk$ gedit 
output/board-3tn0339-uclibc/toolchain/gcc-4.2.0-snapshot/libstdc++-v3/src/codecvt.cc 
&
[1] 25690

I suppose that the problem is that __convert_from_v has changed its API 
in commit 114591 of gcc, but the patch of buildroot does not reflect this.

I have made a complementary patch to 200-uclibc-locale.patch.

It seems to work, but I would appreciate if you check it.

diff -urP gcc-4.2.0-snapshot_patched/libstdc++-v3/config/locale/uclibc/c_locale.h gcc-4.2.0-snapshot/libstdc++-v3/config/locale/uclibc/c_locale.h
--- gcc-4.2.0-snapshot_patched/libstdc++-v3/config/locale/uclibc/c_locale.h	2006-09-11 15:55:07.000000000 +0200
+++ gcc-4.2.0-snapshot/libstdc++-v3/config/locale/uclibc/c_locale.h	2006-09-11 16:10:56.000000000 +0200
@@ -1,6 +1,7 @@
 // Wrapper for underlying C-language localization -*- C++ -*-
 
-// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
+// Copyright (C) 2001, 2002, 2003, 2004, 2005, 2006
+// Free Software Foundation, Inc.
 //
 // This file is part of the GNU ISO C++ Library.  This library is free
 // software; you can redistribute it and/or modify it under the
@@ -39,7 +40,7 @@
 #pragma GCC system_header
 
 #include <cstring>              // get std::strlen
-#include <cstdio>               // get std::snprintf or std::sprintf
+#include <cstdio>               // get std::vsnprintf or std::vsprintf
 #include <clocale>
 #include <langinfo.h>		// For codecvt
 #ifdef __UCLIBC_MJN3_ONLY__
@@ -51,6 +52,7 @@
 #ifdef HAVE_LIBINTL_H
 #include <libintl.h> 		// For messages
 #endif
+#include <cstdarg>
 
 #ifdef __UCLIBC_MJN3_ONLY__
 #warning what is _GLIBCXX_C_LOCALE_GNU for
@@ -80,22 +82,23 @@
   typedef int*			__c_locale;
 #endif
 
-  // Convert numeric value of type _Tv to string and return length of
-  // string.  If snprintf is available use it, otherwise fall back to
-  // the unsafe sprintf which, in general, can be dangerous and should
-  // be avoided.
-  template<typename _Tv>
-    int
-    __convert_from_v(char* __out, 
-		     const int __size __attribute__ ((__unused__)),
-		     const char* __fmt,
+  // Convert numeric value of type double and long double to string and
+  // return length of string.  If vsnprintf is available use it, otherwise
+  // fall back to the unsafe vsprintf which, in general, can be dangerous
+  // and should be avoided.
+  inline int
+#ifdef __UCLIBC_HAS_XCLOCALE__
+  __convert_from_v(const __c_locale& __cloc __attribute__ ((__unused__)),
+#else
+  __convert_from_v(const __c_locale&,
+#endif
+		   char* __out,
+		   const int __size __attribute__ ((__unused__)),
+		   const char* __fmt, ...)
+  {
 #ifdef __UCLIBC_HAS_XCLOCALE__
-		     _Tv __v, const __c_locale& __cloc, int __prec)
-    {
       __c_locale __old = __gnu_cxx::__uselocale(__cloc);
 #else
-		     _Tv __v, const __c_locale&, int __prec)
-    {
 # ifdef __UCLIBC_HAS_LOCALE__
       char* __old = std::setlocale(LC_ALL, NULL);
       char* __sav = new char[std::strlen(__old) + 1];
@@ -104,7 +107,12 @@
 # endif
 #endif
 
-      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
+      va_list __args;
+      va_start(__args, __fmt);
+ 
+      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
+
+      va_end(__args);
 
 #ifdef __UCLIBC_HAS_XCLOCALE__
       __gnu_cxx::__uselocale(__old);

Thanks

Miguel ?ngel 
 
----------------------------------------- PLEASE NOTE -------------------------------------------
This message, along with any attachments, may be confidential or legally privileged. 
It is intended only for the named person(s), who is/are the only authorized recipients.
If this message has reached you in error, kindly destroy it without review and notify the sender immediately.
Thank you for your help.
?SysCom uses virus scanning software but excludes any liability for viruses contained in any attachment.
 
------------------------------------ ROGAMOS LEA ESTE TEXTO -------------------------------
Este mensaje y sus anexos pueden contener informaci?n confidencial y/o con derecho legal. 
Est? dirigido ?nicamente a la/s persona/s o entidad/es rese?adas como ?nico destinatario autorizado.
Si este mensaje le hubiera llegado por error, por favor elim?nelo sin revisarlo ni reenviarlo y notif?quelo inmediatamente al remitente. Gracias por su colaboraci?n.  
?SysCom utiliza software antivirus, pero no se hace responsable de los virus contenidos en los ficheros anexos.
