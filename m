From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:51:41 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/opus: work around
 gcc bug 85180
Message-ID: <20190606154047.3B7538141E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69e8db1f17b8629827537a048603b7ee79870f89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building opus with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/73dc9610a13d6e14eec58d529617210d93d5dec4/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 88ea277369d674c34a5c31cd3ee2243f4ca32b9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index f23461a3af..3fb2d5d65f 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -10,6 +10,14 @@ OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
 
+OPUS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+OPUS_CFLAGS += -O0
+endif
+
+OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
 endif
