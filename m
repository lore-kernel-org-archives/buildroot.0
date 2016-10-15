From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:23:39 +0200
Subject: [Buildroot] [git commit] package/urg: fix build with gcc-6
Message-ID: <20161015102346.98083807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39278f17d6d9d45a7570882b206f840ade8358ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch fixing/adding explicit cast on negative value in char[], which
is required with gcc-6 (see "Narrowing conversions" paragraph in [1])

Fixes:
  http://autobuild.buildroot.net/results/d0c/d0cd11163753db69a14c02e941dbda40e5f98bba/

[1] https://gcc.gnu.org/gcc-6/porting_to.html

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-urg-gcc6-fix-narrowing-conversion.patch   | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch b/package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch
new file mode 100644
index 0000000..e3db898
--- /dev/null
+++ b/package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch
@@ -0,0 +1,99 @@
+urg: fix 'narrowing conversion' with gcc6
+
+Fixes:
+  http://autobuild.buildroot.net/results/d0c/d0cd11163753db69a14c02e941dbda40e5f98bba/
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- a/src/cpp/urg/ScipHandler.cpp	2016-09-11 16:11:16.083995214 +0200
++++ b/src/cpp/urg/ScipHandler.cpp	2016-09-11 16:11:24.380832543 +0200
+@@ -120,7 +120,7 @@ struct ScipHandler::pImpl
+ 
+       // QT ?????s
+       int return_code = -1;
+-      char qt_expected_response[] = { 0, -1 };
++      char qt_expected_response[] = { 0, (char)-1 };
+       // return_code ???g???????????AsetLaserOutput() ???p?????? QT ?????M????
+       if (response(return_code, "QT\n", qt_expected_response)) {
+         laser_state_ = LaserOff;
+@@ -139,7 +139,7 @@ struct ScipHandler::pImpl
+ 
+       } else if (return_code == Scip11Response) {
+         // SCIP1.1 ?v???g?R?????????????ASCIP2.0 ?????M????
+-        char scip20_expected_response[] = { 0, -1 };
++        char scip20_expected_response[] = { 0, (char)-1 };
+         if (! response(return_code, "SCIP2.0\n", scip20_expected_response)) {
+           error_message_ =
+             "SCIP1.1 protocol is not supported. Please update URG firmware, or reconnect after a few seconds because sensor is booting.";
+@@ -150,7 +150,7 @@ struct ScipHandler::pImpl
+ 
+       } else if (return_code == 0xE) {
+         // TM ???[?h?????????ATM2 ?????s????
+-        char tm2_expected_response[] = { 0, -1 };
++        char tm2_expected_response[] = { 0, (char)-1 };
+         if (response(return_code, "TM2\n", tm2_expected_response)) {
+           laser_state_ = LaserOff;
+           return changeBothBaudrate(baudrate);
+@@ -202,7 +202,7 @@ struct ScipHandler::pImpl
+     snprintf(send_buffer, 10, "SS%06ld\n", baudrate);
+     int return_code = -1;
+     // !!! ???????????????{?[???[?g?A?????????????l?? ss_expected... ??????????
+-    char ss_expected_response[] = { 0, 0x3, 0x4, 0xf, -1 };
++    char ss_expected_response[] = { 0, 0x3, 0x4, 0xf, (char)-1 };
+     if (! response(return_code, send_buffer, ss_expected_response)) {
+       error_message_ = "Baudrate change fail.";
+       return false;
+@@ -216,7 +216,7 @@ struct ScipHandler::pImpl
+   {
+     // PP ?????M???f?[?^?????M
+     int return_code = -1;
+-    char pp_expected_response[] = { 0, -1 };
++    char pp_expected_response[] = { 0, (char)-1 };
+     vector<string> lines;
+     if (! response(return_code, "PP\n", pp_expected_response, &lines)) {
+       error_message_ = "PP fail.";
+@@ -356,7 +356,7 @@ struct ScipHandler::pImpl
+ 
+     if (on) {
+       int return_code = -1;
+-      char expected_response[] = { 0, -1 };
++      char expected_response[] = { 0, (char)-1 };
+       if (! response(return_code, "BM\n", expected_response)) {
+         error_message_ = "BM fail.";
+         return false;
+@@ -369,7 +369,7 @@ struct ScipHandler::pImpl
+       if (! mx_capturing_) {
+         // ?????????????? QT ?????A??????????????
+         int return_code = -1;
+-        char qt_expected_response[] = { 0, -1 };
++        char qt_expected_response[] = { 0, (char)-1 };
+         if (! response(return_code, "QT\n", qt_expected_response)) {
+           return false;
+         }
+@@ -777,7 +777,7 @@ bool ScipHandler::loadParameter(RangeSen
+ bool ScipHandler::versionLines(vector<string>& lines)
+ {
+   int return_code = -1;
+-  char expected_response[] = { 0, -1 };
++  char expected_response[] = { 0, (char)-1 };
+   if (! pimpl->response(return_code, "VV\n", expected_response, &lines)) {
+     return false;
+   }
+@@ -792,7 +792,7 @@ bool ScipHandler::setRawTimestampMode(bo
+ 
+   // TM0 or TM2 ?????M
+   int return_code = -1;
+-  char expected_response[] = { 0, -1 };
++  char expected_response[] = { 0, (char)-1 };
+   if (! pimpl->response(return_code, send_command, expected_response)) {
+     pimpl->error_message_ = (on) ? "TM0 fail." : "TM2 fail.";
+     return false;
+@@ -809,7 +809,7 @@ bool ScipHandler::rawTimestamp(int* time
+ {
+   // TM1 ???l??????
+   int return_code = -1;
+-  char expected_response[] = { 0, -1 };
++  char expected_response[] = { 0, (char)-1 };
+   vector<string> lines;
+   if (! pimpl->response(return_code, "TM1\n", expected_response, &lines)) {
+     pimpl->error_message_ = "TM1 fail.";
