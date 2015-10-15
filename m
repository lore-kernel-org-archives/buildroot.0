From: Charles Duffy <charles@dyfis.net>
Date: Thu, 15 Oct 2015 10:27:18 -0500
Subject: [Buildroot] [PATCH 1/1] musl: Make only shared libraries conditional
Message-ID: <1444922838-16841-1-git-send-email-chaduffy@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Duffy <charles@dyfis.net>

External toolchain use requires a static libc (as buildroot uses
`gcc --print-file-name libc.a` to find the sysroot); thus, the static portion
of a musl build should not be conditional.

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
---
 package/musl/musl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index f0c45f5..2f43aab 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -29,7 +29,8 @@ define MUSL_CONFIGURE_CMDS
 			--prefix=/usr \
 			--libdir=/lib \
 			--disable-gcc-wrapper \
-			$(SHARED_STATIC_LIBS_OPTS))
+			--enable-static \
+			$(if $(BR2_STATIC_LIBS),--disable-shared,--enable-shared))
 endef
 
 define MUSL_BUILD_CMDS
-- 
2.0.0
