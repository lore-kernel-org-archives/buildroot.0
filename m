From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 20 Mar 2016 00:41:44 +0100
Subject: [Buildroot] [PATCH 1/3] package/multicat: add patch to fix static
	build
Message-ID: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building multicat in a static context fails with:
  aggregartp.c:381: undefined reference to `pthread_self'

Fix this by adding -lpthread to LDLIBS.

Fixes:
http://autobuild.buildroot.net/results/e69/e699cf6b97bc97f2e8e51aa8b86f0e16af70b5b0/
http://autobuild.buildroot.net/results/201/2019f11dcc43cb0db13ceb4e3a575c1a91573d4c/
http://autobuild.buildroot.net/results/fa9/fa98afec377a1e8fce64af5897d1f7af45804069/
and maybe more.

Upstream status: Pending [1]

[1] https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000125.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/multicat/0001-Fix-missing-pthread.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/multicat/0001-Fix-missing-pthread.patch

diff --git a/package/multicat/0001-Fix-missing-pthread.patch b/package/multicat/0001-Fix-missing-pthread.patch
new file mode 100644
index 0000000..f21c7ce
--- /dev/null
+++ b/package/multicat/0001-Fix-missing-pthread.patch
@@ -0,0 +1,19 @@
+Makefile: link with pthread
+
+Otherwise building multicat in a static context fails:
+  aggregartp.c:381: undefined reference to `pthread_self'
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN multicat-2.1.orig/Makefile multicat-2.1/Makefile
+--- multicat-2.1.orig/Makefile	2015-10-05 18:36:29.000000000 +0200
++++ multicat-2.1/Makefile	2016-03-19 21:47:59.467745127 +0100
+@@ -4,7 +4,7 @@ VERSION = 2.1
+ CFLAGS += -Wall -Wformat-security -O3 -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -D_ISOC99_SOURCE -D_BSD_SOURCE
+ CFLAGS += -g
+ # Comment out the following line for Mac OS X build
+-LDLIBS += -lrt
++LDLIBS += -lrt -pthread
+ 
+ OBJ_MULTICAT = multicat.o util.o
+ OBJ_INGESTS = ingests.o util.o
-- 
2.7.4
