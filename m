From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:56:20 +0200
Subject: [Buildroot] [git commit] host-mkpasswd: fix crash on Fedora 28
 build host
Message-ID: <20180503195623.7B7E27FCD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c514c2dc5186c4357b2c0fc2e1c4b47e0f555c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crypt() is an optional glibc feature. Some distros, like Fedora 28, are
phasing it out to be replaced with libxcrypt [1]. Unfortunately this
change is only ABI compatible, not source code compatible, i.e. the code
will compile with warnings about undefined crypt(), but the resulting
binary will crash.

Follow the guidance in the Fedora bug and include crypt.h when
_XOPEN_CRYPT is not defined.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
