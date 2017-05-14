From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 16:04:30 +0200
Subject: [Buildroot] [git commit] package/bluez_utils: fix test build issues
	with musl
Message-ID: <20170514140452.439AF81D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d09d3a7fa00585ca570a75fee59b9cb3ac983d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add one missing header and avoid encrypt redefinition.

Fixes:
http://autobuild.buildroot.net/results/06c/06c930d9c5299b79500d018ac3fb2861ce834c7c/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bluez_utils/0004-test-add-missing-header.patch |  34 +++++++
 ...test-avoid-conflict-with-encrypt-function.patch | 107 +++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/package/bluez_utils/0004-test-add-missing-header.patch b/package/bluez_utils/0004-test-add-missing-header.patch
new file mode 100644
index 0000000..c74afb8
--- /dev/null
+++ b/package/bluez_utils/0004-test-add-missing-header.patch
@@ -0,0 +1,34 @@
+From d3c098c2fde55ddf0c7d56eae56925103d35da73 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 13 May 2017 18:56:51 +0200
+Subject: [PATCH] test: add missing header
+
+test/attest.c: In function 'at_command':
+test/attest.c:43:2: error: unknown type name 'fd_set'
+  fd_set rfds;
+  ^
+
+Fixes:
+http://autobuild.buildroot.net/results/06c/06c930d9c5299b79500d018ac3fb2861ce834c7c/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ test/attest.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/attest.c b/test/attest.c
+index 12ba682..2626cf1 100644
+--- a/test/attest.c
++++ b/test/attest.c
+@@ -35,6 +35,8 @@
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ 
++#include <sys/select.h>
++
+ #include <bluetooth/bluetooth.h>
+ #include <bluetooth/rfcomm.h>
+ 
+-- 
+2.9.3
+
diff --git a/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch b/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
new file mode 100644
index 0000000..438da97
--- /dev/null
+++ b/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
@@ -0,0 +1,107 @@
+From d8056252d0c99bfb2482f0a420dcf9a36019ddf8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 13 May 2017 18:58:51 +0200
+Subject: [PATCH] test: avoid conflict with encrypt function
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With a musl based toolchain:
+
+test/l2test.c:110:12: error: ???encrypt??? redeclared as different kind of symbol
+ static int encrypt = 0;
+            ^
+In file included from test/l2test.c:34:0:
+[...]/sysroot/usr/include/unistd.h:145:6: note: previous declaration of ???encrypt??? was here
+ void encrypt(char *, int);
+      ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ test/l2test.c | 8 ++++----
+ test/rctest.c | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/test/l2test.c b/test/l2test.c
+index f66486d..9ef6faf 100644
+--- a/test/l2test.c
++++ b/test/l2test.c
+@@ -107,7 +107,7 @@ static char *filename = NULL;
+ static int rfcmode = 0;
+ static int master = 0;
+ static int auth = 0;
+-static int encrypt = 0;
++static int _encrypt = 0;
+ static int secure = 0;
+ static int socktype = SOCK_SEQPACKET;
+ static int linger = 0;
+@@ -340,7 +340,7 @@ static int do_connect(char *svr)
+ 		opt |= L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |= L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (_encrypt)
+ 		opt |= L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= L2CAP_LM_SECURE;
+@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(int sk))
+ 		opt |= L2CAP_LM_MASTER;
+ 	if (auth)
+ 		opt |= L2CAP_LM_AUTH;
+-	if (encrypt)
++	if (_encrypt)
+ 		opt |= L2CAP_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= L2CAP_LM_SECURE;
+@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'E':
+-			encrypt = 1;
++			_encrypt = 1;
+ 			break;
+ 
+ 		case 'S':
+diff --git a/test/rctest.c b/test/rctest.c
+index 4d7c90a..7ad5a0b 100644
+--- a/test/rctest.c
++++ b/test/rctest.c
+@@ -79,7 +79,7 @@ static char *filename = NULL;
+ 
+ static int master = 0;
+ static int auth = 0;
+-static int encrypt = 0;
++static int _encrypt = 0;
+ static int secure = 0;
+ static int socktype = SOCK_STREAM;
+ static int linger = 0;
+@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
+ 		opt |= RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |= RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (_encrypt)
+ 		opt |= RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= RFCOMM_LM_SECURE;
+@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(int sk))
+ 		opt |= RFCOMM_LM_MASTER;
+ 	if (auth)
+ 		opt |= RFCOMM_LM_AUTH;
+-	if (encrypt)
++	if (_encrypt)
+ 		opt |= RFCOMM_LM_ENCRYPT;
+ 	if (secure)
+ 		opt |= RFCOMM_LM_SECURE;
+@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'E':
+-			encrypt = 1;
++			_encrypt = 1;
+ 			break;
+ 
+ 		case 'S':
+-- 
+2.9.3
+
