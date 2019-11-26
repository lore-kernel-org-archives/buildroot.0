From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:51:26 +0100
Subject: [Buildroot] [git commit] package/libdrm: fix nouveau tests compile
 for musl
Message-ID: <20191126214333.E0A2981565@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13f05cbfc0dc9bdc51ab1e0be9585afa2b9a885d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add openembedded provided patch [2] to fix musl toolchain compile failures
because of different ioctl() signatures, (int, int, ...) vs. (int, unsigned
long, ...).

Fixes:

  ../tests/nouveau/threaded.c:39:5: error: conflicting types for 'ioctl'
  int ioctl(int fd, unsigned long request, ...)

[1] http://autobuild.buildroot.net/results/047f149a928ac2a17e25211a0a8a264ebae369ac
[2] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ts-nouveau-threaded-adapt-ioctl-signature.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch b/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch
new file mode 100644
index 0000000000..80845709da
--- /dev/null
+++ b/package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch
@@ -0,0 +1,37 @@
+From 6c7b305869b941e52cb846cbed5e4a5c85d035d9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 18 Jun 2018 15:07:03 +0100
+Subject: [PATCH] tests/nouveau/threaded: adapt ioctl signature
+
+POSIX says ioctl() has the signature (int, int, ...) but glibc has decided to
+use (int, unsigned long int, ...) instead.
+
+Use a #ifdef to adapt the replacement function as appropriate.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+[Taken from https://raw.githubusercontent.com/openembedded/openembedded-core/master/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ tests/nouveau/threaded.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/nouveau/threaded.c b/tests/nouveau/threaded.c
+index 3669bcd..e1c27c0 100644
+--- a/tests/nouveau/threaded.c
++++ b/tests/nouveau/threaded.c
+@@ -36,7 +36,11 @@ static int failed;
+ 
+ static int import_fd;
+ 
++#ifdef __GLIBC__
+ int ioctl(int fd, unsigned long request, ...)
++#else
++int ioctl(int fd, int request, ...)
++#endif
+ {
+ 	va_list va;
+ 	int ret;
+-- 
+2.24.0
+
