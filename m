From: Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 28 Oct 2015 22:48:15 -0400
Subject: [Buildroot] [PATCH] makefile: remove LD_LIBRARY_PATH from the
	environment
In-Reply-To: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
Message-ID: <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If system tools are selected, the host's lib/ directory may shadow
libraries from the system which are configured differently and do not
have all of the symbols required by the system tool.

Since buildroot uses rpath everywhere, LD_LIBRARY_PATH should not be
necessary anyways.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 package/Makefile.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8a592d4..10f3a47 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -298,12 +298,10 @@ HOST_CONFIGURE_OPTS = \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = \
 	PATH=$(BR_PATH) \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
-- 
2.6.2
