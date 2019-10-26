From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:56:23 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: explicitly
 pass --build-id=none if BR2_REPRODUCIBLE
Message-ID: <20191026145803.EEC208868C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b285c8014349e8eeaa3a2faa043628840c588096
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build ID is added to binaries at link time. Building in different
output directories causes some packages to have different Build IDs,
thus resulting in non-reproducibility.

Adding "-Wl,--build-id=none" fixes this issue by disabling setting of
Build ID.

Diffoscope output for Build ID issue:
https://gitlab.com/snippets/1886180/raw

After this patch, build is reproducible - i.e. diffoscope does not
produce any output.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 970bde76a0..88695a5b2d 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -21,6 +21,10 @@ TOOLCHAIN_WRAPPER_OPTS = \
 	$(call qstrip,$(BR2_SSP_OPTION)) \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
+endif
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
 TOOLCHAIN_WRAPPER_ARGS += \
