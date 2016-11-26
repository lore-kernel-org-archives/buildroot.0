From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 14:59:36 +0100
Subject: [Buildroot] [git commit] chrony: enable pps support
Message-ID: <20161126135948.585E88166A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40a60b7545beea2d1ea852481cbf779d740e1d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Chrony has the ability to support PPS. Its enablement is determined
primarily from the existence of `sys/timepps.h`. This file is provided
from the pps-tools package. Adjusting Chrony's Makefile to depend on the
pps-tools package if a developer has included pps-tools as part of a
build. Relates to 2cfc966f431c7c715b3fc11ca0467d47432fca33.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
