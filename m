From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:24:52 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: handle
 __{BASE_, }FILE__ macro for reproducibility
Message-ID: <20200106221707.DF1A8829F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71d690145474554eb3310fa57db3a335bad6c242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many tools use __FILE__ or __BASE_FILE__ for debugging and both
capture the build path. This results in non-reproducible images when
building in different directories.

If the config uses GCC 8 or above, we use -ffile-prefix-map=old=new
and let gcc take care of the path remapping in __FILE__. Since GCC
versions before v8 did not have this feature, we use an empty string
in that case, and disable the builtin-macro-redefined warning which
would otherwise trigger and cause build issues with -Werror.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
[Thomas:
 - as suggested by Arnout, use the empty string for the __FILE__ and
   __BASE_FILE__ value
 - as suggested by Romain, also handle __BASE_FILE__ in addition to
   __FILE__
 - pass -Wno-builtin-macro-redefined to avoid build errors when
   -Werror is passed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 88695a5b2d..09dda17890 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -23,6 +23,11 @@ TOOLCHAIN_WRAPPER_OPTS = \
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
+else
+TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
+endif
 endif
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
