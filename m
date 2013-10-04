From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 15:30:01 +0200
Subject: [Buildroot] [git commit] gstreamer: fix bison bump build failure
Message-ID: <20131004133014.D31F49B93F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fdedb84b1860c6286cfbf2d9d83c4465da8c787
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's due to deprecations in bison 3.0+, fixes:
http://autobuild.buildroot.net/results/df4/df473cb34c9914b2c3d3d8ae344cbf7c19255468/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer/gstreamer/gstreamer-01-bison3.patch  |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer-01-bison3.patch b/package/gstreamer/gstreamer/gstreamer-01-bison3.patch
new file mode 100644
index 0000000..f9ec52d
--- /dev/null
+++ b/package/gstreamer/gstreamer/gstreamer-01-bison3.patch
@@ -0,0 +1,24 @@
+Fix deprecation from bison 3.0+
+From http://comments.gmane.org/gmane.linux.lfs.beyond.devel/24620
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gstreamer-0.10.36.orig/gst/parse/grammar.y gstreamer-0.10.36/gst/parse/grammar.y
+--- gstreamer-0.10.36.orig/gst/parse/grammar.y	2013-10-04 09:52:21.685282055 -0300
++++ gstreamer-0.10.36/gst/parse/grammar.y	2013-10-04 10:21:54.800211238 -0300
+@@ -26,7 +26,6 @@
+  */
+
+ #define YYERROR_VERBOSE 1
+-#define YYLEX_PARAM scanner
+
+ #define YYENABLE_NLS 0
+
+@@ -648,6 +647,7 @@
+ %right '.'
+ %left '!' '='
+
++%lex-param { void *scanner }
+ %parse-param { void *scanner }
+ %parse-param { graph_t *graph }
+ %pure-parser
