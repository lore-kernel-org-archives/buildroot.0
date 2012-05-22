From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 May 2012 10:11:47 +0200
Subject: [Buildroot] [git commit] oprofile: fix target-install for archs
	without performance counters support
Message-ID: <20120522081315.5C8A096D7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c73df193c558dfcf8386082548d8bea396960f39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These archs can still use the timer mode.

Fixes http://autobuild.buildroot.org/results/2627ee17e1f1a58520e01c52af365998f648bbc5/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/oprofile/oprofile.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 5da794b..fc21928 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -30,7 +30,10 @@ OPROFILE_DEPENDENCIES = popt binutils
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-	cp -dpfr $(@D)/events/$(OPROFILE_ARCH) $(TARGET_DIR)/usr/share/oprofile
+	if [ -d $(@D)/events/$(OPROFILE_ARCH) ]; then \
+		cp -dpfr $(@D)/events/$(OPROFILE_ARCH) \
+			$(TARGET_DIR)/usr/share/oprofile; \
+	fi
 	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
 	$(INSTALL) -m 755 $(@D)/utils/opcontrol $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
