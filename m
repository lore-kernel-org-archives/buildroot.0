From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:08:43 +0100
Subject: [Buildroot] [git commit] package/multicat: add patch to fix static
	build
Message-ID: <20160320140856.5F599817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9958234bed8e9a07a43f2398c63ddb8ef0d939a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multicat/0001-Fix-missing-pthread.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/multicat/0001-Fix-missing-pthread.patch b/package/multicat/0001-Fix-missing-pthread.patch
new file mode 100644
index 0000000..1ad2c98
--- /dev/null
+++ b/package/multicat/0001-Fix-missing-pthread.patch
@@ -0,0 +1,20 @@
+Makefile: link with pthread
+
+Otherwise building multicat in a static context fails:
+  aggregartp.c:381: undefined reference to `pthread_self'
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+Sent upstream: https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000125.html
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
