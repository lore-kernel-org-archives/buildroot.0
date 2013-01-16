From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Jan 2013 13:24:54 +0100
Subject: [Buildroot] [git commit] proxychains-ng: copy proxychains.conf to
	target dir
Message-ID: <20130116122450.C20679A1AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10e058b0ee7fd8135fef35bcf24ae985707078c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

proxychains installation does not copy proxychains.conf to
$(TARGET_DIR)/etc anymore so we have to do it manually now.

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proxychains-ng/proxychains-ng.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 9cf24bf..c38a7db 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -7,4 +7,11 @@ PROXYCHAINS_NG_VERSION = 4.4
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
+define PROXYCHAINS_NG_POST_INSTALL_TARGET
+	$(INSTALL) -m 644 -D $(@D)/src/proxychains.conf \
+		$(TARGET_DIR)/etc/proxychains.conf
+endef
+
+PROXYCHAINS_NG_POST_INSTALL_TARGET_HOOKS += PROXYCHAINS_NG_POST_INSTALL_TARGET
+
 $(eval $(autotools-package))
