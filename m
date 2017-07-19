From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:58:12 +0200
Subject: [Buildroot] [git commit] package/nodejs: use shared c-ares
Message-ID: <20170719202438.67D3082165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=653bcf477acbc947279ceb46d52a4891586c6ebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs requires c-ares and by default will use an internal copy
bundled with the release.  Change to using a shared c-ares library.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3022f9c..f90ca2b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 43c5ff3..5bf8889 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,7 +7,7 @@
 NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
+NODEJS_DEPENDENCIES = host-python host-nodejs c-ares zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -16,6 +16,7 @@ NODEJS_LICENSE_FILES = LICENSE
 NODEJS_CONF_OPTS = \
 	--without-snapshot \
 	--shared-zlib \
+	--shared-cares \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
