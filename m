From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:50:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/jasper: work
 around gcc bug 85180
Message-ID: <20190606154047.22D0C81DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe3dc0d407f294d27336f131fd5299e04f7de32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building jasper with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y,
we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/5546087cdf684099525dc5824ed428cd0fd74283/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 9fc32f00091989564cf2f0b2bfda97bf0c3c75a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b544a7c1c6..31fded779b 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -25,4 +25,12 @@ else
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=OFF
 endif
 
+JASPER_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+JASPER_CFLAGS += -O0
+endif
+
+JASPER_CONF_OPTS += -DCMAKE_C_FLAGS="$(JASPER_CFLAGS)"
+
 $(eval $(cmake-package))
