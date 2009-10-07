From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:39 +0200
Subject: [Buildroot] [PATCH 16/23] qt: disable precompiled headers when
	ccache is enabled
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-17-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ccache and precompiled headers don't work together, so disable
precompiled headers when ccache is enabled.

The benefit of ccache compiling Qt a second or more time is much
higher than the costs of disabled precompiled headers in the first run.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f1e845e..8491195 100644
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
