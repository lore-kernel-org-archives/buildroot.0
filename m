From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Sep 2017 11:17:18 +0300
Subject: [Buildroot] [PATCH] flashrom: fix static build with uClibc
Message-ID: <c35f0becf1a31f14275820c0f1c3e5d1742ded47.1505895438.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define HAVE_STRNLEN to avoid local strnlen() definition.

Fixes:
http://autobuild.buildroot.net/results/7dc/7dc4298e3a07c73e03f70205516d68a0f4c2d297/
http://autobuild.buildroot.net/results/e36/e362848eb45f6b8100131361e6e5faa546f0bbd8/
http://autobuild.buildroot.net/results/69e/69ef10ec710f418b4d10c1edb4f2ce2e49b522bf/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
It seems like only uClibc is affected. Build with musl succeeds even
though the resulting binary contains a global strnlen symbol.
---
 package/flashrom/flashrom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 4ecdce8f4136..f9ab6294a524 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -12,7 +12,8 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
 define FLASHROM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" -C $(@D)
 endef
 
 define FLASHROM_INSTALL_TARGET_CMDS
-- 
2.14.1
