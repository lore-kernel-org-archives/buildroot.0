From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 12 Aug 2020 20:18:21 +0300
Subject: [Buildroot] [PATCH v2] package/apcupsd: add -lstdc++ for ARC7* and
 SPARC
Message-ID: <20200812171821.2517-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason apcupsd is not building for ARC700 and SPARC,
adding "-lstdc++" solves the issue.

Fixes:
http://autobuild.buildroot.org/results/3be/3bedf404de0ea42ee3ba624cded65d310a847af9//
http://autobuild.buildroot.org/results/6ab/6ab4e8021aad13bc153a6c22e87a77bf2bdc21e0//

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
Changes since v1:
-Removed commented lines

 package/apcupsd/apcupsd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 410bce9aec..d2001419d6 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -18,6 +18,10 @@ APCUPSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libusb`"
 endif
 endif
 
+ifeq ($(BR2_arc770d)$(BR2_arc750d)$(BR2_sparc),y)
+APCUPSD_CONF_ENV += LIBS+="-lstdc++"
+endif
+
 ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
 APCUPSD_CONF_OPTS += --enable-apcsmart
 else
-- 
2.16.2
