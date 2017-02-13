From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Feb 2017 18:01:46 +0100
Subject: [Buildroot] [git commit] riemann-c-client: disable parallel make
Message-ID: <20170213170237.86E6C7FDA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=896455cff7ff46dd069c74be39c39aa85cb4e129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2f8/2f85a2d19232365f7e5fddde6092af9dd74d4518/
http://autobuild.buildroot.net/results/80d/80d83c650c668ee1e87c288bd7a0ce63eab95631/

The build system doesn't specify any dependencies between the generated
header files and the source files including them, causing a race condition:

  GEN      lib/riemann/proto/riemann.pb-c.c
  GEN      lib/riemann/proto/riemann.pb-c.h
  CC       src/src_riemann_client-riemann-client.o
In file included from ./lib/riemann/riemann-client.h:23:0,
                 from src/riemann-client.c:18:
./lib/riemann/attribute.h:21:40: fatal error: riemann/proto/riemann.pb-c.h: No such file or directory

Work around it by forcing non-parallel make.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/riemann-c-client/riemann-c-client.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index 5593519..c8a411c 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -10,6 +10,7 @@ RIEMANN_C_CLIENT_SITE = https://github.com/algernon/riemann-c-client/releases/do
 RIEMANN_C_CLIENT_LICENSE = LGPLv3+
 RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
 RIEMANN_C_CLIENT_INSTALL_STAGING = YES
+RIEMANN_C_CLIENT_MAKE = $(MAKE1)
 RIEMANN_C_CLIENT_DEPENDENCIES = \
 	host-pkgconf protobuf-c \
 	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
