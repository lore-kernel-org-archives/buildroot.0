From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 16:33:07 +0200
Subject: [Buildroot] [git commit] beecrypt: arm assembly optimizations needs
	ARM instructions support
Message-ID: <20160627143608.6B1DE7FEA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee525dc3892c1efd3d69af3401e4908d3217d286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/980/98034ebb086987fb8fc004672164f609f5a69543/
http://autobuild.buildroot.net/results/3bd/3bdba5cf7e901f8600e567b1b0eb0866d6dfc523/

So disable it for thumb(2)-only configurations (armv7m), similar to how we
do it for m68k coldfire.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/beecrypt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 4fcdf43..bd29b3b 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -22,6 +22,11 @@ ifeq ($(BR2_m68k_cf),y)
 BEECRYPT_CONF_OPTS += --enable-debug
 endif
 
+# arm asm optimization doesn't work for thumb-only
+ifeq ($(BR2_arm):$(BR2_ARM_CPU_HAS_ARM),y:)
+BEECRYPT_CONF_OPTS += --enable-debug
+endif
+
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 BEECRYPT_CONF_OPTS += --with-cplusplus
