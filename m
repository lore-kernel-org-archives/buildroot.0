From: Stefan Becker <chemobejk@gmail.com>
Date: Wed,  2 May 2018 12:05:08 +0300
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build host
Message-ID: <20180502090508.12893-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

crypt() is an optional glibc feature. Some distros, like Fedora 28, are
phasing it out to be replaced with libxcrypt [1]. Unfortunately this
change is only ABI compatible, not source code compatible, i.e. the code
will compile with warnings about undefined crypt(), but the resulting
binary will crash.

Follow the guidance in the Fedora bug and include crypt.h when
_XOPEN_CRYPT is not defined.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 package/mkpasswd/mkpasswd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
index 5820f32501..fd16230468 100644
--- a/package/mkpasswd/mkpasswd.c
+++ b/package/mkpasswd/mkpasswd.c
@@ -44,6 +44,11 @@
 #include <sys/time.h>
 #endif
 
+/* glibc without crypt() */
+#ifndef _XOPEN_CRYPT
+#include <crypt.h>
+#endif
+
 /* Application-specific */
 #include "utils.h"
 
-- 
2.17.0
