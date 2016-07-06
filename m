From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:44:08 +0200
Subject: [Buildroot] [git commit] opus: don't use assembly when on ARM,
	but without ARM instructions
Message-ID: <20160706195122.9552580842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d55c6b132e2f4835b6af6e5055c985ad5f715936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARM assembly code in opus uses full ARM instructions, which won't
work on Thumb-2 only platforms such as ARMv7-M, so we disable the
assembly code in such situations.

Fixes:

  http://autobuild.buildroot.net/results/ffa12ab7abadd76901228fc82da24e81bb6da625/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opus/opus.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index f746a2f..71fdcb3 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -14,4 +14,10 @@ ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
 endif
 
+# When we're on ARM, but we don't have ARM instructions (only
+# Thumb-2), disable the usage of assembly as it is not Thumb-ready.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
+OPUS_CONF_OPTS += --disable-asm
+endif
+
 $(eval $(autotools-package))
