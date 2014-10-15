From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 15 Oct 2014 14:15:22 +0200
Subject: [Buildroot] [PATCH] getent: look for glibc's getent in more places
Message-ID: <1413375322-27938-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

External toolchains don't always install the executable in /usr/bin -
God knows why. So check in a few more places.

We can use make's $(wildcard ...) here, because the variable only gets
expanded when the install step is executed, and by that time the
STAGING_DIR has already been installed.

Probably fixes most getent autobuilder errors, at least if fixes
http://autobuild.buildroot.net/results/615b9d17f713b4a53192efb00188560a76b9efa3/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Someone should check the Linaro, Arago, Xilinx, and crosstool-NG
toolchains... Or we just wait for the autobuilders :-)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/getent/getent.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/getent/getent.mk b/package/getent/getent.mk
index dd08478..18f0991 100644
--- a/package/getent/getent.mk
+++ b/package/getent/getent.mk
@@ -14,7 +14,11 @@ GETENT_LICENSE = LGPLv2.1+
 # the C library. For other toolchains, we use the wrapper script
 # included in this package.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-GETENT_LOCATION = $(STAGING_DIR)/usr/bin/getent
+# Sourcery toolchains install it in sysroot/usr/lib/bin
+# Buildroot toolchains install it in sysroot/usr/bin
+GETENT_LOCATION = $(firstword $(wildcard \
+	$(STAGING_DIR)/usr/bin/getent \
+	$(STAGING_DIR)/usr/lib/bin/getent))
 else
 GETENT_LOCATION = package/getent/getent
 endif
-- 
2.1.1
