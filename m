From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 10:19:09 +0100
Subject: [Buildroot] [git commit] gpm: fixes build error when makeinfo is
	not installed on host
Message-ID: <20140204091934.EE7959C784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45f756ee9e215e267351c4870cf3507a3d4e36f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with: make gpm MAKEINFO=no
Should fix http://autobuild.buildroot.net/results/fbf/fbf42eac7cf09b2f3fc93fa2134ddefcb1beea2f/build-end.log
Thanks to Romain Naour for pointing out the problem.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpm/gpm.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 6fd5a3f..296966a 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -32,6 +32,15 @@ GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
 
 GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
 
+# gpm tries to build/install .info doc even if makeinfo isn't installed on the
+# host, so we have to disable global doc installation to prevent autobuild
+# errors.
+define GPM_DISABLE_DOC_INSTALL
+	$(SED) 's/SUBDIRS = src doc contrib/SUBDIRS = src contrib/' \
+		$(@D)/Makefile.in
+endef
+GPM_POST_PATCH_HOOKS += GPM_DISABLE_DOC_INSTALL
+
 ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
 define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
 	for tools in mev hltest mouse-test display-buttons \
