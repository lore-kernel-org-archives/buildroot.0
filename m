From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 15:28:27 -0800
Subject: [Buildroot] [PATCH/next 2/3] package/openrc: add libselinux support
In-Reply-To: <20200229232829.4177324-1-aduskett@gmail.com>
References: <20200229232829.4177324-1-aduskett@gmail.com>
Message-ID: <20200229232829.4177324-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If the libselinux package is selected, add the package to the dependency list
and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openrc/openrc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index b1b3ed2c56..57d156807c 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -18,7 +18,6 @@ OPENRC_MAKE_OPTS = \
 	LIBNAME=lib \
 	LIBEXECDIR=/usr/libexec/rc \
 	MKPKGCONFIG=no \
-	MKSELINUX=no \
 	MKSYSVINIT=yes \
 	BRANDING="Buildroot $(BR2_VERSION_FULL)" \
 	CC=$(TARGET_CC)
@@ -29,6 +28,13 @@ else
 OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENRC_MAKE_OPTS += MKSELINUX=yes
+OPENRC_DEPENDENCIES += libselinux
+else
+OPENRC_MAKE_OPTS += MKSELINUX=no
+endif
+
 define OPENRC_BUILD_CMDS
 	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
 endef
-- 
2.24.1
