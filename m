From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 14 Sep 2015 23:26:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix basename call under
	musl
Message-ID: <1442269611-30641-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9c3/9c3889fe80e58b7a35c242332f993992044d2f6b/

ibrcommon was relying on a glibc extension to basename(3) which allowed it
to accept a const char* parameter (instead of char*). Fixed by testing
for __GLIBC__; if not defined (such as when musl is in use) a fallback
block is used which creates a temporary copy of the path.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 ...data-File.cpp-support-POSIX-basename-call.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch

diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
new file mode 100644
index 0000000..b7c1839
--- /dev/null
+++ b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
@@ -0,0 +1,55 @@
+From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Mon, 14 Sep 2015 23:25:52 +0100
+Subject: [PATCH 1/1] ibrcommon/data/File.cpp: support POSIX basename call
+
+Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
+prototype within <string.h> whenever __cplusplus is defined. This can be
+solved by including the <libgen.h> header defined by POSIX 1003.1 whenever
+__GLIBC__ is not defined.
+
+However, this leads to a second problem. POSIX defines the function as
+char* basename(char*) and this is the only version supported by musl.
+However, the std::string.cstr() method returns a const char*.
+
+POSIX says that the string parameter can be modified. However the GNU
+implementation never modifies it. glibc therefore supports an extension
+when compiling under C++ by also supplying
+const char* basename(const char*). This extension is not present on musl
+which is the cause of the failure.
+
+The solution is reasonably straightforward; test if __GLIBC__ is defined
+before calling basename. If not, use the fallback already provided for
+other platforms whereby basename() is called on a temporary copy.
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+Upstream-status: pending
+---
+ ibrcommon/data/File.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
+index 31af4ae..68e9b4f 100644
+--- a/ibrcommon/data/File.cpp
++++ b/ibrcommon/data/File.cpp
+@@ -35,7 +35,7 @@
+ #include <cerrno>
+ #include <fstream>
+ 
+-#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
++#if !defined(HAVE_FEATURES_H) || !defined(__GLIBC__) || defined(ANDROID)
+ #include <libgen.h>
+ #endif
+ 
+@@ -225,7 +225,7 @@ namespace ibrcommon
+ 
+ 	std::string File::getBasename() const
+ 	{
+-#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
++#if !defined(ANDROID) && defined(HAVE_FEATURES_H) && defined(__GLIBC__)
+ 		return std::string(basename(_path.c_str()));
+ #else
+ 		char path[_path.length()+1];
+-- 
+2.4.3
+
-- 
2.4.3
