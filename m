From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  8 Nov 2016 23:39:02 -0800
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for rhel5
	due to missing magic
Message-ID: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RHEL 5.x does have magic.h, but it does not define all expected symbols. In
particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
is using 4.17.

Add substitute defines to allow continued usage of magic but without the
requested exclude checks.

Backported from: b003b2e6f9e54e7b2bde15828b97f5dc285b915e

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...fix-compilation-on-RHEL-5.x-due-to-missin.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/e2fsprogs/0003-libsupport-fix-compilation-on-RHEL-5.x-due-to-missin.patch

diff --git a/package/e2fsprogs/0003-libsupport-fix-compilation-on-RHEL-5.x-due-to-missin.patch b/package/e2fsprogs/0003-libsupport-fix-compilation-on-RHEL-5.x-due-to-missin.patch
new file mode 100644
index 0000000..3569a3a
--- /dev/null
+++ b/package/e2fsprogs/0003-libsupport-fix-compilation-on-RHEL-5.x-due-to-missin.patch
@@ -0,0 +1,45 @@
+From b003b2e6f9e54e7b2bde15828b97f5dc285b915e Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Tue, 25 Oct 2016 13:22:39 -0400
+Subject: [PATCH] libsupport: fix compilation on RHEL 5.x due to missing magic
+ define
+
+RHEL 5.x does have magic.h, but it does not define all expected symbols. In
+particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
+is using 4.17.
+
+Add substitute defines to allow continued usage of magic but without the
+requested exclude checks.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ lib/support/plausible.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/lib/support/plausible.c b/lib/support/plausible.c
+index 6f0c4bc..0636061 100644
+--- a/lib/support/plausible.c
++++ b/lib/support/plausible.c
+@@ -43,6 +43,17 @@ static const char *(*dl_magic_file)(magic_t, const char *);
+ static int (*dl_magic_load)(magic_t, const char *);
+ static void (*dl_magic_close)(magic_t);
+ 
++/*
++ * NO_CHECK functionality was only added in file 4.20.
++ * Older systems like RHEL 5.x still have file 4.17
++ */
++#ifndef MAGIC_NO_CHECK_COMPRESS
++#define MAGIC_NO_CHECK_COMPRESS 0x0001000
++#endif
++#ifndef MAGIC_NO_CHECK_ELF
++#define MAGIC_NO_CHECK_ELF 0x0010000
++#endif
++
+ #ifdef HAVE_DLOPEN
+ #include <dlfcn.h>
+ 
+-- 
+2.1.4
+
-- 
2.1.4
