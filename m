From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:46:52 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/exim: fix build
 with ccache
Message-ID: <20200722114339.EA71C880C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd0217b411dbed74baad3d5807133a4b8f8838bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

When using ccache to build the exim package, the HOSTCC value contains
spaces, that are incorrectly interpreted by exim's Makefilei, which uses
the first word of ${CC} to test compiler options. This breaks the build
with "unrecognized option" ccache errors.

Fix that by wrapping the HOSTCC variable in double quotes, as it is done
for other variables that follow.

Signed-off-by: Alejandro Gonz??lez <alejandro.gonzalez.correo@gmail.com>
[yann.morin.1998 at free.fr: slight rewording of commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a9486e337ac7b32a58c31618a070c1b9f9ca9506)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index dc445c6d93..90ec364168 100644
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
