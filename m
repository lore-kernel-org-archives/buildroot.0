From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 10:51:28 +0200
Subject: [Buildroot] [PATCH 2/2] kismet: fix build when none of client,
	server or drone are selected
In-Reply-To: <cover.1283158281.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283158281.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3c73c7d04ee5b5d2f1a3d88a22bd7eafeb7b1629.1283158281.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Random package configuration can trigger the selection of kismet, but
neither of client, server or drone suboptions. In this case, the
KISMET_TARGET_BINARIES variable is empty, leading to failure during
the installation stage.

At the same time, we remove the useless stripping of the installed
binaries, since this is done globally by the Buildroot infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/kismet.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 1b61ddd..6135c88 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -33,18 +33,19 @@ $(eval $(call AUTOTARGETS,package,kismet))
 
 $(KISMET_TARGET_INSTALL_TARGET):
 	$(call MESSAGE,"Installing")
+ifdef KISMET_TARGET_BINARIES
 	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
+endif
 ifdef KISMET_TARGET_CONFIGS
 	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
 endif
-ifeq ($(BR2_ENABLE_DEBUG),)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
-endif
 	touch $@
 
 $(KISMET_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
+ifdef KISMET_TARGET_BINARIES
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
+endif
 ifdef KISMET_TARGET_CONFIGS
 	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
 endif
-- 
1.7.0.4
