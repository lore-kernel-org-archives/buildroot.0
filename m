From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:52 +0200
Subject: [Buildroot] [git commit] iproute2: disable xtables on static build
Message-ID: <20150521212656.B286A800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72e548a48036dce6a7ee5cfebc7cdefd9ffb8442
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iproute2 always builds m_xt.so as a shared library.

Fixes:
http://autobuild.buildroot.net/results/f42/f42bbbf5be4594a8806d0e571586ce2bf119582d/
http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 9595165..3315d67 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -18,7 +18,7 @@ IPROUTE2_DEPENDENCIES += busybox
 endif
 
 # If we've got iptables enable xtables support for tc
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
+ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 define IPROUTE2_WITH_IPTABLES
 	# Makefile is busted so it never passes IPT_LIB_DIR properly
@@ -29,6 +29,7 @@ else
 define IPROUTE2_WITH_IPTABLES
 	# em_ipset needs xtables, but configure misdetects it
 	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
+	echo "TC_CONFIG_XT:=n" >>$(IPROUTE2_DIR)/Config
 endef
 endif
 
