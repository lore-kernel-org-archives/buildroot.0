From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Dec 2018 22:51:55 +0100
Subject: [Buildroot] [PATCH] infra/pkg-generic: use readlink instead of
 realpath
Message-ID: <20181201215155.29106-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

realpath is missing on oldish distributions, like Debian 7, which is
still sued in the wild.

Use readlink instead; that has been available since the dawn of ages now
(well, coreutils had it in 2003).

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 649a7ad187..6a0c9377ca 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -280,8 +280,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
-				-e 's, at STAGING_DIR@,$$(dirname $$(realpath -e $$0))/../..,g' \
-				-e 's, at HOST_DIR@,$$(dirname $$(realpath -e $$0))/../../../..,g' \
+				-e 's, at STAGING_DIR@,$$(dirname $$(readlink -e $$0))/../..,g' \
+				-e 's, at HOST_DIR@,$$(dirname $$(readlink -e $$0))/../../../..,g' \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
-- 
2.14.1
