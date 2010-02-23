From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:57 +0100
Subject: [Buildroot] [PATCH 33/40] lvm2: prevent dmsetup from being
	re-installed every time
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3b5d95be8dfc8a23f4e4619686215a9c99a1a9a6.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After being copied to target/, touch dmsetup so that its date is newer
than the .built stamp file in lvm2 source directory. This prevents
make from re-installing dmsetup every time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index d190be2..bc6f458 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -86,9 +86,11 @@ $(LVM2_DIR)/.built: $(LVM2_DIR)/.configured
 
 $(LVM2_TARGET_SBINS) $(LVM2_TARGET_DMSETUP_SBINS): $(LVM2_DIR)/.built
 	cp -a $(STAGING_DIR)/sbin/$(notdir $@) $@
+	touch $@
 
 $(LVM2_TARGET_LIBS): $(LVM2_DIR)/.built
 	cp -a $(STAGING_DIR)/lib/$(notdir $@) $@
+	touch $@
 
 
 ifeq ($(BR2_PACKAGE_LVM2_DMSETUP_ONLY),y)
-- 
1.6.3.3
