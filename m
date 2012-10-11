From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 22:28:18 +0200
Subject: [Buildroot] [git commit] scons: fix library installation directory
Message-ID: <20121011202904.28F3F99836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b08979477d65203b9b90c88d2a00246342c0b56a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On gentoo systems SCons setup.py tries to install into
$(HOST_DIR)/usr/lib64 but SCons looks up for its stuff in
$(HOST_DIR)/usr/lib instead hence breaking.
Make it install into $(HOST_DIR)/usr/lib by force to avoid the issue, it
shouldn't matter on other distributions.
Version bumping doesn't fix it.

[Peter: wrapped long line]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/scons/scons.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 2aed62c..7cc234e 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -7,7 +7,8 @@ define HOST_SCONS_BUILD_CMDS
 endef
 
 define HOST_SCONS_INSTALL_CMDS
-	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
+	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr \
+		--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))
 endef
 
 $(eval $(host-generic-package))
