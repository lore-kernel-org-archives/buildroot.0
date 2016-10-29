From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:03:58 +0200
Subject: [Buildroot] [git commit] network-manager: remove bogus --mandir
	option
Message-ID: <20161029130557.E76EA80DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe70f20daece4a845fbcc4ea2e7758c0e006d2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The network-manager.mk passes --mandir=$(STAGING_DIR)/usr/man/, which
causes man pages to be installed in
$(STAGING_DIR)/$(STAGING_DIR)/usr/man and
$(TARGET_DIR)/$(STAGING_DIR)/usr/man.

This is definitely bogus and causes some build failures thanks to the
new check added by Yann E. Morin. This option was in
network-manager.mk since the addition of the package. Maybe it was
fixing a bug in the package logic back at the time, but nowadays, it
causes an installation at the wrong location. Without this commit, the
man pages are properly installed at the right location.

Fixes:

  http://autobuild.buildroot.net/results/92683749b0b8e726bc83781ca6d8e103428362ba/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 663348a..3d7a1bf 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -24,7 +24,6 @@ NETWORK_MANAGER_CONF_ENV = \
 
 
 NETWORK_MANAGER_CONF_OPTS = \
-	--mandir=$(STAGING_DIR)/usr/man/ \
 	--disable-tests \
 	--disable-qt \
 	--disable-more-warnings \
