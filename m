From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 Jul 2015 22:53:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Add patch to fix OPEN_MAX
	build error
Message-ID: <1437079992-31679-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not all systems define POSIX.1 value OPEN_MAX. In this case just close
all descriptors up to some arbitrary limit - say 256 [1].

Fixes:
http://autobuild.buildroot.net/results/d66/d660a9409552b3e1ad9e3ed716386fd0a67fd8db
http://autobuild.buildroot.net/results/f19/f19e843cdcc968a72919ca3792a90dd40552bd59
http://autobuild.buildroot.net/results/a77/a776001dae51c4dae1f25b3a9bf9a9fe2ca69003
http://autobuild.buildroot.net/results/3e7/3e7590566ed3cc7a1dd412fb66b7b987e847aa25

and many more.

Pull request is opened on github [2].

[1]
Advanced Programming in the UNIX Environment, Richard Stevens, p. 52.

[2]
https://github.com/medoc92/upmpdcli/pull/13

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-undefined-OPEN_MAX-error.patch        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/upmpdcli/0001-Fix-undefined-OPEN_MAX-error.patch

diff --git a/package/upmpdcli/0001-Fix-undefined-OPEN_MAX-error.patch b/package/upmpdcli/0001-Fix-undefined-OPEN_MAX-error.patch
new file mode 100644
index 0000000..d74eb99
--- /dev/null
+++ b/package/upmpdcli/0001-Fix-undefined-OPEN_MAX-error.patch
@@ -0,0 +1,37 @@
+From eb2fb0b2ce8987c5288c571cfb0586710c4486bb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 16 Jul 2015 22:24:13 +0200
+Subject: [PATCH 1/1] Fix undefined OPEN_MAX error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Not all systems define POSIX.1 value OPEN_MAX. In this case just close
+all descriptors up to some arbitrary limit - say 256 [1].
+
+[1]
+Advanced Programming in the UNIX Environment, Richard Stevens, p. 52.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/closefrom.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/closefrom.cpp b/src/closefrom.cpp
+index a713875..4429b20 100644
+--- a/src/closefrom.cpp
++++ b/src/closefrom.cpp
+@@ -154,6 +154,10 @@ int libclf_closefrom(int fd0)
+ 
+ static int closefrom_maxfd = -1;
+ 
++#ifndef OPEN_MAX
++#define OPEN_MAX 256 /* Guess */
++#endif
++
+ void libclf_setmaxfd(int max)
+ {
+     closefrom_maxfd = max;
+-- 
+2.4.6
+
-- 
2.4.6
