From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 21:59:41 +0200
Subject: [Buildroot] [git commit] package/boost: drop first patch
Message-ID: <20200614195841.10037815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b509bddbc63d958de4bfd6cb80205268b42efca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First patch is not needed since version 1.67.0 and
https://github.com/boostorg/locale/commit/90dd8146fbb01fd0a1b0473ad5a5d28644b65e87

Indeed, since this bump, the patch is wrongly patching
virtual string_type format(double value,size_t &code_points) const

instead of:
virtual string_type format(int64_t value,size_t &code_points) const

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...fix-ambiguous-format-call-on-64bit-builds.patch | 27 ----------------------
 ...eventfd.patch => 0001-fix-uclibc-eventfd.patch} |  0
 package/boost/{0003-fenv.patch => 0002-fenv.patch} |  0
 3 files changed, 27 deletions(-)

diff --git a/package/boost/0001-fix-ambiguous-format-call-on-64bit-builds.patch b/package/boost/0001-fix-ambiguous-format-call-on-64bit-builds.patch
deleted file mode 100644
index e8972fd726..0000000000
--- a/package/boost/0001-fix-ambiguous-format-call-on-64bit-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-boost: fix ambiguous format call on 64-bit builds
-
-Fixes problem:
-
-libs/locale/src/icu/formatter.cpp: In member function
-'virtual std::basic_string<_CharT, std::char_traits<_CharT>, std::allocator<_CharT> > boost::locale::impl_icu::number_format<CharType>::format(boost::int64_t, size_t&) const':
-libs/locale/src/icu/formatter.cpp:61: error: call of overloaded 'format(boost::int64_t&, icu_49::UnicodeString&)' is ambiguous
-/ec/include/unicode/numfmt.h:317: note: candidates are: icu_49::UnicodeString& icu_49::NumberFormat::format(double, icu_49::UnicodeString&) const
-/ec/include/unicode/numfmt.h:330: note:                 icu_49::UnicodeString& icu_49::NumberFormat::format(int32_t, icu_49::UnicodeString&) const
-/ec/include/unicode/numfmt.h:343: note:                 icu_49::UnicodeString& icu_49::NumberFormat::format(int64_t, icu_49::UnicodeString&) const
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Backported-from: https://svn.boost.org/trac/boost/ticket/6851
-
-
-diff -ruN boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp boost_1_49_0/libs/locale/src/icu/formatter.cpp
---- boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp 2011-07-12 14:57:36.000000000 +0100
-+++ boost_1_49_0/libs/locale/src/icu/formatter.cpp      2012-05-01 14:27:54.000000000 +0100
-@@ -58,7 +58,7 @@
-             virtual string_type format(int64_t value,size_t &code_points) const
-             {
-                 icu::UnicodeString tmp;
--                icu_fmt_->format(value,tmp);
-+                icu_fmt_->format(::int64_t(value),tmp);
-                 code_points=tmp.countChar32();
-                 return cvt_.std(tmp);
-             }
diff --git a/package/boost/0002-fix-uclibc-eventfd.patch b/package/boost/0001-fix-uclibc-eventfd.patch
similarity index 100%
rename from package/boost/0002-fix-uclibc-eventfd.patch
rename to package/boost/0001-fix-uclibc-eventfd.patch
diff --git a/package/boost/0003-fenv.patch b/package/boost/0002-fenv.patch
similarity index 100%
rename from package/boost/0003-fenv.patch
rename to package/boost/0002-fenv.patch
