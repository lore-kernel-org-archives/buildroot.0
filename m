From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 21:22:41 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/git: work around
 gcc bug 85180
Message-ID: <20190820191939.C0AA683C75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9be0bf7c976dd6d1d7fe214b4540858e799e1541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building git with optimization but not when building with
-O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force
using -O0.

Fixes:

  http://autobuild.buildroot.net/results/7ad/7adff001631053ae5a3cb3e176d321f6a2d3cceb/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7c7c0e4406aea45b2db0a932b128960b4ef4b474)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index 804a6e2325..b1434fb7be 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -66,6 +66,14 @@ ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 GIT_MAKE_OPTS += NO_GETTEXT=1
 endif
 
+GIT_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GIT_CFLAGS += -O0
+endif
+
+GIT_CONF_OPTS += CFLAGS="$(GIT_CFLAGS)"
+
 GIT_INSTALL_TARGET_OPTS = $(GIT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 
 # assume yes for these tests, configure will bail out otherwise
