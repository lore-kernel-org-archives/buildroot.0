From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: disable precompiled headers
	when ccache is enabled
Message-ID: <20091009130116.DF1B077784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82f1ccf4c84101c2611e6e9e7e118258f7c90757
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ccache and precompiled headers don't work together, so disable
precompiled headers when ccache is enabled.

The benefit of ccache compiling Qt a second or more time is much
higher than the costs of disabled precompiled headers in the first run.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 37849f9..ae03fa6 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -315,6 +315,11 @@ else
 QT_CONFIGURE+= -no-stl
 endif
 
+# ccache and precompiled headers don't play well together
+ifeq ($(BR2_CCACHE),y)
+QT_CONFIGURE += -no-pch
+endif
+
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
 # Figure out what libs to install in the target
-- 
1.6.3.3
