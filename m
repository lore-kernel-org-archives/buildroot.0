From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:14:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/asterisk: fix
 build failure due to gcc bug 93847
Message-ID: <20210316215242.64B3881592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d0ebeeb3df465ccb34a9f08d3db2daad9fa56e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The asterisk package exhibits gcc bug 93847 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93847=y.

Fixes:
http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 830fb82822c4a0948fd2dc45ec7851908220e801)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 6d8edc7d59..c47e0afdac 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -284,6 +284,14 @@ endif
 # Remove default -O3 optimization flag
 ASTERISK_MAKE_OPTS += OPTIMIZE=""
 
+ASTERISK_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
+ASTERISK_CFLAGS += -O0
+endif
+
+ASTERISK_CONF_OPTS += CFLAGS="$(ASTERISK_CFLAGS)"
+
 # We want to install sample configuration files, too.
 ASTERISK_INSTALL_TARGET_OPTS = \
 	$(ASTERISK_DIRS) \
