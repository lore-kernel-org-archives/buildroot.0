From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:59:20 +0200
Subject: [Buildroot] [git commit] package/nodejs: use shared libhttpparser
Message-ID: <20170719202438.8FF4F817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48ab055348cc64933f4fde3ab1d92b85a470c8a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs requires libhttpparser and by default will use an internal copy
bundled with the release.  Change to using a shared libhttpparser library.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index f90ca2b..a96901a 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_NODEJS
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBHTTPPARSER
 	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5bf8889..f4e5969 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,7 +7,8 @@
 NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-python host-nodejs c-ares zlib \
+NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
+	libhttpparser zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -17,6 +18,7 @@ NODEJS_CONF_OPTS = \
 	--without-snapshot \
 	--shared-zlib \
 	--shared-cares \
+	--shared-http-parser \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
