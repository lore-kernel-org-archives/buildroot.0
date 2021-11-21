Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5FCA403B7;
	Sun, 21 Nov 2021 21:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzxK6Mhthzfx; Sun, 21 Nov 2021 21:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D2F40226;
	Sun, 21 Nov 2021 21:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 636731BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 530B1607D0
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjvHHl9WOsws for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:29:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E398607CF
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637530178;
 bh=2Z1DaPdYVtp6nmBFEmKkn3w8tR/cPMvL4HBHu5p/CAc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WS4NkBpYbDFPW/hBqYmhGy/1f4chqv4mvX18vj+3kE1UY0PTlWxq7F1tNpZaseBiW
 kcLjjDhhZS2T1QEB1v1DX5Usf42VlVQiZRJ8Kh+ZMmQLcEDi5qi0YHlih5GqcvJgUb
 SggRwzU7jb0Jz3VeWA4KQ1/z8vQrOC7ccEMPR9n0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1mhjPE0wkE-007GGr; Sun, 21
 Nov 2021 22:29:38 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 22:29:37 +0100
Message-Id: <20211121212937.13983-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:MhAtyhW/yZzkF7X1dnqHXsQUTphw/SXvXoGR84TrJQPsStxdZgK
 G6mufcAZzDjqJUO5T1BrxCfOYuDVBSm7Z/Z2s6M46dXu5OED86W/2dGceXvEDWxXbSxF4ak
 Vvdf/kdLNH/l8GrH5nZoMTmXLiY9YDEZwbOLMwibzM98F+0LmyR28BeUat4r/uYdhw/Cyul
 mEdGlN/z5oPhBiYzIXCkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/NZAeFWRCHE=:/P8wZxLkl/JqkKdSK/UxOq
 j0f5KDhx7qmHKomSuA/kjyS1DlNkLt50+JFZPL3ssrMAxWN+SxrCAAB1zLS8i0Mv7CHogzbqM
 FymBAwA6HSfnKQnntT+wUJousfR3YDlp1KWOa7J39of2t+w2RdhjeJ3uU9k59R01/SSQewxHD
 mJMepVvYWMHnYI+5KdsG6QYoudFh/xmT+LCLu2urVUbpCjH4WSxR81rFkmo6Y2KnPljTGkjzS
 l7Ucw7Uty38XyGy35VEMW9zlenoteR3yjuU9+J7tOOejB/Lf9PAV9JBUZYYgTahTc0rXtIGx2
 us7cLeN9kfJS8MddfGs0HVbe2vRCC+vHF1PLSicYD7fqHYALGTNwLTfh5zlaCMl6+bsUCfWDR
 XWbvB+l5+tDsgq+ULvVDTzY5/1Fw9060+n+EqogUjpDSavvzoKVb9MdS9h6Y3Y1uZGRGk5xQN
 jMY9TQRmDA0vxty4hfR3YSoHtRG6PbIbxgSFdeUl9AUOr1N8+ySTTYojmx6XAy03y7oqCUVqL
 xcxL5KDmvOW5uz6u7+9/0RpwEh6GwWDSqMOB+5V3pUYdtIjVNyXy9lSDN2h4GrFiVEr/cneq6
 dPopIt824i24Fbi9OzzrodYQlFlNeFQ3s81TXsxvlMnSJgb/0FIqRfuSq634pAnWHfhExtWI/
 Nn4B0zWja1YRnN4Q9OqczovrwqeAoD86WQiNHyckxw/s4/Zf2z5ytwiZQuyvxJdg63aBBF4K3
 /EZVRBTUdsspYHnDDf+IxD++o/nBe6Q53PmqVnM1kONkz/ayczwc1fkW5UQh6HOd8t5hk6e1F
 blLRGGIKVRscNM1umPCGAymQqbUIUv+zJqMb/cK+kgniShpxVr77azlGV2Rhyj0RpCRBpz8ly
 j3pNfXzQt2UsZiw0EJNxiOl8vgggt1NKU7Zau15RGWzKBmk0RARgWT8TmpFlANvUx8Fir1dXz
 dfB7EqbOHQtJznedrLpThfafHIsluyJnKqg8SXl+UywpOSn7k7gawEV6xXgNXjShscQpU4Aln
 bAP1gfsgrlruFM3SNLzZGlkg7uhE86eLYWToyfZdDZhEq9NlHrk/BhNLoMowdjsQA/zOVejtB
 ZxJ6r5TLXFALEw=
Subject: [Buildroot] [PATCH/next v1] package/lighttpd: switch to meson build
 system
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson build system (alternative solution to autoreconf
to fix C standard detection/compile flags, see [1]).

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/629075.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/lighttpd/lighttpd.mk | 62 ++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9c18a6038e..abefb17a9d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,64 +13,86 @@ LIGHTTPD_LICENSE_FILES = COPYING
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
 LIGHTTPD_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
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
@@ -104,4 +126,4 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/lighttpd.conf
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
