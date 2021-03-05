From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 10:11:02 +0100
Subject: [Buildroot] [PATCH 2/2] package/asterisk: fix build failure due to
 gcc bug 93847
In-Reply-To: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
References: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210305091102.2420944-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The asterisk package exhibits gcc bug 93847 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93847=y.

Fixes:
http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/asterisk/asterisk.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index f6a4f8f787..67b6da56db 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -283,6 +283,14 @@ endif
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
-- 
2.25.1
