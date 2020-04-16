From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 16 Apr 2020 00:21:37 -0300
Subject: [Buildroot] [PATCH v2] package/openrc: enable support when
 libselinux is selected
Message-ID: <20200416032137.721705-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

OpenRC suports SELinux, so there is no reason to forcibly disable it.

Notice this only allows OpenRC to perform the initial policy load and
set the enforcing mode. In order really use SELinux it's also necessary
to select refpolicy, which provides a policy, and policycoreutils, which
provides restorecon and other SELinux utilities.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
---
Tested on QEMU, with ext4fs, selecting refpolicy and policycoreutils.
Only disabled and permissive modes were used, since the enforcing mode
currently does not work. See the help text in

    package/refpolicy/Config.in for additional details.
---
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1->v2:
  - Improve the commit message, as suggested by Yann E. MORIN
  - Explain which tests were performed
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
