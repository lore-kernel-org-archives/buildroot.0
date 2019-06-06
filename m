From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:50:28 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/glibmm: work
 around gcc bug 85180
Message-ID: <20190606154047.1B90D8039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=149a13881f0df3e16e19fccc756f7f3c80cea6db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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

(cherry picked from commit 8d8d4ecaf1bc22a89d0f373e9d1655f59f283480)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
