From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:23:32 +0200
Subject: [Buildroot] [git commit] vo-aacenc: pass -marm to build non-Thumb2
	compatible assembly
Message-ID: <20140420212440.91EAC9C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc4d0e2f5cc783a826b3bfe4d31c00840407a8e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vo-aacenc has some hand-written assembly that cannot build in Thumb2,
so we have to explicitly pass -marm to make sure this particular
package is always built with full-length ARM instructions.

Fixes:

  http://autobuild.buildroot.org/results/680/680b29cd824624eb8e4ec71187b9a6576444e72b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vo-aacenc/vo-aacenc.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
index 8f01c34..503876f 100644
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -10,13 +10,19 @@ VO_AACENC_LICENSE = Apache-2.0
 VO_AACENC_LICENSE_FILES = COPYING
 VO_AACENC_INSTALL_STAGING = YES
 
+VO_AACENC_CFLAGS = $(TARGET_CFLAGS)
+
 # arm specific asm optimizations
 ifeq ($(BR2_arm),y)
 
+# vo-aacenc has ARM assembly code that cannot be compiled in Thumb2
+# mode, so we must force the traditional ARM mode.
+VO_AACENC_CFLAGS += -marm
+
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 VO_AACENC_CONF_OPT += --enable-armv7neon
 # mfpu=neon needed to assemble neon code
-VO_AACENC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"
+VO_AACENC_CFLAGS += -mfpu=neon
 else
 VO_AACENC_CONF_OPT += --disable-armv7neon
 
@@ -29,4 +35,7 @@ endif
 endif # !neon
 endif # arm
 
+VO_AACENC_CONF_ENV = \
+	CFLAGS="$(VO_AACENC_CFLAGS)"
+
 $(eval $(autotools-package))
