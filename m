From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 00:27:09 +0200
Subject: [Buildroot] [PATCH] package/glibmm: fix BUG_85180 build timeout
Message-ID: <20190520222709.20566-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling first files.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building glibmm with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CXXFLAGS.

Fixes:
http://autobuild.buildroot.net/results/e19/e196d77626b877dc3454d21febe20a04877c02a9/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/glibmm/glibmm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 71f1dfd36f..06dc9f92e2 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -13,4 +13,8 @@ GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJ
 GLIBMM_INSTALL_STAGING = YES
 GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GLIBMM_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
