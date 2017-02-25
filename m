From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Feb 2017 22:17:01 +0100
Subject: [Buildroot] [PATCH] synergy: Fix build with gcc 6
Message-ID: <20170225211701.6357-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/05b/05bbc22dd6cd5564462226e612ab1e95778fe935/
http://autobuild.buildroot.net/results/edf/edfe58749d1b7a1bb2e0184a6824a74b9d38ddb9/
http://autobuild.buildroot.net/results/139/1395eca13ca537bde928ddd68a5bc6e130e82ba3/
http://autobuild.buildroot.net/results/94a/94ad6e8bbbeb926ea834d9d6e3ba87d0398acb86/

Gcc 6.x defaults to C++14, and the iostream operator bool behaviour changed
in C++11.  In previous versions, a somewhat odd operator void* was used to
return the status of the stream as a pointer.  Since C++11 a more sensible
operator bool is used to return the stream staus.

For details, see:

http://en.cppreference.com/w/cpp/io/basic_ios/operator_bool

The code in CConfigReadContext assumes the pre-C++11 behaviour and provides
its own operator void overload to return the status of the embedded
iostream.  With C++11, iostream no longer provides this overload, breaking
the build:

CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return
  return m_stream;

To fix it, backport part of upstream commit 3d963bfbe7897d0a33ad (possible
fix for mavericks) which changes the code to simply provide a getStream()
method which returns a reference to the embedded stream and the calling code
is changed to use operator bool on the returned stream, making the code
compatible with both old and new compilers.

This upstream commit is part of the 1.6.0 release, so can be dropped when
the version is bumped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/synergy/0003-Fix-build-with-gcc-6.patch | 86 +++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/synergy/0003-Fix-build-with-gcc-6.patch

diff --git a/package/synergy/0003-Fix-build-with-gcc-6.patch b/package/synergy/0003-Fix-build-with-gcc-6.patch
new file mode 100644
index 000000000..843078fe6
--- /dev/null
+++ b/package/synergy/0003-Fix-build-with-gcc-6.patch
@@ -0,0 +1,86 @@
+From b79d478c21ed6af20554ead97da72de845dc3206 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 25 Feb 2017 21:57:19 +0100
+Subject: [PATCH] Fix build with gcc 6
+
+Gcc 6.x defaults to C++14, and the iostream operator bool behaviour changed
+in C++11.  In previous versions, a somewhat odd operator void* was used to
+return the status of the stream as a pointer.  Since C++11 a more sensible
+operator bool is used to return the stream staus.
+
+For details, see:
+
+http://en.cppreference.com/w/cpp/io/basic_ios/operator_bool
+
+The code in CConfigReadContext assumes the pre-C++11 behaviour and provides
+its own operator void overload to return the status of the embedded
+iostream.  With C++11, iostream no longer provides this overload, breaking
+the build:
+
+CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
+CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return
+  return m_stream;
+
+To fix it, backport part of upstream commit 3d963bfbe7897d0a33ad (possible
+fix for mavericks) which changes the code to simply provide a getStream()
+method which returns a reference to the embedded stream and the calling code
+is changed to use operator bool on the returned stream, making the code
+compatible with both old and new compilers.
+
+This upstream commit is part of the 1.6.0 release, so can be dropped when
+the version is bumped.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/server/CConfig.cpp | 7 +------
+ lib/server/CConfig.h   | 2 +-
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/lib/server/CConfig.cpp b/lib/server/CConfig.cpp
+index a502fe78..d67dde20 100644
+--- a/lib/server/CConfig.cpp
++++ b/lib/server/CConfig.cpp
+@@ -607,7 +607,7 @@ void
+ CConfig::read(CConfigReadContext& context)
+ {
+ 	CConfig tmp;
+-	while (context) {
++	while (context.getStream()) {
+ 		tmp.readSection(context);
+ 	}
+ 	*this = tmp;
+@@ -1846,11 +1846,6 @@ CConfigReadContext::getLineNumber() const
+ 	return m_line;
+ }
+ 
+-CConfigReadContext::operator void*() const
+-{
+-	return m_stream;
+-}
+-
+ bool
+ CConfigReadContext::operator!() const
+ {
+diff --git a/lib/server/CConfig.h b/lib/server/CConfig.h
+index c0d2faa8..0ee453cb 100644
+--- a/lib/server/CConfig.h
++++ b/lib/server/CConfig.h
+@@ -480,7 +480,6 @@ public:
+ 	bool			readLine(CString&);
+ 	UInt32			getLineNumber() const;
+ 
+-	operator void*() const;
+ 	bool			operator!() const;
+ 
+ 	OptionValue		parseBoolean(const CString&) const;
+@@ -502,6 +501,7 @@ public:
+ 	IPlatformScreen::CButtonInfo*
+ 					parseMouse(const CString& mouse) const;
+ 	KeyModifierMask	parseModifier(const CString& modifiers) const;
++	std::istream&	getStream() const { return m_stream; };
+ 
+ private:
+ 	// not implemented
+-- 
+2.11.0
+
-- 
2.11.0
