From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:43:01 +0100
Subject: [Buildroot] [PATCH] tremor: force ARM mode when building to avoid
	Thumb2 build problems
Message-ID: <1352587381-9864-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/502b7d3f29d7982d56de2ae4a0b943315e04713b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tremor/tremor.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index fceee1b..cd1d323 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -12,4 +12,11 @@ TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_DEPENDENCIES = libogg
 
+# tremor has ARM assembly code that cannot be compiled in Thumb2 mode,
+# so we must force the traditional ARM mode.
+ifeq ($(BR2_arm),y)
+TREMOR_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
