From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:27:31 +0200
Subject: [Buildroot] [git commit] package/libapparmor: fix build on musl
Message-ID: <20201015204335.2A23C817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dad3f09b6b22a3a76dcfb2065e633fab4fc131f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of version 3.0.0 with musl. Since the apparmor and
libapparmor packages share the same sources, we also share their
patches: this is why the patch is added in package/libapparmor/3.0.0,
and a symlink package/apparmor/3.0.0 -> package/libapparmor/3.0.0 is
added.

Fixes:
 - http://autobuild.buildroot.org/results/22fb440240aa698acc68f026be790d5366c8f908

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/3.0.0                             |  1 +
 ...pparmor-add-missing-include-for-socklen_t.patch | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/apparmor/3.0.0 b/package/apparmor/3.0.0
new file mode 120000
index 0000000000..eb1e43a572
--- /dev/null
+++ b/package/apparmor/3.0.0
@@ -0,0 +1 @@
+../libapparmor/3.0.0/
\ No newline at end of file
diff --git a/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch b/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch
new file mode 100644
index 0000000000..2d5114337e
--- /dev/null
+++ b/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch
@@ -0,0 +1,35 @@
+From 47263a3a74d7973e7a54b17db6aa903701468ffd Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Sat, 3 Oct 2020 20:37:55 +0200
+Subject: [PATCH] libapparmor: add missing include for `socklen_t`
+
+While `include/sys/apparmor.h` makes use of `socklen_t`, it doesn't
+include the `<sys/socket.h>` header to make its declaration available.
+While this works on systems using glibc via transitive includes, it
+breaks compilation on musl libc.
+
+Fix the issue by including the header.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+[Retrieved from:
+https://gitlab.com/apparmor/apparmor/-/commit/47263a3a74d7973e7a54b17db6aa903701468ffd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libraries/libapparmor/include/sys/apparmor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libraries/libapparmor/include/sys/apparmor.h b/libraries/libapparmor/include/sys/apparmor.h
+index 32892d065..d70eff947 100644
+--- a/libraries/libapparmor/include/sys/apparmor.h
++++ b/libraries/libapparmor/include/sys/apparmor.h
+@@ -21,6 +21,7 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <unistd.h>
++#include <sys/socket.h>
+ #include <sys/types.h>
+ 
+ #ifdef __cplusplus
+-- 
+GitLab
+
