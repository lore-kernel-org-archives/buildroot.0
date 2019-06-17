From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 17 Jun 2019 23:21:34 +0200
Subject: [Buildroot] [git commit] package/iputils: fix IPUTILS_PERMISSIONS
Message-ID: <20190617212319.F06E28F3FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=960076cc5bfda250770d9ab6af60a1da561cda4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The IPUTILS_PERMISSIONS variable was wrong, because iputils installs
its programs in /usr/bin, not in /bin. It probably was only tested
with the merged /usr option enabled.

This commit fixes IPUTILS_PERMISSIONS, taking into account the change
done in 6e18892733 "package/iputils: move binaries to the location also
used by Busybox":

 - arping is moved by the post-install target hook to /usr/sbin

 - clockdiff is installed by iputils in /usr/bin

 - ping is moved by the post-install target hook to /bin, which makes
   the previously incorrect path in IPUTILS_PERMISSIONS now correct

Fixes:

  http://autobuild.buildroot.net/results/fe378bca29c86a681ba9ad40386cb89248195c50/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iputils/iputils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 7bd756f040..052110878a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -66,9 +66,9 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-	/bin/arping      f 4755 0 0 - - - - -
-	/bin/clockdiff   f 4755 0 0 - - - - -
-	/bin/ping        f 4755 0 0 - - - - -
+	/usr/sbin/arping      f 4755 0 0 - - - - -
+	/usr/bin/clockdiff    f 4755 0 0 - - - - -
+	/bin/ping             f 4755 0 0 - - - - -
 endef
 
 $(eval $(meson-package))
