From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:19:50 +0200
Subject: [Buildroot] [git commit] e2fsprogs: fix build failure of subst.c
Message-ID: <20160603122100.5BBFC820FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d1337e3abd935ae81f2ec7320213c75d7dd4b7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

subst.c is built for the host, but uses defines calculated by the
configure script using the cross-compiler. By passing BUILD_CFLAGS, we
help subst.c include the proper header files, and therefore avoid the
build failure.

Fixes:

  http://autobuild.buildroot.org/results/2a66280800b8aa16fee2701b3f345aa24bb13c35/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index c1cbf71..63f5856 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -43,6 +43,12 @@ ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
 
+# Some programs are built for the host, but use definitions guessed by
+# the configure script (i.e with the cross-compiler). Help them by
+# saying that <sys/stat.h> is available on the host, which is needed
+# for util/subst.c to build properly.
+E2FSPROGS_CONF_ENV += BUILD_CFLAGS="-DHAVE_SYS_STAT_H"
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 # util-linux libuuid pulls in libintl if needed, so ensure we also
 # link against it, otherwise static linking fails
