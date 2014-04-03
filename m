From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:12:46 +0200
Subject: [Buildroot] [git commit] wget: fix autoreconf brokeness
Message-ID: <20140403181311.AAE989C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a2497287fa8fc0afa7698c30284a7674723aa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix failed AUTORECONF under certain circumstances where gettext infra is
much newer (>= 0.18) than what wget source expects (~ 0.17).
Do this by gettextizing the source before AUTORECONFing.
If this becomes common we may need a FOO_GETTEXTIZE generic option, but
for now this seems to be the only package that needs so. Fixes:
http://autobuild.buildroot.net/results/c0f/c0f7c801f61fdc310cde64342060b00a70155431/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 80f8314..f3a5274 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -13,6 +13,14 @@ WGET_LICENSE_FILES = COPYING
 # patching gnulib .m4 file
 WGET_AUTORECONF = YES
 
+# Ugly kludge to fix autoreconf with old gettext infra
+# We need to gettextize before autoreconf to upgrade
+WGET_DEPENDENCIES += host-gettext
+define WGET_GETTEXTIZE
+	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
+endef
+WGET_POST_PATCH_HOOKS += WGET_GETTEXTIZE
+
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	WGET_DEPENDENCIES += busybox
