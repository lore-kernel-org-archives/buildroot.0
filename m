From: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Sun, 19 Jul 2020 12:29:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: fix CC and LNCC initialization
Message-ID: <20200719102946.1646674-1-alejandro.gonzalez.correo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using ccache to build the exim package, the
HOSTCC value contains characters that are incorrectly
interpreted by exim's Makefile, presumably spaces. This
breaks the build with "unrecognized option" ccache errors.

Fix that by wrapping the HOSTCC variable in double quotes,
as it is done for other variables that follow.

Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
---
 package/exim/exim.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 6643abbf65..19a62f497d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -123,8 +123,8 @@ endif
 define EXIM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) makefile
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build-br macro_predef \
-		CC=$(HOSTCC) \
-		LNCC=$(HOSTCC) \
+		CC="$(HOSTCC)" \
+		LNCC="$(HOSTCC)" \
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-- 
2.27.0
