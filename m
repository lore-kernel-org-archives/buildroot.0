From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 00:20:45 +0200
Subject: [Buildroot] [git commit] boost: fix 64-bit build due to ambiguous
	format call
Message-ID: <20130806222032.4EDC29B1C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1430ed1bcc2be51547d86c1cb8e4a68810fb602f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch imported from the upstream bug tracker, fixing a
problem with boost builds failing for 64-bit, like in autobuild [1].
Refer to [2] for the actual autobuild error.

Upstream did not yet accept this patch, because it is not portable enough
(not OK for Windows builds) [3], but this should not withhold us from fixing
the error in buildroot.

[1] http://autobuild.buildroot.net/results/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/
[2] http://lists.busybox.net/pipermail/buildroot/2013-August/076222.html
[3] https://svn.boost.org/trac/boost/ticket/6851

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fix-ambiguous-format-call-on-64bit-builds.patch |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/boost/boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch b/package/boost/boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch
new file mode 100644
index 0000000..e8972fd
--- /dev/null
+++ b/package/boost/boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch
@@ -0,0 +1,27 @@
+boost: fix ambiguous format call on 64-bit builds
+
+Fixes problem:
+
+libs/locale/src/icu/formatter.cpp: In member function
+'virtual std::basic_string<_CharT, std::char_traits<_CharT>, std::allocator<_CharT> > boost::locale::impl_icu::number_format<CharType>::format(boost::int64_t, size_t&) const':
+libs/locale/src/icu/formatter.cpp:61: error: call of overloaded 'format(boost::int64_t&, icu_49::UnicodeString&)' is ambiguous
+/ec/include/unicode/numfmt.h:317: note: candidates are: icu_49::UnicodeString& icu_49::NumberFormat::format(double, icu_49::UnicodeString&) const
+/ec/include/unicode/numfmt.h:330: note:                 icu_49::UnicodeString& icu_49::NumberFormat::format(int32_t, icu_49::UnicodeString&) const
+/ec/include/unicode/numfmt.h:343: note:                 icu_49::UnicodeString& icu_49::NumberFormat::format(int64_t, icu_49::UnicodeString&) const
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+Backported-from: https://svn.boost.org/trac/boost/ticket/6851
+
+
+diff -ruN boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp boost_1_49_0/libs/locale/src/icu/formatter.cpp
+--- boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp 2011-07-12 14:57:36.000000000 +0100
++++ boost_1_49_0/libs/locale/src/icu/formatter.cpp      2012-05-01 14:27:54.000000000 +0100
+@@ -58,7 +58,7 @@
+             virtual string_type format(int64_t value,size_t &code_points) const
+             {
+                 icu::UnicodeString tmp;
+-                icu_fmt_->format(value,tmp);
++                icu_fmt_->format(::int64_t(value),tmp);
+                 code_points=tmp.countChar32();
+                 return cvt_.std(tmp);
+             }
