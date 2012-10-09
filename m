From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Oct 2012 19:25:56 -0300
Subject: [Buildroot] [PATCH] scons: fix library installation directory
Message-ID: <1349821556-17510-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On gentoo systems SCons setup.py tries to install into
$(HOST_DIR)/usr/lib64 but SCons looks up for its stuff in
$(HOST_DIR)/usr/lib instead hence breaking.
Make it install into $(HOST_DIR)/usr/lib by force to avoid the issue, it
shouldn't matter on other distributions.
Version bumping doesn't fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/scons/scons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 2aed62c..878dcba 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -7,7 +7,7 @@ define HOST_SCONS_BUILD_CMDS
 endef
 
 define HOST_SCONS_INSTALL_CMDS
-	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
+	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr --install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))
 endef
 
 $(eval $(host-generic-package))
-- 
1.7.8.6
