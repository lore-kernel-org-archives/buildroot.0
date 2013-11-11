From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 21:14:01 +0100
Subject: [Buildroot] [git commit] liblog4c-localtime: fix linking error
	without pthread
Message-ID: <20131111201553.6B4B19BBD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2255e00f3ead5d9a55d81f503be269b555fbed5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/34f/34f238cdb1b1b4be1a11143b5e4a17c78c2fc289/

The rollingfile functionality only gets built if pthread support is
available, but a call to these functions from log4c_fini() was outside
the #if WITH_ROLLINGFILE conditional, causing linker errors when the
library is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../liblog4c-localtime-nothread.patch              |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime-nothread.patch b/package/liblog4c-localtime/liblog4c-localtime-nothread.patch
new file mode 100644
index 0000000..df16e62
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime-nothread.patch
@@ -0,0 +1,29 @@
+[PATCH] fix linking error without pthread
+
+The rollingfile functionality only gets built if pthread support is
+available, but a call to these functions from log4c_fini() was outside
+the #if WITH_ROLLINGFILE conditional, causing linker errors when the
+library is used.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/log4c/init.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: liblog4c-localtime-v1.0/src/log4c/init.c
+===================================================================
+--- liblog4c-localtime-v1.0.orig/src/log4c/init.c
++++ liblog4c-localtime-v1.0/src/log4c/init.c
+@@ -267,10 +267,12 @@
+ 	log4c_layout_factory = NULL;
+     }
+   
++#ifdef WITH_ROLLINGFILE
+     if (log4c_rollingpolicy_factory) {
+ 	sd_factory_delete(log4c_rollingpolicy_factory);
+ 	log4c_rollingpolicy_factory = NULL;
+     }
++#endif
+     
+ #ifdef __SD_DEBUG__
+     if( getenv("SD_DEBUG")){
