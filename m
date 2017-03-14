From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 14 Mar 2017 15:40:02 +0000
Subject: [Buildroot] [PATCH] libscrypt: -fPIC is needed to build for MIPS
Message-ID: <20170314154002.43673-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The error looks like this:

ld: crypto_scrypt-nosse.o: relocation R_MIPS_26 against `a local symbol'
can not be used when making a shared object; recompile with -fPIC
crypto_scrypt-nosse.o: error adding symbols: Bad value
collect2: error: ld returned 1 exit status

Adding -fPIC to CFLAGS fixes the problem.

Fixes:
  http://autobuild.buildroot.net/results/967ad7fae0137f64b165c986c251d143ac825147

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libscrypt/libscrypt.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index 8f72d67..cb3d69b 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -17,8 +17,16 @@ endef
 LIBSCRYPT_POST_PATCH_HOOKS += LIBSCRYPT_DISABLE_STACK_PROTECTOR
 endif
 
+LIBSCRYPT_CFLAGS = $(TARGET_CFLAGS)
+
+# -fPIC is needed to build for MIPS
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+LIBSCRYPT_CFLAGS += -fPIC
+endif
+
 define LIBSCRYPT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(LIBSCRYPT_CFLAGS)"
 endef
 
 define LIBSCRYPT_INSTALL_STAGING_CMDS
-- 
2.10.2
