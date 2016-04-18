From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 13:34:35 +0200
Subject: [Buildroot] [git commit] cannelloni: make SCTP support optional
Message-ID: <20160418113443.E30C2807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85f2e13c637bbc05a428436ef000b5531505b756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 20160414 SCTP support is optional. Introduce an automatic
optional dependency for this protocol.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cannelloni/Config.in     | 1 -
 package/cannelloni/cannelloni.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index 8f3e888..e137e60 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_CANNELLONI
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
 	depends on !BR2_STATIC_LIBS # lksctp-tools
-	select BR2_PACKAGE_LKSCTP_TOOLS
 	help
 	  A SocketCAN over Ethernet tunnel. The tunnel supports both
 	  UDP and SCTP protocols.
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 680e09a..fffdb4b 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -8,6 +8,12 @@ CANNELLONI_VERSION = 20160414
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPLv2
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
-CANNELLONI_DEPENDENCIES = lksctp-tools
+
+ifeq ($(BR2_PACKAGE_LKSCTP_TOOLS),y)
+CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=ON
+CANNELLONI_DEPENDENCIES += lksctp-tools
+else
+CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=OFF
+endif
 
 $(eval $(cmake-package))
