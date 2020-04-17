From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:09:05 +0200
Subject: [Buildroot] [git commit] package/openrc: enable selinux support
 when libselinux is enabled
Message-ID: <20200417195509.CB4C48EF88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eff2c637e2812aca9cb7ead30959766c27b8270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenRC suports SELinux, so there is no reason to forcibly disable it.

Notice this only allows OpenRC to perform the initial policy load and
set the enforcing mode. In order really use SELinux it's also
necessary to select refpolicy, which provides a policy, and
policycoreutils, which provides restorecon and other SELinux
utilities.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
