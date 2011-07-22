From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2011 12:27:29 -0300
Subject: [Buildroot] [PATCH] iproute2: fixup CCOPTS to unbreak build
Message-ID: <1311348449-15782-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CCOPTS is also used for HOSTCC in the netem/ directory which contains
host tools so just ditch it there to avoid extra non-native
optimizations to sweep by.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index bafb8c0..0e6a431 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -34,6 +34,7 @@ define IPROUTE2_CONFIGURE_CMDS
 endef
 
 define IPROUTE2_BUILD_CMDS
+	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
 	$(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
-- 
1.7.3.4
