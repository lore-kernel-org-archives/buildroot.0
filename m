Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49ABC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B56782868;
	Sat, 22 Jan 2022 22:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9UHwg7cHmKW; Sat, 22 Jan 2022 22:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E44F81C40;
	Sat, 22 Jan 2022 22:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDB61BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F28E440902
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3urhj3u1KY2 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:24:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2B23408FE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:24:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e8so4804107wrc.0
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3WxJLWNZH9c1m4oUE30reYqI860I9bXxNkjXvdyM2I=;
 b=bPAi/auZ8FyznKXUfH4FeU1GgbJ/jUf0sLk7jOmgemQxIp7wqWXnjH5+C8wXCgp+C5
 chYZm2hBx23wyfycPL9C/Rt6Du0nVY7JChlgNvSLci3ZFE7onO+QcRM/mXq3yQgbW3Fy
 XVTvJkLJpUAjoEkM1ubJjXx2vJiBRKPQuwDjsvJVFdocn4UFIbn/AF1NSvatQPELmInm
 ccvcG8hkN+/z1ynIB+tjEfa7LZdlZ9DJ2YKZ5b3hffDKEUhwbUz52lbPzPyRNxAatfFm
 ZZiSeOFxfILxbZ2+uTJACVbdPF0unoh4Po67Ohs0396geQ7kJiDjTiHsIxEVbWp4zcL1
 OQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3WxJLWNZH9c1m4oUE30reYqI860I9bXxNkjXvdyM2I=;
 b=wo70OUHHosMjW3rId98LjeNP4g88JI8RnwOUEGCnjkVZbXQPv3n5w9Us9B/HKv13q7
 KrGuqdLnU/nZOecBjBZ0/QK3kxmgbtoz9OHdyYQMacXEn7gY0P+lpo/UYHlUsPlJx6bq
 1tSsxDcq9Zv8IV6w2FfA09xYoAtjeGNC+2Rxq2tP/Ozk7c1SvLgvChXy/jUNfIqa5h+w
 gUUwe0SgX6F0L8NBgDOJyAC9ZQCYykK8voPuSE628+JmpBEZhYvvQbGlG3ICZxK5JBCH
 APBzY4DUihksWx0+MLPdnv8tqvJhnvNXMb439H7dOXMjc/MUHqe80oKEE0CfQ5YuSBKu
 L3Hg==
X-Gm-Message-State: AOAM533V3KA4Znw1G7eopQTs77ytspZiPZkCGAiZHFXXlcokqXkQyrSS
 f3qeg6o2h+ChW3sutG4pITRnOnphnZc=
X-Google-Smtp-Source: ABdhPJwsuqTMPJwqhyt/gNl7NUkqy1uojHG7kDOOQUkkhbuE0LthcxWDLm9ePuiQvXTYY0/JIQwqtw==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr372846wrd.407.1642890288730;
 Sat, 22 Jan 2022 14:24:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id j15sm2745175wmq.26.2022.01.22.14.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:24:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:23:13 +0100
Message-Id: <20220122222313.303416-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: security bump to version
 1.4.64
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-22707: In lighttpd 1.4.46 through 1.4.63, the
mod_extforward_Forwarded function of the mod_extforward plugin has a
stack-based buffer overflow (4 bytes representing -1), as demonstrated
by remote denial of service (daemon crash) in a non-default
configuration. The non-default configuration requires handling of the
Forwarded header in a somewhat unusual manner. Also, a 32-bit system is
much more likely to be affected than a 64-bit system.

gdbm, geoip and memcached options have been dropped with
https://github.com/lighttpd/lighttpd1.4/commit/86c2d3093686c4f945086c90af9b8a7900925b6b

https://www.lighttpd.net/2022/1/19/1.4.64/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 7601745fd7..ce026b9b4a 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.63.sha256sum
-sha256  2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9  lighttpd-1.4.63.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.sha512sum
+sha512  8e2ad0830ff80fcebf0c33600caafb5ab4e9ff6b5073c12572f88a44fdfe85f777fa8b22b2fc2964fecbeb556997ad660867dcee80efb224d63329c8b18ea936  lighttpd-1.4.64.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5d53767263..f0974dd5b2 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).63
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).64
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -16,8 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_brotli=false \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
-	-Dwith_gdbm=false \
-	-Dwith_geoip=false \
 	-Dwith_gnutls=false \
 	-Dwith_krb5=false \
 	-Dwith_ldap=false \
@@ -25,7 +23,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_libunwind=false \
 	-Dwith_maxminddb=false \
 	-Dwith_mbedtls=false \
-	-Dwith_memcached=false \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
