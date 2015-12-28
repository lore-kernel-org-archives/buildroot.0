From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 12:28:59 +0100
Subject: [Buildroot] [git commit] libsecret: add patch to fix .pc file for
	static linking
Message-ID: <20151228112950.4FC1581910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a26d2190b0d9240cb550be99286060f0e22729b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .pc file of libsecret needs to be adjusted to account for its
optional dependency on the gcrypt library. The patch has been
submitted upstream for inclusion.

Fixes:

  http://autobuild.buildroot.org/results/c2c/c2c6185cfbd9a0c91266c9e8a5f4221afb14930f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...t.pc-add-Libs.private-field-for-libgcrypt.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch b/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch
new file mode 100644
index 0000000..62bc84c
--- /dev/null
+++ b/package/libsecret/0001-libsecret.pc-add-Libs.private-field-for-libgcrypt.patch
@@ -0,0 +1,38 @@
+From 754897490d9478025d174c2b1c1849305f728324 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Dec 2015 12:13:07 +0100
+Subject: [PATCH] libsecret.pc: add Libs.private field for libgcrypt
+
+When libgcrypt is available, libsecret links with it. When dynamic
+linking is used, there is no problem: libsecret.so has a NEEDED
+pointing to libgcrypt, so linking an application with -lsecret works
+fine. However, when doing static linking, you must specify the entire
+chain of libraries, otherwise you get unresolved symbols errors, such
+as:
+
+host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsecret-1.a(libsecret_1_la-secret-session.o): In function `request_open_session_aes':
+build/libsecret-0.18.3/libsecret/secret-session.c:99: undefined reference to `gcry_mpi_release'
+build/libsecret-0.18.3/libsecret/secret-session.c:101: undefined reference to `gcry_mpi_aprint'
+build/libsecret-0.18.3/libsecret/secret-session.c:107: undefined reference to `gcry_free'
+
+In order to solve this, we simply need to indicate in the Libs.private
+field of the .pc file that we depend on libgcrypt.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libsecret/libsecret.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsecret/libsecret.pc.in b/libsecret/libsecret.pc.in
+index 0c342ef..d99cf44 100644
+--- a/libsecret/libsecret.pc.in
++++ b/libsecret/libsecret.pc.in
+@@ -11,4 +11,5 @@ Description: GObject bindings for Secret Service API
+ Version: @VERSION@
+ Requires: glib-2.0 gobject-2.0 gio-2.0
+ Libs: -L${libdir} -lsecret- at SECRET_MAJOR@
++Libs.private: @LIBGCRYPT_LIBS@
+ Cflags: -I${includedir}/libsecret- at SECRET_MAJOR@
+-- 
+2.6.4
+
