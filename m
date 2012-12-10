From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 21:56:54 +0100
Subject: [Buildroot] [git commit] barebox: use the symlink to copy the
	barebox binary to the images directory
Message-ID: <20121210210000.4E24E9A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62b13aea1dadea09cdddf06f2b9673bc927dcc0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Barebox creates a symlink to the binary. This symlink points to
the barebox.bin or to the compressed zbarebox.bin binary.

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a025d5f..6cc4976 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -72,7 +72,11 @@ define BAREBOX_BUILD_CMDS
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
-	cp $(@D)/barebox.bin $(BINARIES_DIR)
+	if test -h $(@D)/barebox-flash-image ; then \
+		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+	else \
+		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+	fi
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
