From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 16:41:34 +0100
Subject: [Buildroot] [git commit] tremor: force ARM mode when building to
	avoid Thumb2 build problems
Message-ID: <20121115154220.8AC649A015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=695c4bcebc6093f44d21117489bb72cc7c76c5af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/502b7d3f29d7982d56de2ae4a0b943315e04713b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tremor/tremor.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
