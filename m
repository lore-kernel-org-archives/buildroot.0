From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 11:32:36 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libtomcrypt:
 compile with -fPIC to enable linking to dynamic libraries/exectuables
Message-ID: <20210508090838.C1C8C86B12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8addf4b71eafc55e5f5c4c8828ad892799444169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:

  .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC

when building a shared library that links with libtomcrypt. Our only
internal user dropbear doesn't do this, so there are no autobuilder
failures.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ec2ee79ec18f945e15ca45471dc06c78a9cc1da1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtomcrypt/libtomcrypt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index fccd4b051c..35886057d4 100644
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
