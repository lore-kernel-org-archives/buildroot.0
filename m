From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 21:17:56 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/iputils: use
 relative symlink for ping6
Message-ID: <20200110200825.3293E888D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34af64ef98f4ef1f826a8c56fe614b42b4f05fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes (part of):
http://autobuild.buildroot.net/results/5659e1c91831921bd9ad6af670258783771b4dc8/

Commit 6b37dda2a972cdf (package/iputils: create ping6 symlink), added a
ping6 symlink, but used the absolute (build) path to ping as the target,
which is naturally no good at runtime:

ls -l target/bin/ping6
lrwxrwxrwx 1 peko peko 58 Jan 10 08:25 target/bin/ping6 -> /home/peko/source/buildroot/output-iputils/target/bin/ping

Instead use a relative symlink.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 84d471a0b150bc2ff1d08755d36be86d9380c2c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index daceb192f2..d9e3958e1d 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -93,7 +93,7 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
 
 # upstream requires distros to create symlink
 define IPUTILS_CREATE_PING6_SYMLINK
-	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+	ln -sf ping $(TARGET_DIR)/bin/ping6
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
