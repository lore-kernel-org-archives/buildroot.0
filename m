From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] lvm2: do not override CC and
	similar variables
Message-ID: <20100521184449.6A96A9C152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c44617e7f16f2e925fb2672d84bbc9dfccec0f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
