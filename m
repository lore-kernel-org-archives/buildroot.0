From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 13 Aug 2015 22:16:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: disable Werror
Message-ID: <1439496998-6386-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set `DBG` to an empty value to disable -Werror when building libpfm4. Build
aborts with a musl toolchain because of warnings about redirecting incorrect
header includes.

So -Werror shouldn't be used in released code since it can cause random build
failures on moderate warnings. It also depends on the used toolchain since
different toolchains may or may not print the same warnings.

Fixes:
http://autobuild.buildroot.net/results/6df/6df9b94a79be1dc5ba878f7b67bf9ad4ce2f2e98/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libpfm4/libpfm4.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index e2fff80..7f14758 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -13,7 +13,8 @@ LIBPFM4_INSTALL_STAGING = YES
 
 LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
 	CC="$(TARGET_CC)" LDCONFIG=true \
-	CONFIG_PFMLIB_SHARED=$(if $(BR2_STATIC_LIBS),n,y)
+	CONFIG_PFMLIB_SHARED=$(if $(BR2_STATIC_LIBS),n,y) \
+	DBG=
 
 define LIBPFM4_BUILD_CMDS
 	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
-- 
2.5.0
