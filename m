From: Jordan Yelloz <jordan@yelloz.me>
Date: Mon, 12 Dec 2016 10:13:54 -0800
Subject: [Buildroot] [PATCH 1/1] lvm2: ensured TARGET_AR is used during build
Message-ID: <20161212181354.18098-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same way TARGET_CC was not being used during the build, TARGET_AR
was not used either. Now TARGET_CONFIGURE_OPTS is injected into
LVM2_MAKE_ENV which should include all the toolchain substitutions.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/lvm2/lvm2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index ae9581caaef4..a2d484bc250a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -20,8 +20,8 @@ LVM2_CONF_OPTS += \
 	--enable-dmeventd
 
 # LVM2 uses autoconf, but not automake, and the build system does not
-# take into account the CC passed at configure time.
-LVM2_MAKE_ENV = CC="$(TARGET_CC)"
+# take into account the toolchain passed at configure time.
+LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 LVM2_DEPENDENCIES += readline
-- 
2.11.0
