Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4C8C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 09:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0694261027;
	Thu, 16 Feb 2023 09:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0694261027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvPl80lMWpsI; Thu, 16 Feb 2023 09:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7832611C8;
	Thu, 16 Feb 2023 09:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7832611C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09E741BF82D
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 09:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E62A760742
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 09:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62A760742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUj5ho08rBhE for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 09:41:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840A161027
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 840A161027
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 09:41:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m10so1234441wrn.4
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 01:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIRUrs4BuHzfGEoU3zLEURkoljKiPIpQANguWP2Wy60=;
 b=Kqjn/v0u/cGoEGo8uSBzNsIwjkELX8ETcIMsMPW3qjBxfyR6UrnmxY19yNUlxrKF3r
 3jUj/q+M0YllAEunfsgVfYp5JnNcUu24Su/+JpTjX4QdOeNJtl1nM4DEcbAc6LbFMN4w
 hsF6U+LAwwzSfuBW+EOFaH+NgsvcJFrKreXZWybN5jvByN0Thuuk0VGjnWJzOkSthV/u
 N5eV8SJ6L8oXFoWkaSpgRSv8hQl34zw+BlOquaHQ0hXR+LYGRmaNNAOJpNBo0BSMmqYC
 37FjeOuiiai0di0xd/hdJzUjhAJ1KfFEfUnqqLglKobHFteTiUfbmqp5pq/bWaZGNj9M
 HiRA==
X-Gm-Message-State: AO0yUKWnzFXCZh3QPJGkT2MfIs+6jXofpdTpsvcQCMlTQ92MMlhBVH6v
 1GCwQrSGrCxeT6i4hhIt3+OF5IsrNWZyAMBg
X-Google-Smtp-Source: AK7set/ZUN9kfWP6i/0JfP1/xgOoD3r6mpR7x9gadQgA+H7SVyTlr9LYxEutJ3Z2PXaMiOqlgJ5OIw==
X-Received: by 2002:a5d:4d47:0:b0:2c5:5aef:274e with SMTP id
 a7-20020a5d4d47000000b002c55aef274emr3545077wru.43.1676540467963; 
 Thu, 16 Feb 2023 01:41:07 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c290100b003dc492e4430sm1125467wmd.28.2023.02.16.01.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 01:41:07 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 10:41:02 +0100
Message-Id: <20230216094102.2984308-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=zIRUrs4BuHzfGEoU3zLEURkoljKiPIpQANguWP2Wy60=;
 b=dWT80sTlTXjdfqJV2BzeSm19FrCjcIuv9w5DSJ8VlSfsYGjFPMTg+AdJiNF/Z5Wjsy
 LPN723+NLvN6+YsZDypQE+uj61Wh0XqdHT0sO1MdX/f5nvQH1W240eKmJeEUDBTClIXE
 eTtPobZUVZbsc3y08fESYu/aInJE2LD3ZGeWfMC2Utyp/FqmxzKHNL4mAa8Je82fzFb2
 00SlvG8+7VRv3ecyl0ipEEpF3z+xkxeZVNbAvzGI8N6WAofI8FxeMvYqIUCnb1wbduE0
 4TMm3sTARguOhd1+F2srrCtIn7dMGZo1R+a0CE1U0kqk0Ktn+SXGaQVbSKiNcTqWUFjo
 QpRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dWT80sTl
Subject: [Buildroot] [PATCH v2] package/lighttpd: bump to version 1.4.69
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
 - https://www.lighttpd.net/2023/1/3/1.4.68/
 - https://www.lighttpd.net/2023/2/10/1.4.69/

In this commit:
- rebased patch & dropped server.use-ipv6 option [1]
- fix changed meson options [2]

[1]: https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/376d20f1617f2c0202fb415e4cc66d3f780db5ca
[2]: https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/6b31f76cd9b36b6033607181238fbf41c5b81e07

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
  v2: fix git message url links

---
 ...lt-lighttpd-configuration-file-to-ha.patch | 33 ++++------
 package/lighttpd/lighttpd.hash                |  4 +-
 package/lighttpd/lighttpd.mk                  | 64 +++++++++----------
 3 files changed, 47 insertions(+), 54 deletions(-)

diff --git a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
index 1a887655b8..2eab2a84e5 100644
--- a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
+++ b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
@@ -1,11 +1,11 @@
-From d1de409b0aeb8dffd42673444043caf01437804e Mon Sep 17 00:00:00 2001
+From d9e1c9c4a95797c812dd4906ecbbc532ae459364 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Mon, 13 Dec 2021 22:07:17 +0100
 Subject: [PATCH] Modify the default lighttpd configuration file to have one a
  starting conf
 
   * Changed the log path to /var/log and logs filenames
-  * Disable IPv6
+  * Disable IPv6 (Dropped since 1.4.68)
   * Do not setuid to a user that doesn't exist on the system
   * Change the network backend to writev since linux-sendfile fails on buildroot
 
@@ -13,13 +13,15 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
 [Gustavo: update for 1.4.37]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Thomas: update for 1.4.69 - drop server.use-ipv6]
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
  doc/config/conf.d/access_log.conf |  2 +-
- doc/config/lighttpd.conf          | 16 ++++++++--------
- 2 files changed, 9 insertions(+), 9 deletions(-)
+ doc/config/lighttpd.conf          | 14 +++++++-------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
-index e685d43..92cff4f 100644
+index e685d437..92cff4f0 100644
 --- a/doc/config/conf.d/access_log.conf
 +++ b/doc/config/conf.d/access_log.conf
 @@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
