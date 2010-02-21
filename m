From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:07 +0100
Subject: [Buildroot] [PATCH 29/38] matchbox: apply libtool patch to
	matchbox-desktop
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5f57d0558a77857902d047164b22fed0d072f28f.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-desktop fails to build because it tries to read
/usr/lib/libxcb.la, which doesn't exist on a very basic system with no
development files instead. The buildroot-libtool.patch must therefore
be applied.

Unfortunately, matchbox doesn't yet use the autotools infrastructure,
so we have to manually apply the patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 06e94cd..8665d41 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -141,6 +141,7 @@ $(MATCHBOX_PL_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_PL_SOURCE)
 $(MATCHBOX_DP_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_DP_SOURCE)
 	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_DP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(SED) 's:mbfolder\.png:mbtasks\.png:g' $(MATCHBOX_DP_DIR)/modules/tasks.c
+	toolchain/patch-kernel.sh $(MATCHBOX_DP_DIR) package/ buildroot-libtool.patch
 	touch $(MATCHBOX_DP_DIR)/.unpacked
 
 $(MATCHBOX_FK_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_FK_SOURCE)
-- 
1.6.3.3
