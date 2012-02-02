From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 16:02:48 +0100
Subject: [Buildroot] [git commit] lpc32xxcdl: fix patch step
Message-ID: <20120202150357.AF880909A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84babf1c1a5fb26d56ee5c534b2ac2c3f9825af2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lpc32xxcdl files have dos newlines, which our patch infrastructure
doesn't handle. Work around it by converting the affected files to unix
newlines before patching.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/lpc32xxcdl/lpc32xxcdl.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index 80f3493..d11be6c 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -42,6 +42,16 @@ LPC32XXCDL_BUILD_FLAGS = \
 LPC32XXCDL_BOARD_STARTUP_DIR = \
 	csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/
 
+# Source files are with dos newlines, which our patch infrastructure doesn't
+# handle. Work around it by converting the affected files to unix newlines
+# before patching
+define LPC32XXCDL_DOS2UNIX_FOR_PATCH
+	sed -n 's|^[+-]\{3\} [^/]\+\([^ \t]*\)\(.*\)|$(@D)\1|p' \
+		boot/lpc32xxcdl/*.patch| sort -u | xargs $(SED) 's/\x0D$$//'
+endef
+
+LPC32XXCDL_POST_EXTRACT_HOOKS += LPC32XXCDL_DOS2UNIX_FOR_PATCH
+
 define LPC32XXCDL_BUILD_CMDS
 	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)
 	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)