@@ -32,7 +34,7 @@ index e685d43..92cff4f 100644
  ##
  ## The default format produces CLF compatible output.
 diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
-index 495d2a1..c3e1446 100644
+index d45a284d..4e926d5a 100644
 --- a/doc/config/lighttpd.conf
 +++ b/doc/config/lighttpd.conf
 @@ -13,8 +13,8 @@
@@ -46,16 +48,7 @@ index 495d2a1..c3e1446 100644
  var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -90,7 +90,7 @@ server.port = 80
- ##
- ## Use IPv6?
- ##
--server.use-ipv6 = "enable"
-+# server.use-ipv6 = "enable"
- 
- ##
- ## bind to a specific IP
-@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
+@@ -97,8 +97,8 @@ server.port = 80
  ## Run as a different username/groupname.
  ## This requires root permissions during startup. 
  ##
@@ -66,7 +59,7 @@ index 495d2a1..c3e1446 100644
  
  ##
  ## Enable lighttpd to serve requests on sockets received from systemd
-@@ -118,7 +118,7 @@ server.groupname = "lighttpd"
+@@ -114,7 +114,7 @@ server.groupname = "lighttpd"
  ##
  ## Document root
  ##
@@ -75,7 +68,7 @@ index 495d2a1..c3e1446 100644
  
  ##
  ## The value for the "Server:" response field.
-@@ -144,7 +144,7 @@ server.pid-file = state_dir + "/lighttpd.pid"
+@@ -140,7 +140,7 @@ server.pid-file = state_dir + "/lighttpd.pid"
  ##
  ## Path to the error log file
  ##
@@ -84,7 +77,7 @@ index 495d2a1..c3e1446 100644
  
  ##
  ## If you want to log to syslog you have to unset the 
-@@ -192,7 +192,7 @@ include conf_dir + "/conf.d/debug.conf"
+@@ -187,7 +187,7 @@ include conf_dir + "/conf.d/debug.conf"
  ## and write(). Every modern OS provides its own syscall to help network
  ## servers transfer files as fast as possible 
  ##
@@ -94,5 +87,5 @@ index 495d2a1..c3e1446 100644
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
 -- 
-2.34.1
+2.39.0
 
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 8353857ad9..29bf5124b6 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.67.sha512sum
-sha512  acfde71675d1c54b4e805998d1dabaa291437181bdbca0d6a3a069584c4576d7585d2401f57f8691f23aaf6283a95ac61156789a055a2a7236fd305c1f248627  lighttpd-1.4.67.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.69.sha512sum
+sha512  9d174c8e0a192b4eb8218a9f76b0bd42f90030228600bb7bbe35ebb9e7bbaea36ee2732535c5cc6dab171294817837bfa26074ff84a37832dd89f57488b4071f  lighttpd-1.4.69.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index d3440040fb..ca2035b6b3 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).67
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).69
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -13,49 +13,49 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_dbi=false \
-	-Dwith_fam=false \
+	-Dwith_dbi=disabled \
+	-Dwith_fam=disabled \
 	-Dwith_gnutls=false \
-	-Dwith_libev=false \
-	-Dwith_libunwind=false \
+	-Dwith_libev=disabled \
+	-Dwith_libunwind=disabled \
 	-Dwith_mbedtls=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
-	-Dwith_pcre=false \
-	-Dwith_sasl=false \
+	-Dwith_pcre=disabled \
+	-Dwith_sasl=disabled \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
-	-Dwith_xxhash=true \
+	-Dwith_xxhash=enabled \
 	-Dbuild_extra_warnings=false \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
 LIGHTTPD_DEPENDENCIES += brotli
-LIGHTTPD_CONF_OPTS += -Dwith_brotli=true
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_brotli=false
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_KRB5),y)
 LIGHTTPD_DEPENDENCIES += libkrb5
-LIGHTTPD_CONF_OPTS += -Dwith_krb5=true
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LDAP),y)
 LIGHTTPD_DEPENDENCIES += openldap
-LIGHTTPD_CONF_OPTS += -Dwith_ldap=true
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_ldap=false
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
@@ -67,16 +67,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_MAXMINDDB),y)
 LIGHTTPD_DEPENDENCIES += libmaxminddb
-LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=true
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
 LIGHTTPD_DEPENDENCIES += mysql
-LIGHTTPD_CONF_OPTS += -Dwith_mysql=true
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_mysql=false
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
@@ -88,9 +88,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PAM),y)
 LIGHTTPD_DEPENDENCIES += linux-pam
-LIGHTTPD_CONF_OPTS += -Dwith_pam=true
+LIGHTTPD_CONF_OPTS += -Dwith_pam=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_pam=false
+LIGHTTPD_CONF_OPTS += -Dwith_pam=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
@@ -102,36 +102,36 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PGSQL),y)
 LIGHTTPD_DEPENDENCIES += postgresql
-LIGHTTPD_CONF_OPTS += -Dwith_pgsql=true
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_pgsql=false
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
-LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=true
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=enabled
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=true
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=enabled
 LIGHTTPD_DEPENDENCIES += util-linux
 else
-LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=false
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_locks=disabled
 endif
 else
-LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=false -Dwith_webdav_locks=false
+LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=disabled -Dwith_webdav_locks=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZSTD),y)
 LIGHTTPD_DEPENDENCIES += zstd
-LIGHTTPD_CONF_OPTS += -Dwith_zstd=true
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=enabled
 else
-LIGHTTPD_CONF_OPTS += -Dwith_zstd=false
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=disabled
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
