From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:59:29 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/ninja: invoke
 python3 explicitly to configure the package
Message-ID: <20191118125301.D41C58F181@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1400dd65ca942785a6a8c1daed2acb0f23f7287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

ninja depends on python3 specifically, but the configure.py file
simply uses "env python". Where no python is selected for the target
you simply won't get a python symlink in $(HOST_DIR)/usr/bin, so the
configure.py script fails to run since it can't find "python".

Notice that in order to reproduce the issue, you must not have
python2 installed on your host machine.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f31cd33cefc0fd71f41459d39c42b049ade3605d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ninja/ninja.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 4897012150..281cd70412 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -17,7 +17,7 @@ NINJA_LICENSE_FILES = COPYING
 HOST_NINJA_DEPENDENCIES = host-python3
 
 define HOST_NINJA_BUILD_CMDS
-	(cd $(@D); ./configure.py --bootstrap)
+	(cd $(@D); $(HOST_DIR)/bin/python3 configure.py --bootstrap)
 endef
 
 define HOST_NINJA_INSTALL_CMDS
