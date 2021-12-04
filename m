Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F46C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73EA0408C6;
	Sat,  4 Dec 2021 22:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVPi41JQSL_6; Sat,  4 Dec 2021 22:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB622408CE;
	Sat,  4 Dec 2021 22:09:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E59C01BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F5A740647
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id johymIJH-SZB for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C04DC40664
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8DF79935CE; Sat,  4 Dec 2021 22:04:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:05:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: abd6f2d69b4cc5a7e9bca79638cfc2f7977ec518
X-Git-Newrev: 5d8a611540c4818f046ccb5224cc2205a2c333e7
X-Patchwork-Hint: ignore
Message-Id: <20211204220411.8DF79935CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lighttpd: switch to
 meson build system
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d8a611540c4818f046ccb5224cc2205a2c333e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to meson build system (alternative solution to autoreconf
to fix C standard detection/compile flags, see [1]).

- remove unneeded pcre-config (only used by the autoconf build)

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/629075.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/lighttpd.mk | 63 +++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9c18a6038e..7ca71e356a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,64 +13,85 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
-	--without-wolfssl \
-	--libdir=/usr/lib/lighttpd \
-	--libexecdir=/usr/lib
+	-Dwith_brotli=false \
+	-Dwith_dbi=false \
+	-Dwith_fam=false \
+	-Dwith_gdbm=false \
+	-Dwith_geoip=false \
+	-Dwith_gnutls=false \
+	-Dwith_krb5=false \
+	-Dwith_ldap=false \
+	-Dwith_libev=false \
+	-Dwith_libunwind=false \
+	-Dwith_maxminddb=false \
+	-Dwith_mbedtls=false \
+	-Dwith_memcached=false \
+	-Dwith_mysql=false \
+	-Dwith_nettle=false \
+	-Dwith_nss=false \
+	-Dwith_pgsql=false \
+	-Dwith_sasl=false \
+	-Dwith_wolfssl=false \
+	-Dwith_xattr=false \
+	-Dwith_xxhash=false \
+	-Dwith_zstd=false \
+	-Dbuild_extra_warnings=false \
+	-Dbuild_static=false \
+	-Dmoduledir=lib/lighttpd
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
-LIGHTTPD_CONF_OPTS += --with-openssl
+LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
 else
-LIGHTTPD_CONF_OPTS += --without-openssl
+LIGHTTPD_CONF_OPTS += -Dwith_openssl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PAM),y)
 LIGHTTPD_DEPENDENCIES += linux-pam
-LIGHTTPD_CONF_OPTS += --with-pam
+LIGHTTPD_CONF_OPTS += -Dwith_pam=true
 else
-LIGHTTPD_CONF_OPTS += --without-pam
+LIGHTTPD_CONF_OPTS += -Dwith_pam=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPTS += --with-zlib
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
 else
-LIGHTTPD_CONF_OPTS += --without-zlib
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPTS += --with-bzip2
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
 else
-LIGHTTPD_CONF_OPTS += --without-bzip2
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
-LIGHTTPD_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
 LIGHTTPD_DEPENDENCIES += pcre
-LIGHTTPD_CONF_OPTS += --with-pcre
+LIGHTTPD_CONF_OPTS += -Dwith_pcre=true
 else
-LIGHTTPD_CONF_OPTS += --without-pcre
+LIGHTTPD_CONF_OPTS += -Dwith_pcre=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
-LIGHTTPD_CONF_OPTS += --with-webdav-props
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=true
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-LIGHTTPD_CONF_OPTS += --with-webdav-locks
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=true
 LIGHTTPD_DEPENDENCIES += util-linux
 else
-LIGHTTPD_CONF_OPTS += --without-webdav-locks
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=false
 endif
 else
-LIGHTTPD_CONF_OPTS += --without-webdav-props --without-webdav-locks
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=false -Dwith_webdav_locks=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
-LIGHTTPD_CONF_OPTS += --with-lua
+LIGHTTPD_CONF_OPTS += -Dwith_lua=true
 else
-LIGHTTPD_CONF_OPTS += --without-lua
+LIGHTTPD_CONF_OPTS += -Dwith_lua=false
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
@@ -104,4 +125,4 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/lighttpd.conf
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
