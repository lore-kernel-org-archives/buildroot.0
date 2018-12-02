From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Dec 2018 11:22:11 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: use readlink instead
 of realpath
Message-ID: <20181202101918.7AA648A47D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba015cdf04a2ee33615f346448ac2e92aac3865a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

realpath is missing on oldish distributions, like Debian 7, which is
still used in the wild.

Use readlink instead; that has been available since the dawn of ages now
(well, coreutils had it in 2003).

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a27aa1f7fd..f5cab2b9c2 100644
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
