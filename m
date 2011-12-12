From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 21:13:58 +0100
Subject: [Buildroot] [git commit] libeXosip2: fix openssl handling
Message-ID: <20111212202250.EC3D98F934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ce8742e2b87c9e8fb34d5c5ce565cf3b3a3891
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build libeXosip2 after openssl if enabled, and explicitly disable support
for it otherwise, so configure doesn't end up looking for it on host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/libeXosip2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4a00a2b..7c4753d 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -11,6 +11,13 @@ LIBEXOSIP2_INSTALL_STAGING = YES
 
 LIBEXOSIP2_DEPENDENCIES = host-pkg-config libosip2
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBEXOSIP2_DEPENDENCIES += openssl
+LIBEXOSIP2_CONF_OPT += --enable-openssl
+else
+LIBEXOSIP2_CONF_OPT += --disable-openssl
+endif
+
 ifneq ($(LIBEXOSIP2_PATCH),)
 define LIBEXOSIP2_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
