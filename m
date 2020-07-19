From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 18:49:56 +0200
Subject: [Buildroot] [git commit] package/exim: fix build with ccache
Message-ID: <20200719164843.6E607818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9486e337ac7b32a58c31618a070c1b9f9ca9506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using ccache to build the exim package, the HOSTCC value contains
spaces, that are incorrectly interpreted by exim's Makefilei, which uses
the first word of ${CC} to test compiler options. This breaks the build
with "unrecognized option" ccache errors.

Fix that by wrapping the HOSTCC variable in double quotes, as it is done
for other variables that follow.

Signed-off-by: Alejandro Gonz??lez <alejandro.gonzalez.correo@gmail.com>
[yann.morin.1998 at free.fr: slight rewording of commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
