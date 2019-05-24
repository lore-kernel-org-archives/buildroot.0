From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:48:47 +0200
Subject: [Buildroot] [git commit] package/glibmm: work around gcc bug 85180
Message-ID: <20190524194250.CFF958D1FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d8d4ecaf1bc22a89d0f373e9d1655f59f283480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building glibmm with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y,
we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/e196d77626b877dc3454d21febe20a04877c02a9/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CXXFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 71f1dfd36f..a0abb7a49d 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -13,4 +13,12 @@ GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJ
 GLIBMM_INSTALL_STAGING = YES
 GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
 
+GLIBMM_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GLIBMM_CXXFLAGS += -O0
+endif
+
+GLIBMM_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS)"
+
 $(eval $(autotools-package))
