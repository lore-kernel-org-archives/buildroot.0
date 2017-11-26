From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:39:33 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] mp4v2: add upstream patch
 fixing build issue with gcc 7+
Message-ID: <20171126213857.225F4802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44441c766f2d10b769d3beceadf151fae02bbc4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes:
http://autobuild.buildroot.net/results/fc0/fc0f51f3ee1364f55248e8fe713995bc07f877c6/
http://autobuild.buildroot.net/results/b0e/b0e68ad2aeb7c191cdaa9856a36bd2cae4bcd5f0/
http://autobuild.buildroot.net/results/a66/a66c89e3fb3f1d9802581aaffad87a547c6e67f5/

And many more.

Add an upstream patch fixing invalid code that now triggers a build error on gcc7+.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b1509107dc1720f7da6149a8791085794b5677f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/0001-Fix-GCC7-build.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/mp4v2/0001-Fix-GCC7-build.patch b/package/mp4v2/0001-Fix-GCC7-build.patch
new file mode 100644
index 0000000..90222c1
--- /dev/null
+++ b/package/mp4v2/0001-Fix-GCC7-build.patch
@@ -0,0 +1,32 @@
+From 855e9674232808ff3be7191b697dfb56917db21f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?S=C3=A9rgio=20M=2E=20Basto?= <sergio@serjux.com>
+Date: Wed, 8 Feb 2017 00:56:32 +0000
+Subject: [PATCH] Fix GCC7 build
+
+if (*pSlash != '\0') {
+
+As it stands the body of that if will always execute and when there are
+no encoding parameters ppEncodingParams will be returned as a pointer to
+an empty string rather than as a null pointer
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/rtphint.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rtphint.cpp b/src/rtphint.cpp
+index e07309d..1eb01f5 100644
+--- a/src/rtphint.cpp
++++ b/src/rtphint.cpp
+@@ -339,7 +339,7 @@ void MP4RtpHintTrack::GetPayload(
+                 pSlash = strchr(pSlash, '/');
+                 if (pSlash != NULL) {
+                     pSlash++;
+-                    if (pSlash != '\0') {
++                    if (*pSlash != '\0') {
+                         length = (uint32_t)strlen(pRtpMap) - (pSlash - pRtpMap);
+                         *ppEncodingParams = (char *)MP4Calloc(length + 1);
+                         strncpy(*ppEncodingParams, pSlash, length);
+-- 
+2.11.0
+
