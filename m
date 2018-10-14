From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 22:00:55 +0200
Subject: [Buildroot] [PATCH 2/3] mdadm: move from /usr/sbin to /sbin
In-Reply-To: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
References: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181014200056.20220-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream Makefile by default installs to /sbin but we override
that to install it in /usr/sbin. Since mdadm is a pretty core utility
for the boot process, it makes sense to comply with upstream's default
behavior, so we change mdadm.mk to install mdadm in /sbin. This also
removes the somewhat non-standard DESTDIR value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdadm/mdadm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6efade981d..bdf77fcd56 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -14,14 +14,14 @@ define MDADM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
-		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/usr/sbin\\\"" \
+		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 		CHECK_RUN_DIR=0 \
 		mdadm
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR)/usr \
+		DESTDIR=$(TARGET_DIR) \
 		install-mdadm
 endef
 
-- 
2.14.4
