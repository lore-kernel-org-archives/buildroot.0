Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BC3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 18:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCBB401BA;
	Tue, 23 Nov 2021 18:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmiEV7rUoy7I; Tue, 23 Nov 2021 18:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB53C40234;
	Tue, 23 Nov 2021 18:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D51781BF39C
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1DD260A55
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQ0VNOnQEPPQ for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 18:27:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C9D60A43
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637692025;
 bh=R05CEQ3su0V1HLlKjW0CzBh7E2bOr+EHQmRwyW97Da0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RTJAXILKnpUNuhum/LirNn7spVWfDSl2TLbbmF6KAOi7wIUXMJlaYtSnqnSQGbm3E
 vZbntOXcKtxOkno4xzhaN3/Lo+9QOSXLpWaNaptxoGSVU5/qnjJa5YQHKPumb4ZGon
 WrX/E3PWVE0RRTh+Vw5uqUns2yad74af5isoQl/Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.142]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAONd-1mwR3S0ddT-00Bucy; Tue, 23 Nov 2021 19:27:05 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 19:27:04 +0100
Message-Id: <20211123182704.8741-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:rJd/JgrMFC4KGTDCCWCqSoch7GZSgO+cgFXmxxa6TDsdFrAZcL0
 l2VTVhRISHT4WeuOpgFZ/CF7kifF0N6x2YgHSIxSeAbs6d3TUfuQnkERpSZvXpENmeW5VLP
 zHXWGVuUAnZMvyo6LNo5rcQJAM0HGDrqgzl28qdkZi14BTbkfjtWy7Tg/7pHAshWLc2DDyx
 HLsFEskDBdi3zI45jbpsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cEK415ybIM8=:/+SdUK5n7I0DJdv/dNc3UB
 bFkkf/KbSG68Y/64M3Xfxvf901BUeasJvUkwp1DOI/EH0LuTL+7HfuT1YzNLnewq7rse+4see
 v5KJPPFVDLLxpGr0E+Q5hFzMsFNXD+6oyVMQi+KORJG6+e6/rPDGdrz6vQH887MF1O11lij6s
 TL1h6fUrD4UCBf3Rm5TqR60cQHwsU7wieQVDtJ4mkX3Dk4NcAhgrQ8t6iM0rhiu8Vvl3vatb5
 T5WcK35NDpHSnnRon26z0G9e3MY9s+IWniwDkCGq0DMZAOYyDo/qpTMLYwBuf1yYZmDwVh7Na
 seb/qdtXv6d9IWT1lu3T6r/jb3UV1NWdymTzO5QjffZrok1O0wPnS4b0+Pss4tNmdqd9ftPAt
 VukL1zQlxiTN5yLRuqDOoFEhJxIcXjJSYo+UUh8qjYBiuBfb4s4wrsBy2F6MCx1QS6pRWcakW
 iTyuTrQ42Hf/oIY8k8un6xQOXmR+ZYF2y/ot2tqCkZ8RHl2+eCo1oIUltA3int1cW7mWR3bRX
 m2WDkqqY2Nld4in12eACh3IqF5aNq9+S56NPu8tzZqwrVRhfjweYAgCSMIvQLrvg2eDWMM3f6
 8/tShyUJrkCiTb8x9F3YNP3KC6RmrkagA9MOFao3a46UBa3xSRa/aBVPHwNfzwzI2LykAMpLN
 Xv/3GBctI/Fde171SUdrze2mSwegbccBqi76wxhQRkHHvFUapx0256qX+3AX0UuBMzvtnHDsU
 XrWT+wG4o3b51CMvGr+iwh+2aw8tr0g75c/1Addk94SATmfqJrpIhBVA3lJodS4LVkQKawRmI
 jCKDeV8jD/wwSpwN9LPVdxONJOA+dAF+etTgBuxk1o8+UxiFCZqUydVCKI4tdfSTzplUuV+rL
 vksRTyTUhfJbLqor7iu/CBtgv+bFQWQBsMLYtOz+e0jOBkelrS+l0PEas/xNKrcT3bJGql2zb
 dpG4XYCQ4XyBPU6F7r9BKzkm+tJBD5Plvgdx0K8OoY9LtwJYVE7AuFxUGkaI3oOfw99lcYv5X
 kbKFufI52ffHCd8eHknyLlT+nRBtKlsLNjjG5gkVDPdzCici25rGyj0GJRLWAMeWHddsDBXfN
 yv0FdvKAfyQExE=
Subject: [Buildroot] [PATCH/next v2] package/lighttpd: switch to meson build
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

- remove unneeded pcre-config (only used by the autoconf build)

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/629075.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - remove unneeded pcre-config (only used by the autoconf build)
    (Fabrice Fontaine)
---
 package/lighttpd/lighttpd.mk | 63 ++++++++++++++++++++++++------------
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
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
