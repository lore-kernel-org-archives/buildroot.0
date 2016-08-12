From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Aug 2016 18:19:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: Fix build with gcc6
Message-ID: <1471018759-17834-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/787/787c715814b09d380ca521712f54cbcf5ae121d6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsidplay2/0003-gcc6.patch | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libsidplay2/0003-gcc6.patch

diff --git a/package/libsidplay2/0003-gcc6.patch b/package/libsidplay2/0003-gcc6.patch
new file mode 100644
index 0000000..53601f6
--- /dev/null
+++ b/package/libsidplay2/0003-gcc6.patch
@@ -0,0 +1,44 @@
+Fix build with gcc6
+
+gcc6 triggers an error during build:
+
+xsid.cpp:101:1: error: narrowing conversion of ''\200'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+ };
+ ^
+xsid.cpp:101:1: error: narrowing conversion of ''\224'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+xsid.cpp:101:1: error: narrowing conversion of ''\251'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+xsid.cpp:101:1: error: narrowing conversion of ''\274'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+xsid.cpp:101:1: error: narrowing conversion of ''\316'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+xsid.cpp:101:1: error: narrowing conversion of ''\341'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+xsid.cpp:101:1: error: narrowing conversion of ''\362'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
+
+To fix the problem change the array type from int8_t to char as proposed
+by Khem Raj:
+http://lists.busybox.net/pipermail/buildroot/2016-August/169540.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr sidplay-libs-2.1.1.org/libsidplay/src/xsid/xsid.cpp sidplay-libs-2.1.1/libsidplay/src/xsid/xsid.cpp
+--- sidplay-libs-2.1.1.org/libsidplay/src/xsid/xsid.cpp	2004-06-14 22:08:02.000000000 +0200
++++ sidplay-libs-2.1.1/libsidplay/src/xsid/xsid.cpp	2016-08-12 18:10:20.000000000 +0200
+@@ -94,7 +94,7 @@
+     '\x08', '\x19', '\x2a', '\x3b', '\x4c', '\x5d', '\x6e', '\x7f'
+ };
+ */
+-const int8_t XSID::sampleConvertTable[16] =
++const char XSID::sampleConvertTable[16] =
+ {
+     '\x80', '\x94', '\xa9', '\xbc', '\xce', '\xe1', '\xf2', '\x03',
+     '\x1b', '\x2a', '\x3b', '\x49', '\x58', '\x66', '\x73', '\x7f'
+diff -uNr sidplay-libs-2.1.1.org/libsidplay/src/xsid/xsid.h sidplay-libs-2.1.1/libsidplay/src/xsid/xsid.h
+--- sidplay-libs-2.1.1.org/libsidplay/src/xsid/xsid.h	2004-06-14 22:08:02.000000000 +0200
++++ sidplay-libs-2.1.1/libsidplay/src/xsid/xsid.h	2016-08-12 18:11:01.000000000 +0200
+@@ -238,7 +238,7 @@
+     uint8_t             sidData0x18;
+     bool                _sidSamples;
+     int8_t              sampleOffset;
+-    static const int8_t sampleConvertTable[16];
++    static const char sampleConvertTable[16];
+     bool                wasRunning;
+ 
+ private:
-- 
2.8.1
