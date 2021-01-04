From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2021 17:58:18 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] boot/lpc32xxcdl: switch
 upstream location
Message-ID: <20210104164307.1D77084C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a66200f6b304df3bea280d9b5a99633c402cb681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The upstream git tree has disappeared, but a ZIP file is still hosted
somewhere at NXP. The content of that zip file has been verified to be
100% identical to the tarball we hosted on s.b.o.

As this is a zip file, we can't use the generic extract commands, and
must come up with our own. As such, it no longer makes sense to fix the
CRLF as a post-extract hook; this is moved to the extract command.

Add a hash file while at it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bd560b6da54d65dcf2e6d67ec675238c3a0cc727)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/lpc32xxcdl/lpc32xxcdl.hash |  2 ++
 boot/lpc32xxcdl/lpc32xxcdl.mk   | 13 +++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl.hash b/boot/lpc32xxcdl/lpc32xxcdl.hash
new file mode 100644
index 0000000000..8c6b73d63f
--- /dev/null
+++ b/boot/lpc32xxcdl/lpc32xxcdl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  ded3fa936a96d3fb8188ca6214f57b5208bd49e5416bd69f38bfc810b34197bc  lpc32xx_cdl-v2.11.zip
diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index 30afed050b..9f5cd27f50 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LPC32XXCDL_VERSION = lpc32xx_cdl_v2.11
-LPC32XXCDL_SITE = http://git.lpcware.com/lpc3xxx_cdl.git
-LPC32XXCDL_SITE_METHOD = git
+LPC32XXCDL_VERSION = 2.11
+LPC32XXCDL_SOURCE = lpc32xx_cdl-v$(LPC32XXCDL_VERSION).zip
+LPC32XXCDL_SITE = https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/lpcware-archive/61/2
 
 LPC32XXCDL_INSTALL_TARGET = NO
 LPC32XXCDL_INSTALL_IMAGES = YES
@@ -45,13 +45,14 @@ LPC32XXCDL_BOARD_STARTUP_DIR = \
 # Source files are with dos newlines, which our patch infrastructure doesn't
 # handle. Work around it by converting the affected files to unix newlines
 # before patching
-define LPC32XXCDL_DOS2UNIX_FOR_PATCH
+define LPC32XXCDL_EXTRACT_CMDS
+	unzip $(LPC32XXCDL_DL_DIR)/$(LPC32XXCDL_SOURCE) -d $(@D)
+	mv $(@D)/lpc3xxx_cdl/* $(@D)
+	rmdir $(@D)/lpc3xxx_cdl/
 	sed -n 's|^[+-]\{3\} [^/]\+\([^ \t]*\)\(.*\)|$(@D)\1|p' \
 		boot/lpc32xxcdl/*.patch| sort -u | xargs $(SED) 's/\x0D$$//'
 endef
 
-LPC32XXCDL_POST_EXTRACT_HOOKS += LPC32XXCDL_DOS2UNIX_FOR_PATCH
-
 define LPC32XXCDL_BUILD_CMDS
 	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)
 	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)
