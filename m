From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 25 Aug 2007 04:22:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20070825112252.B8532A684A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-25 04:22:51 -0700 (Sat, 25 Aug 2007)
New Revision: 19694

Log:
This patch fixes a bug into ostream::operator<<(double) due to the wrong size
passed into the __convert_from_v method. The wrong size is then passed to
std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.

Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>


Added:
   trunk/buildroot/toolchain/gcc/4.2.1/307-locale_facets.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2.1/307-locale_facets.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/307-locale_facets.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2.1/307-locale_facets.patch	2007-08-25 11:22:51 UTC (rev 19694)
@@ -0,0 +1,26 @@
+This patch fixes a bug into ostream::operator<<(double) due to the wrong size
+passed into the __convert_from_v method. The wrong size is then passed to
+std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.
+
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+
+--- gcc-4.2.1/libstdc++-v3/include/bits/locale_facets.tcc	2006-10-17 18:43:47.000000000 +0200
++++ gcc-4.2.1-st/libstdc++-v3/include/bits/locale_facets.tcc	2007-08-22 18:54:23.000000000 +0200
+@@ -1143,7 +1143,7 @@ _GLIBCXX_BEGIN_LDBL_NAMESPACE
+ 	const int __cs_size = __fixed ? __max_exp + __prec + 4
+ 	                              : __max_digits * 2 + __prec;
+ 	char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+-	__len = std::__convert_from_v(_S_get_c_locale(), __cs, 0, __fbuf, 
++	__len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size, __fbuf, 
+ 				      __prec, __v);
+ #endif
+ 
+@@ -1777,7 +1777,7 @@ _GLIBCXX_BEGIN_LDBL_NAMESPACE
+       // max_exponent10 + 1 for the integer part, + 2 for sign and '\0'.
+       const int __cs_size = numeric_limits<long double>::max_exponent10 + 3;
+       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+-      int __len = std::__convert_from_v(_S_get_c_locale(), __cs, 0, "%.*Lf", 
++      int __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size, "%.*Lf", 
+ 					0, __units);
+ #endif
+       string_type __digits(__len, char_type());
