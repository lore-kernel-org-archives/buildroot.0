From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 17:37:46 +0200
Subject: [Buildroot] [git commit] php: openssl support needs to link against
	zlib for static linking
Message-ID: <20150511154919.774CF8196D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c518ff7d2fb178a4a2a97839457ac16f9b31240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/490/490a9558635c90bf510b6f80cd0891fe322c3f46/
http://autobuild.buildroot.net/results/bf1/bf12eb189ab35ce00a2212695d2dbf8b8a126529/

Otherwise the configure script fails to detect openssl and bails out.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 47811ff..279ebf8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -109,6 +109,11 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
+# openssl needs zlib, but the configure script forgets to link against
+# it causing detection failures with static linking
+ifeq ($(BR2_STATIC_LIBS),y)
+PHP_CONF_ENV += LIBS='-lz'
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
