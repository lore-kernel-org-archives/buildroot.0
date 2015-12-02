From: Alexey Galakhov <agalakhov@gmail.com>
Date: Wed,  2 Dec 2015 11:32:44 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/boost: bump to version 1.59.0
Message-ID: <1449052364-1829-1-git-send-email-agalakhov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove boost patches that are already upstream.

Add a backport of fix of #11549 (Boost.Log contains has a regression
that prevents some of the logging statements from compiling).

Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
---
 ...lation-of-operator-into-a-record-ostream-.patch | 116 +++++++++++++++++++++
 .../boost/0002-gcc.jam-compiler-options-fix.patch  |  37 -------
 package/boost/boost.hash                           |   6 +-
 package/boost/boost.mk                             |   2 +-
 4 files changed, 120 insertions(+), 41 deletions(-)
 create mode 100644 package/boost/0002-Fixed-compilation-of-operator-into-a-record-ostream-.patch
 delete mode 100644 package/boost/0002-gcc.jam-compiler-options-fix.patch

diff --git a/package/boost/0002-Fixed-compilation-of-operator-into-a-record-ostream-.patch b/package/boost/0002-Fixed-compilation-of-operator-into-a-record-ostream-.patch
new file mode 100644
index 0000000..c81c42b
--- /dev/null
+++ b/package/boost/0002-Fixed-compilation-of-operator-into-a-record-ostream-.patch
@@ -0,0 +1,116 @@
+From 7da193fde1a9c1bc925ee980339f4df2e1a66fa7 Mon Sep 17 00:00:00 2001
+From: Andrey Semashev <andrey.semashev@gmail.com>
+Date: Sun, 23 Aug 2015 17:27:20 +0300
+Subject: [PATCH] Fixed compilation of operator<< into a record ostream, when
+ the operator right hand argument is not directly supported by
+ formatting_ostream. Fixed #11549.
+
+---
+ include/boost/log/sources/record_ostream.hpp     |  61 +++++
+ include/boost/log/utility/formatting_ostream.hpp |   7 +
+ test/common/make_record.hpp                      |   4 +-
+ test/run/src_record_ostream.cpp                  | 328 +++++++++++++++++++++++
+ test/run/util_formatting_ostream.cpp             |  64 +++++
+ 5 files changed, 462 insertions(+), 2 deletions(-)
+ create mode 100644 test/run/src_record_ostream.cpp
+
+diff --git a/boost/log/sources/record_ostream.hpp b/include/boost/log/sources/record_ostream.hpp
+index b3c58e2..c1e8059 100644
+--- a/boost/log/sources/record_ostream.hpp
++++ b/boost/log/sources/record_ostream.hpp
+@@ -39,6 +39,18 @@ namespace boost {
+ 
+ BOOST_LOG_OPEN_NAMESPACE
+ 
++template< typename CharT >
++class basic_record_ostream;
++
++namespace aux {
++
++template< typename StreamT, typename R >
++struct enable_if_record_ostream {};
++template< typename CharT, typename R >
++struct enable_if_record_ostream< basic_record_ostream< CharT >, R > { typedef R type; };
++
++} // namespace aux
++
+ /*!
+  * \brief Logging record adapter with a streaming capability
+  *
+@@ -174,6 +186,55 @@ typedef basic_record_ostream< char > record_ostream;        //!< Convenience typ
+ typedef basic_record_ostream< wchar_t > wrecord_ostream;    //!< Convenience typedef for wide-character logging
+ #endif
+ 
++// Implementation note: these operators below should be the least attractive for the compiler
++// so that user's overloads are chosen, when present. We use function template partial ordering for this purpose.
++// We also don't use perfect forwarding for the right hand argument because in ths case the generic overload
++// would be more preferred than the typical one written by users:
++//
++// record_ostream& operator<< (record_ostream& strm, my_type const& arg);
++//
++// This is because my_type rvalues require adding const to the type, which counts as a conversion that is not required
++// if there is a perfect forwarding overload.
++template< typename StreamT, typename T >
++inline typename boost::log::aux::enable_if_record_ostream< StreamT, StreamT& >::type
++operator<< (StreamT& strm, T const& value)
++{
++    typedef basic_formatting_ostream< typename StreamT::char_type > formatting_ostream_type;
++    static_cast< formatting_ostream_type& >(strm) << value;
++    return strm;
++}
++
++template< typename StreamT, typename T >
++inline typename boost::log::aux::enable_if_record_ostream< StreamT, StreamT& >::type
++operator<< (StreamT& strm, T& value)
++{
++    typedef basic_formatting_ostream< typename StreamT::char_type > formatting_ostream_type;
++    static_cast< formatting_ostream_type& >(strm) << value;
++    return strm;
++}
++
++#if !defined(BOOST_NO_CXX11_RVALUE_REFERENCES)
++
++template< typename StreamT, typename T >
++inline typename boost::log::aux::enable_if_record_ostream< StreamT, StreamT& >::type
++operator<< (StreamT&& strm, T const& value)
++{
++    typedef basic_formatting_ostream< typename StreamT::char_type > formatting_ostream_type;
++    static_cast< formatting_ostream_type& >(strm) << value;
++    return strm;
++}
++
++template< typename StreamT, typename T >
++inline typename boost::log::aux::enable_if_record_ostream< StreamT, StreamT& >::type
++operator<< (StreamT&& strm, T& value)
++{
++    typedef basic_formatting_ostream< typename StreamT::char_type > formatting_ostream_type;
++    static_cast< formatting_ostream_type& >(strm) << value;
++    return strm;
++}
++
++#endif // !defined(BOOST_NO_CXX11_RVALUE_REFERENCES)
++
+ namespace aux {
+ 
+ //! Internal class that provides formatting streams for record pumps
+diff --git a/boost/log/utility/formatting_ostream.hpp b/include/boost/log/utility/formatting_ostream.hpp
+index 4345206..744acc0 100644
+--- a/boost/log/utility/formatting_ostream.hpp
++++ b/boost/log/utility/formatting_ostream.hpp
+@@ -779,6 +779,13 @@ void basic_formatting_ostream< CharT, TraitsT, AllocatorT >::aligned_write(const
+ 
+ // Implementation note: these operators below should be the least attractive for the compiler
+ // so that user's overloads are chosen, when present. We use function template partial ordering for this purpose.
++// We also don't use perfect forwarding for the right hand argument because in ths case the generic overload
++// would be more preferred than the typical one written by users:
++//
++// formatting_ostream& operator<< (formatting_ostream& strm, my_type const& arg);
++//
++// This is because my_type rvalues require adding const to the type, which counts as a conversion that is not required
++// if there is a perfect forwarding overload.
+ template< typename StreamT, typename T >
+ inline typename boost::log::aux::enable_if_formatting_ostream< StreamT, StreamT& >::type
+ operator<< (StreamT& strm, T const& value)
+-- 
+2.6.2
+
diff --git a/package/boost/0002-gcc.jam-compiler-options-fix.patch b/package/boost/0002-gcc.jam-compiler-options-fix.patch
deleted file mode 100644
index c645250..0000000
--- a/package/boost/0002-gcc.jam-compiler-options-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a891e48ed0b647b7bf550ad1d179398b23d0726e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 2 May 2015 13:47:54 +0200
-Subject: [PATCH] gcc.jam compiler options fix
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Only PowerPC, SPARC, and x86 do support the -m32 and -m64 compiler options [1].
-
-Rather then excluding all architectures not supporting these options as it is
-done in commit c0634341d9ee2c02d3a55c91dafb988afc066c49 [2], include all
-architectures that do support them.
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
-[2] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/tools/gcc.jam | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index db04534..fbe8ab0 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
-         else
-         {
-             local arch = [ feature.get-values architecture : $(properties) ] ;
--            if $(arch) != arm
-+            if $(arch) = power || $(arch) = sparc || $(arch) = x86
-             {
-                 if $(model) = 32
-                 {
---
-2.3.7
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 706eea2..356242b 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.58.0/
-md5	b8839650e61e9c1c0a89f371dd475546	boost_1_58_0.tar.bz2
-sha1	2fc96c1651ac6fe9859b678b165bd78dc211e881	boost_1_58_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.59.0/
+md5	6aa9a5c6a4ca1016edd0ed1178e3cb87	boost_1_59_0.tar.bz2
+sha1	b94de47108b2cdb0f931833a7a9834c2dd3ca46e	boost_1_59_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 178f7b8..4de87ab 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.58.0
+BOOST_VERSION = 1.59.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.6.2
