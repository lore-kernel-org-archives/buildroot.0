From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 20 Jul 2015 19:35:46 +0100
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against musl
Message-ID: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/33e/33ef25e4707a5b81083204e0f064570c11d88af6/
---
 package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch | 76 +++++++++++++++++++++++++
 package/acpid/0004-fix-warnings.patch           | 38 +++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
 create mode 100644 package/acpid/0004-fix-warnings.patch

diff --git a/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
new file mode 100644
index 0000000..7d81b3c
--- /dev/null
+++ b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
@@ -0,0 +1,76 @@
+Add missing TEMP_FAILURE_RETRY.
+
+Some external toolchains using strange C libraries (eg MUSL) do not define
+this macro.
+
+Signed-off-by : Brendan Heading <brendanheading@gmail.com>
+
+Index : b/acpid.h
+===================================================================
+--- a/acpid.h
++++ b/acpid.h
+@@ -39,6 +39,18 @@
+ 
+ #define PACKAGE 		"acpid"
+ 
++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
++   set to EINTR.  */
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                             \
++    ({ long int __result;                                                    \
++       do __result = (long int) (expression);                                \
++       while (__result == -1L && errno == EINTR);                            \
++       __result; }))
++#endif
++
+ /*
+  * acpid.c
+  */
+Index : b/kacpimon/libnetlink.h
+===================================================================
+--- a/kacpimon/libnetlink.h
++++ b/kacpimon/libnetlink.h
+@@ -11,6 +11,18 @@
+ #define MSG_CMSG_CLOEXEC 0x40000000
+ #endif
+ 
++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
++   set to EINTR.  */
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__							      \
++    ({ long int __result;						      \
++       do __result = (long int) (expression);				      \
++       while (__result == -1L && errno == EINTR);			      \
++       __result; }))
++#endif
++
+ struct rtnl_handle
+ {
+ 	int			fd;
+Index : b/libnetlink.h
+===================================================================
+--- a/libnetlink.h
++++ b/libnetlink.h
+@@ -11,6 +11,18 @@
+ #define MSG_CMSG_CLOEXEC 0x40000000
+ #endif
+ 
++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
++   set to EINTR.  */
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__							      \
++    ({ long int __result;						      \
++       do __result = (long int) (expression);				      \
++       while (__result == -1L && errno == EINTR);			      \
++       __result; }))
++#endif
++
+ struct rtnl_handle
+ {
+ 	int			fd;
diff --git a/package/acpid/0004-fix-warnings.patch b/package/acpid/0004-fix-warnings.patch
new file mode 100644
index 0000000..3c6a89d
--- /dev/null
+++ b/package/acpid/0004-fix-warnings.patch
@@ -0,0 +1,38 @@
+diff --git a/acpi_listen.c b/acpi_listen.c
+index d0bc175..cc28a43 100644
+--- a/acpi_listen.c
++++ b/acpi_listen.c
+@@ -32,7 +32,7 @@
+ #include <ctype.h>
+ #include <getopt.h>
+ #include <time.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <grp.h>
+ #include <signal.h>
+ 
+diff --git a/event.c b/event.c
+index 324078f..6dfa57d 100644
+--- a/event.c
++++ b/event.c
+@@ -23,7 +23,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <stdio.h>
+diff --git a/sock.c b/sock.c
+index aaba8cd..eb4a3b4 100644
+--- a/sock.c
++++ b/sock.c
+@@ -30,6 +30,7 @@
+ #include <fcntl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <errno.h>
+ #include <grp.h>
+ 
-- 
2.4.3
