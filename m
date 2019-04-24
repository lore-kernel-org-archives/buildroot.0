From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:59:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/ipsec-tools: fix
 static build with openssl and atomic
Message-ID: <20190424195555.5C8D7802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb1497a4aa2ddb2b71f4f3b5278c93049cc11d44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Use pkg-config to find openssl dependencies such as lz or latomic

Fix static build on sparc v8 (even if there is no autobuilder failures
yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 98eb10b1385a1142c4e57226707376a076641840)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/ipsec-tools.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 8672272538..7ac6b5cb22 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -9,17 +9,14 @@ IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
-IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex host-bison
+IPSEC_TOOLS_DEPENDENCIES = openssl flex host-pkgconf host-flex host-bison
 # we patch configure.ac
 IPSEC_TOOLS_AUTORECONF = YES
 
 # configure hardcodes -Werror, so override CFLAGS on make invocation
 IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
 
-# openssl uses zlib, so we need to explicitly link with it when static
-ifeq ($(BR2_STATIC_LIBS),y)
-IPSEC_TOOLS_CONF_ENV += LIBS=-lz
-endif
+IPSEC_TOOLS_CONF_ENV = LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 IPSEC_TOOLS_CONF_OPTS = \
 	  --without-libpam \
