From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 22:05:03 +0100
Subject: [Buildroot] [git commit] package/rcw : bump to LSDK-19.09
Message-ID: <20200322205323.1372884D73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d461391b316aaf67c25bf2d8924b84ef584e3216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new rcw.py script is python3-only, but we can use either the
system-provided python3, or the one we build with host-python3 if
the system does not have it already.

It turns out, also, that rcw.py is using #!/usr/bin/env python3,
so it will easily find it from $PATH, so we export it in the
environment.

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
[yann.morin.1998 at free.fr:
  - set the proper PATH in the envioronment
  - do not explicitly call python3, defer to /usr/bin/env in the script
  - add an accompagnying comment
  - rewrite commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rcw/rcw.hash |  2 +-
 package/rcw/rcw.mk   | 11 ++++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
index 7de1ec659a..76b6373942 100644
--- a/package/rcw/rcw.hash
+++ b/package/rcw/rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
+sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index dbfeae7b21..22e3be4f13 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-RCW_VERSION = LSDK-18.12
+RCW_VERSION = LSDK-19.09
 RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
 
-HOST_RCW_DEPENDENCIES = host-python
+HOST_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
 
@@ -40,8 +40,13 @@ define HOST_RCW_ADD_CUSTOM_RCW_FILES
 endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
 
+# rcw.py is a python3-only script, and we can be using either the
+# system-provided python3, or our own built with host-python3.
+# Fortunately, rcw.py uses #!/usr/bin/env python3, so it will
+# easily find it from PATH.
 define HOST_RCW_BUILD_CMDS
-	$(HOST_DIR)/bin/python $(@D)/rcw.py \
+	PATH=$(BR_PATH) \
+	$(@D)/rcw.py \
 		-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
 		-I $(@D)/custom_board -o $(@D)/PBL.bin
 endef
