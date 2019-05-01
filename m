From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 22:11:45 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gst1-plugins-base: add upstream SA-2019-0001 security fix
Message-ID: <20190501201631.C2004839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c38c9138e29850e1d01e90e0dea489a6fdd4b98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

CVE-2019-9928: GStreamer before 1.16.0 has a heap-based buffer overflow in
the RTSP connection parser via a crafted response from a server

For more details, see the advisory:
https://gstreamer.freedesktop.org/security/sa-2019-0001.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 99890750e0296ca29b61a315f78766261f6aee0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ection-Security-loophole-making-heap-over.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch b/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch
new file mode 100644
index 0000000000..de88f67a39
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch
@@ -0,0 +1,31 @@
+From f672277509705c4034bc92a141eefee4524d15aa Mon Sep 17 00:00:00 2001
+From: Tobias Ronge <tobiasr@axis.com>
+Date: Thu, 14 Mar 2019 10:12:27 +0100
+Subject: [PATCH] gstrtspconnection: Security loophole making heap overflow
+
+The former code allowed an attacker to create a heap overflow by
+sending a longer than allowed session id in a response and including a
+semicolon to change the maximum length. With this change, the parser
+will never go beyond 512 bytes.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gst-libs/gst/rtsp/gstrtspconnection.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/rtsp/gstrtspconnection.c b/gst-libs/gst/rtsp/gstrtspconnection.c
+index a6755bedd..c0429064a 100644
+--- a/gst-libs/gst/rtsp/gstrtspconnection.c
++++ b/gst-libs/gst/rtsp/gstrtspconnection.c
+@@ -2461,7 +2461,7 @@ build_next (GstRTSPBuilder * builder, GstRTSPMessage * message,
+           maxlen = sizeof (conn->session_id) - 1;
+           /* the sessionid can have attributes marked with ;
+            * Make sure we strip them */
+-          for (i = 0; session_id[i] != '\0'; i++) {
++          for (i = 0; i < maxlen && session_id[i] != '\0'; i++) {
+             if (session_id[i] == ';') {
+               maxlen = i;
+               /* parse timeout */
+-- 
+2.11.0
+
