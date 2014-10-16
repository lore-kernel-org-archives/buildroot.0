From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 11:01:45 +0200
Subject: [Buildroot] [git commit] getent: look for glibc's getent in more
	places
Message-ID: <20141016091303.1354DB7801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f971ecf722e19a3f1ac9db4c3391097d189f4df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External toolchains don't always install the executable in /usr/bin -
God knows why. So check in a few more places.

We can use make's $(wildcard ...) here, because the variable only gets
expanded when the install step is executed, and by that time the
STAGING_DIR has already been installed.

Probably fixes most getent autobuilder errors, at least if fixes
http://autobuild.buildroot.net/results/615b9d17f713b4a53192efb00188560a76b9efa3/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/getent/getent.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
