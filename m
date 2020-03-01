From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  1 Mar 2020 12:17:46 -0300
Subject: [Buildroot] [PATCH/next v2 3/4] package/openrc: add libselinux
 support
In-Reply-To: <20200301151747.25723-1-unixmania@gmail.com>
References: <20200301151747.25723-1-unixmania@gmail.com>
Message-ID: <20200301151747.25723-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If the libselinux package is selected, add the package to the dependency list
and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/openrc/openrc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 6057451bfe..97536dad37 100644
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
2.18.2
