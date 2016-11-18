From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 18 Nov 2016 15:26:31 -0500
Subject: [Buildroot] [PATCH 1/1] chrony: enable pps support
Message-ID: <20161118202631.10900-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chrony has the ability to support PPS. Its enablement is determined
primarily from the existence of `sys/timepps.h`. This file is provided
from the pps-tools package. Adjusting Chrony's Makefile to depend on the
pps-tools package if a developer has included pps-tools as part of a
build. Relates to 2cfc966f431c7c715b3fc11ca0467d47432fca33.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/chrony/chrony.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index adfbd36..5f3160e 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -34,6 +34,12 @@ else
 CHRONY_CONF_OPTS += --disable-readline
 endif
 
+# If pps-tools is available, build it before so the package can use it
+# (HAVE_SYS_TIMEPPS_H).
+ifeq ($(BR2_PACKAGE_PPS_TOOLS),y)
+CHRONY_DEPENDENCIES += pps-tools
+endif
+
 define CHRONY_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
 endef
-- 
2.8.4.windows.1
