From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] speech-tools: fix build failure
	by using Debian version and patches
Message-ID: <20100730082547.2117D836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a67e7714706f260ae017f2b2807ddc64eab944a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream version of speech-tools does not build with GCC >= 4.3,
mainly due to changes in how C++ headers are included. This is fixed
in Debian, so let's use the Debian version and patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../festival/speech-tools/speech-tools.mk          |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/festival/speech-tools/speech-tools.mk b/package/multimedia/festival/speech-tools/speech-tools.mk
index 0aa44cc..66bd308 100644
--- a/package/multimedia/festival/speech-tools/speech-tools.mk
+++ b/package/multimedia/festival/speech-tools/speech-tools.mk
@@ -3,9 +3,11 @@
 # speech-tools
 #
 #############################################################
-SPEECH_TOOLS_VERSION = 1.2.96-beta
-SPEECH_TOOLS_SOURCE = speech_tools-$(SPEECH_TOOLS_VERSION).tar.gz
-SPEECH_TOOLS_SITE = http://festvox.org/packed/festival/1.96
+
+SPEECH_TOOLS_VERSION = 1.2.96~beta
+SPEECH_TOOLS_SOURCE = speech-tools_$(SPEECH_TOOLS_VERSION).orig.tar.gz
+SPEECH_TOOLS_PATCH = speech-tools_$(SPEECH_TOOLS_VERSION)-6.diff.gz
+SPEECH_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/speech-tools/
 SPEECH_TOOLS_AUTORECONF = NO
 SPEECH_TOOLS_INSTALL_STAGING = NO
 SPEECH_TOOLS_INSTALL_TARGET = YES
@@ -14,6 +16,15 @@ SPEECH_TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) in
 SPEECH_TOOLS_CONF_OPT =
 SPEECH_TOOLS_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"
 
+define SPEECH_TOOLS_DEBIAN_PATCH_APPLY
+	# Use the order of the quilt patch series to apply the patches
+	for p in $$(cat $(@D)/debian/patches/series) ; do \
+                toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches $$p; \
+        done
+endef
+
+SPEECH_TOOLS_POST_PATCH_HOOKS += SPEECH_TOOLS_DEBIAN_PATCH_APPLY
+
 SPEECH_TOOLS_DEPENDENCIES = ncurses
 
 $(eval $(call AUTOTARGETS,package/multimedia/festival,speech-tools))
-- 
1.7.1
