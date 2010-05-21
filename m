From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:36 +0200
Subject: [Buildroot] [PATCH 16/19] lvm2: do not override CC and similar
	variables
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0c44617e7f16f2e925fb2672d84bbc9dfccec0f8.1274428596.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since lvm2 uses autoconf, there's no point in overriding CC and other
variables at build time. This causes build breakage as CFLAGS aren't
used at link time, therefore --sysroot lacks, which breaks the build
with external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index bc6f458..2bd6b8b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -74,7 +74,7 @@ $(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
 
 
 $(LVM2_DIR)/.built: $(LVM2_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
+	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
 	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
 	# Fixup write permissions so that the files can be overwritten
 	# several times in the $(TARGET_DIR)
-- 
1.6.3.3
