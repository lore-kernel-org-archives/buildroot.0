From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: enable backtrace when
	available
Message-ID: <20170923171326.BD7277FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19b1c16e8c89d850b85734aa292cb9ad9bfd8816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

asterisk uses backtrace() from execinfo.h to print beuatiful backtraces
when it fails. But execinfo is only reliably available with glibc, while
it is optionbal in uClibc and completely missing in musl.

So, only enable backtrace support for glibc toolchains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 7016c9f..65f8062 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -50,7 +50,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-rpath \
 	--without-asound \
 	--without-bfd \
-	--without-execinfo \
 	--without-bluetooth \
 	--without-cap \
 	--without-cpg \
@@ -135,6 +134,12 @@ ASTERISK_CONF_OPTS += --without-avcodec
 ASTERISK_CONF_ENV = \
 	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+ASTERISK_CONF_OPTS += --with-execinfo
+else
+ASTERISK_CONF_OPTS += --without-execinfo
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
