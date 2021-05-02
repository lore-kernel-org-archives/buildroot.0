From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 12:50:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libtomcrypt: compile with -fPIC
 to enable linking to dynamic libraries/exectuables
In-Reply-To: <20210502105038.19483-1-ps.report@gmx.net>
References: <20210502105038.19483-1-ps.report@gmx.net>
Message-ID: <20210502105038.19483-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add -fPIC only for non static builds (suggested by Arnout Vandecappelle)
---
 package/libtomcrypt/libtomcrypt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 3d166a6854..d1cf552abd 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -19,6 +19,10 @@ LIBTOMCRYPT_IGNORE_CVES += CVE-2019-17362
 
 LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC
 
+ifeq ($(BR2_STATIC_LIBS),)
+LIBTOMCRYPT_CFLAGS += -fPIC
+endif
+
 define LIBTOMCRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
 endef
-- 
2.31.1
