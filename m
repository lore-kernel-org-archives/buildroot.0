From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:15:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libssh: fix cross compile
 with older cmake
Message-ID: <20181024112026.7C8257FDB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14d4522783e9e8506e6bd7a75e920570bdb9367c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Old version of cmake break cross-compilation when FindThreads is used
because of a try_run call. Add a workaround that avoids try_run.

cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920

Should fix:
http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f34f33baa6f94137a78f15cafe0ee0e4ece59f97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 4295aa42ee..635d72ad98 100644
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
