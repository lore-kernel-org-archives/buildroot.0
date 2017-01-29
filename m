From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:25:16 +0100
Subject: [Buildroot] [git commit] package/fbterm: Fix building against
	libiconv
Message-ID: <20170129132559.5A1207FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ca1370c321fafd784b11c114e59473deec6221b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d5d/d5d9705eea16f07848a313d9c83f491569734c5d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbterm/0004-iconv.patch | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/fbterm/0004-iconv.patch b/package/fbterm/0004-iconv.patch
new file mode 100644
index 0000000..39c9182
--- /dev/null
+++ b/package/fbterm/0004-iconv.patch
@@ -0,0 +1,41 @@
+Fix building against libiconv
+
+Downloaded from
+https://github.com/kyak/openwrt-packages/blob/master/fbterm/patches/001-iconv.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/lib/io.cpp
++++ b/src/lib/io.cpp
+@@ -119,10 +119,10 @@ void IoPipe::setCodec(const s8 *up, cons
+ 	if (!strcasecmp(up, down)) return;
+ 
+ 	mCodecRead = iconv_open(up, down);
+-	if (mCodecRead == (void*)-1) mCodecRead = 0;
++	if (mCodecRead == (iconv_t)(-1)) mCodecRead = 0;
+ 
+ 	mCodecWrite = iconv_open(down, up);
+-	if (mCodecWrite == (void*)-1) mCodecWrite = 0;
++	if (mCodecWrite == (iconv_t)(-1)) mCodecWrite = 0;
+ }
+ 
+ #define BUF_SIZE 10240
+--- a/src/lib/io.h
++++ b/src/lib/io.h
+@@ -23,6 +23,7 @@
+ 
+ #include "type.h"
+ #include "instance.h"
++#include <iconv.h>
+ 
+ class IoPipe {
+ public:
+@@ -47,7 +48,7 @@ private:
+ 	void writeIo(s8 *buf, u32 len);
+ 
+ 	s32 mFd;
+-	void *mCodecRead, *mCodecWrite;
++	iconv_t mCodecRead, mCodecWrite;
+ 	s8 mBufRead[16], mBufWrite[16];
+ 	u32 mBufLenRead, mBufLenWrite;
+ };
