Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E06ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C230E41695;
	Fri, 26 Aug 2022 21:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C230E41695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni6kQZQyS45y; Fri, 26 Aug 2022 21:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F0C4168F;
	Fri, 26 Aug 2022 21:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64F0C4168F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E481BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8F524168F
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F524168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOvfMNpqzSyj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:46:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488834168B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 488834168B
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:46:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bs25so3246004wrb.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=0/QZBK/QiLRdQsK4rcii/4RdZv/suBmNVdWEJ0KT2+s=;
 b=vzvbPKNAK8wKBlAf6KtNtPB64cKoaCaurp53dVcmSmpmHyWrrxqIn/3iIjNgpCTUIA
 rq7RS4I6vh5jJmwn6Re9O0C9R7Sfd9DNB5E2PM5I/TaL86rl5vJ8i4+g/ic0Xihnr7qF
 //t1H4lf/zQb0bLtPfqRfNeWNl5zUiGCfmcDvz4F2d0HONJK+Onnw2vBlgusMHr4+PND
 8FOKDed9n85hbAQ6rAiuRTqOnNsznTMAYrwANibYB36tRB6zQawCXQsBHl8HPeIqf+TH
 uzh0gwMAtd4bVRHoPPiFwWFNgHIF8QiYUMn1sR923fxq+2nhzfcfaNgSDzDryZPThnLv
 +Epg==
X-Gm-Message-State: ACgBeo2VIIQVIe2HcTGPBS8hMheNpSdxhtXP8CnpscRkTi8ervc31gru
 3t0mwVB7rTLEJckvQP6QghVWqPhusuk=
X-Google-Smtp-Source: AA6agR4ZELNRo3ThrcNHpVKZ1joiAyGFQO7Jf6dWnURbDgDKxU+I/Fbxm5WpcrRjoCuZxmwBQWew5Q==
X-Received: by 2002:adf:f6cd:0:b0:226:ced4:3b66 with SMTP id
 y13-20020adff6cd000000b00226ced43b66mr804053wrp.295.1661550389192; 
 Fri, 26 Aug 2022 14:46:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003a4c6e67f01sm923141wmq.6.2022.08.26.14.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:46:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 23:46:20 +0200
Message-Id: <20220826214620.75193-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=0/QZBK/QiLRdQsK4rcii/4RdZv/suBmNVdWEJ0KT2+s=;
 b=b/hMw2x5y0qbVLSIZxknx/quAGMRCVAVU8puRsSvfZA+PHOMAlVaIV79t4JMd6u6JP
 5KD4NGAH25/+LbneTFzrTM/HqjTY0DuoZ4z026FFE1cNiQDR5c3TN1kXXFOnEWfQm1K4
 rxJk8cvZ1oh2XGru+cIOWt6AoHNIa89AYcSLiXvhYt0Xb5GVXLtiGJ7VWU3llCVUCo1y
 Ovz6FQgiL9tAg867NlN4Nb/H1hwzcB5ymPwXyFEIZyr/OioUwGEbqd6rA9DXfeYnsFLP
 BDXvxHvk1RdIddU5mr21IJfYVtpUxwXAIMMoADevTEeWPMELBbs+1vIQILMeE6fdgquq
 H/7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b/hMw2x5
Subject: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.2.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-29154: An issue was discovered in rsync before 3.2.5 that
  allows malicious remote servers to write arbitrary files inside the
  directories of connecting peers. The server chooses which
  files/directories are sent to the client. However, the rsync client
  performs insufficient validation of file names. A malicious rsync
  server (or Man-in-The-Middle attacker) can overwrite arbitrary files
  in the rsync client target directory and subdirectories (for example,
  overwrite the .ssh/authorized_keys file).
- Drop patches (already in version)
- Update hash of COPYING (make openssl license exception clearer by
  having it at the top and use modern links in COPYING:
  https://github.com/WayneD/rsync/commit/dde469513625c0e10216da9b6f6546aa844431f7)

https://github.com/WayneD/rsync/blob/v3.2.5/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-the-certificate-when-using-openssl.patch | 29 -------------------
 ...g-with-a-zlib-with-external-read_buf.patch | 27 -----------------
 package/rsync/rsync.hash                      |  6 ++--
 package/rsync/rsync.mk                        |  5 +---
 4 files changed, 4 insertions(+), 63 deletions(-)
 delete mode 100644 package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
 delete mode 100644 package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch

diff --git a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
deleted file mode 100644
index 13edeff944..0000000000
--- a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c3f7414c450faaf6a8281cc4a4403529aeb7d859 Mon Sep 17 00:00:00 2001
-From: Matt McCutchen <matt@mattmccutchen.net>
-Date: Wed, 26 Aug 2020 12:16:08 -0400
-Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
- openssl.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.samba.org/?p=rsync.git;a=commitdiff;h=c3f7414c450faaf6a8281cc4a4403529aeb7d859]
----
- rsync-ssl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsync-ssl b/rsync-ssl
-index 8101975a..46701af1 100755
---- a/rsync-ssl
-+++ b/rsync-ssl
-@@ -129,7 +129,7 @@ function rsync_ssl_helper {
-     fi
- 
-     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
--	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
-+	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
-     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
- 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
-     else
--- 
-2.25.1
-
diff --git a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
deleted file mode 100644
index 0af090732c..0000000000
--- a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 60dd42be603a79cd57cec076fe1680e9037be774 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Mon, 11 Apr 2022 08:29:54 -0700
-Subject: [PATCH] Handle linking with a zlib with external read_buf.
-
-[Retrieved from:
-https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rsync.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/rsync.h b/rsync.h
-index 4b30570b..e5aacd25 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -1172,6 +1172,10 @@ struct name_num_obj {
- 	struct name_num_item list[10]; /* we'll get a compile error/warning if this is ever too small */
- };
- 
-+#ifdef EXTERNAL_ZLIB
-+#define read_buf read_buf_
-+#endif
-+
- #ifndef __cplusplus
- #include "proto.h"
- #endif
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 92f6156ba8..f0ba4d321d 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/rsync/src/rsync-3.2.3.tar.gz.asc
-sha256  becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e  rsync-3.2.3.tar.gz
+# https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz.asc
+sha256  2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba  rsync-3.2.5.tar.gz
 # Locally calculated
-sha256  0d33aa97d302cb9df27f99dfa28d58001c2479a02317956f1a7a890f3937a976  COPYING
+sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b51ca1df7..e288033b98 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.3
+RSYNC_VERSION = 3.2.5
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
@@ -21,9 +21,6 @@ RSYNC_CONF_OPTS = \
 	--disable-lz4 \
 	--disable-asm
 
-# 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
-RSYNC_IGNORE_CVES += CVE-2020-14387
-
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
