From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:27:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/prboom: work
 around gcc bug 85180
Message-ID: <20190830202308.4C1A0885A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0701c33e7a0cebcd76cc4e16d55f13ac516748a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building prboom with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/e72/e72a2070ab7e9a093c3c70002ee94ee57a6154f6/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 801c83da19163a07b91d3a85a56226fd22832501)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 325bf3eb02..36692d29a3 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -12,6 +12,14 @@ PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
 PRBOOM_AUTORECONF = YES
 
+PRBOOM_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+PRBOOM_CFLAGS += -O0
+endif
+
+PRBOOM_CONF_ENV += CFLAGS="$(PRBOOM_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
 endif
