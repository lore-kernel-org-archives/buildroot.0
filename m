From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Aug 2018 00:58:30 +0300
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
Message-ID: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old version of cmake break cross-compilation when FindThreads is used
because of a try_run call. Add a workaround that avoids try_run.

cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920

Should fix:
http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Hi Peter, Yann,

Can one of you test this fix on one of the affected autobuilders?

  http://autobuild.buildroot.net/?reason=libssh-0.8.1

Thanks,
baruch
---
 package/libssh/libssh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 4295aa42ee3b..635d72ad9868 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,6 +17,9 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_SERVER=OFF \
 	-DWITH_EXAMPLES=OFF
 
+# cmake older than 3.10 require this to avoid try_run() in FindThreads
+LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH_CONF_OPTS += -DWITH_ZLIB=ON
 LIBSSH_DEPENDENCIES += zlib
-- 
2.18.0
