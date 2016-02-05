From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:09:11 +0100
Subject: [Buildroot] [git commit] package/rsyslog: fix musl buil
Message-ID: <20160205221225.6D1FE7FE53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=561c43d8323575296a31a4e54c9966ced730c54a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error was not yet being found by the autobuilders:

omfile.c: In function ???prepareFile???:
omfile.c:580:3: error: implicit declaration of function ???open??? [-Werror=implicit-function-declaration]
   fd = open((char*) newFileName, O_WRONLY|O_APPEND|O_CREAT|O_NOCTTY|O_CLOEXEC,
   ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/0001-musl-fcntl-h.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/rsyslog/0001-musl-fcntl-h.patch b/package/rsyslog/0001-musl-fcntl-h.patch
new file mode 100644
index 0000000..5c2daee
--- /dev/null
+++ b/package/rsyslog/0001-musl-fcntl-h.patch
@@ -0,0 +1,30 @@
+From 835571774dc519dd2cff7ab1020cf298cc953a8f Mon Sep 17 00:00:00 2001
+From: Thordur Bjornsson <thorduri@secnorth.net>
+Date: Tue, 7 Jul 2015 12:34:08 +0200
+Subject: [PATCH] omfile: unconditionally include fcntl.h.
+
+required for open() flags
+
+Signed-off-by: Thordur Bjornsson <thorduri@secnorth.net>
+[Bernd: downloaded from upstream commit:
+ https://github.com/rsyslog/rsyslog/commit/835571774dc519dd2cff7ab1020cf298cc953a8f
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ tools/omfile.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/tools/omfile.c b/tools/omfile.c
+index 482e723..4444b97 100644
+--- a/tools/omfile.c
++++ b/tools/omfile.c
+@@ -48,9 +48,7 @@
+ #include <libgen.h>
+ #include <unistd.h>
+ #include <sys/file.h>
+-#ifdef OS_SOLARIS
+-#	include <fcntl.h>
+-#endif
++#include <fcntl.h>
+ #ifdef HAVE_ATOMIC_BUILTINS
+ #	include <pthread.h>
+ #endif
