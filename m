From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 19:54:29 +0100
Subject: [Buildroot] [git commit] package/glm: bump to version 0.9.9.4
Message-ID: <20190327190627.E7F8E82595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e1f99209ae6c3617db19507c7664d38cf1c9314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Disable tests as they are enabled by default since version 0.9.9.1:
  https://github.com/g-truc/glm/commit/d307d390193f4027faec48ac79d7f74b2bec6e56
- Static and shared libraries are always built since version 0.9.9.1:
  https://github.com/g-truc/glm/commit/a23dd2f800185a5e233534fed82fc5c2840fbe5c
  So, disable them as GLM is header-only (it should be noted that
  upstream wants to keep those libraries as the commit to disable them
  has been reverted:
  https://github.com/g-truc/glm/commit/ca8372490eb8742d402878c9e930b891225982e6
- Add hash for license file (now in manual.md#section0)

Fixes:
 - http://autobuild.buildroot.org/results/3cf1fd3387bd4952470edcfcb93d44f58c9e7ff7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glm/glm.hash |  3 ++-
 package/glm/glm.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index c87d4ca2f6..9d5c94301d 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a220e60f8711265595be3221e530d632d5823641ecd46a3a54bc174933bff14c  glm-0.9.8.4.tar.gz
+sha256 3a073eb8f3be07cee74481db0e1f78eda553b554941e405c863ab64de6a2e954  glm-0.9.9.4.tar.gz
+sha256 337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index 1f23146dda..e15d4fea49 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.8.4
+GLM_VERSION = 0.9.9.4
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
-GLM_LICENSE_FILES = copying.txt
+GLM_LICENSE_FILES = manual.md
 
 # GLM is a header-only library, it only makes sense
 # to have it installed into the staging directory.
 GLM_INSTALL_STAGING = YES
 GLM_INSTALL_TARGET = NO
 
+# Don't build libraries as GLM is header-only
+GLM_CONF_OPTS = \
+	-DGLM_TEST_ENABLE=OFF \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DBUILD_STATIC_LIBS=OFF
+
 $(eval $(cmake-package))
