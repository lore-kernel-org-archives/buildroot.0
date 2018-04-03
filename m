From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Apr 2018 07:45:24 +0300
Subject: [Buildroot] [PATCH 1/2] prosody: fix build with musl libc
Message-ID: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl libc does not provide the mallinfo() API. Define WITHOUT_MALLINFO
to skip the code using it.

Fixes:
http://autobuild.buildroot.net/results/42c/42cd6e3be761d1cb358bc50acd7fa58c8aa1c750/
http://autobuild.buildroot.net/results/29d/29d8dcbe013e549a865c0c5953272dab1fe5f777/
http://autobuild.buildroot.net/results/a6d/a6deb7440f80b072432c0f9c048e59abe4edf1c0/

Cc: Dushara Jayasinghe <nidujay@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/prosody/prosody.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index c5a83081dcfa..d95578253d6d 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -10,12 +10,15 @@ PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
 PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl
 
+PROSODY_CFLAGS = $(TARGET_CFLAGS) -fPIC -std=c99 \
+	$(if BR2_TOOLCHAIN_USES_MUSL,-DWITHOUT_MALLINFO)
+
 PROSODY_CONF_OPTS = \
 	--with-lua-bin=$(HOST_DIR)/usr/bin \
 	--with-lua=$(STAGING_DIR)/usr \
 	--lua-version=$(LUAINTERPRETER_ABIVER) \
 	--c-compiler=$(TARGET_CC) \
-	--cflags="$(TARGET_CFLAGS) -fPIC -std=c99" \
+	--cflags="$(PROSODY_CFLAGS)" \
 	--linker=$(TARGET_CC) \
 	--ldflags="$(TARGET_LDFLAGS) -shared" \
 	--sysconfdir=/etc/prosody \
-- 
2.16.2
