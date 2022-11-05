Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7D6C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 13:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 831BB403C7;
	Sat,  5 Nov 2022 13:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831BB403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCxfojybYbil; Sat,  5 Nov 2022 13:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AD824038E;
	Sat,  5 Nov 2022 13:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AD824038E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC4E1BF2C7
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 13:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E4181F33
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 13:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E4181F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzX1mz3wgXXM for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 13:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C9C81EFD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4C9C81EFD
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 13:56:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a14so10484713wru.5
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 06:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rkJ1XbU5TO6OWciy5ofKecNLDDD88MZlE05bruWKGbU=;
 b=e7x1uRowKA7vqzr+R0UA3JLSR/S7pbjZytQ19/q2rfibKEsqWgxpE2TifAe1MkwUtu
 36pZToPyDg2M1RanVEo1t9zRuhy4te6k/jZ2zpFSIbQ25uWktKpNzeXD2/nu7aprqVwf
 qs3isOl0XxasOPIKTph9exE0NMBtGj0+AK/lmTBLaSQ/ArflnXqdVe+DHF6e695tIVKv
 bOMZsE9omiA9EGk6mxuanlfzkJ6awbf9LppyJZZ6muMYhxjHJ3fvQ2u0EZ3pzVNwI6yn
 yqNU45R6SGGw6D9FQ+Dd7WmWxV6S4jgafMsgUzzlM/HOJFsqPxQOzQcychfyQwmjG+FZ
 wygQ==
X-Gm-Message-State: ACrzQf0gukTWLeUbTyGQVhAxS6k55JiM4RvCAePpk7EezUmv8XRM4uAL
 gdDu+qoEdu5FmZa1AyEl6PdJ2/JcFtg=
X-Google-Smtp-Source: AMsMyM4vOHaSwbshRXa1ytBNYBuZ8zhFUqocDUnG966wDNxtd7Mc6SE9yUWCKmabcytGYfQ+XyYQKw==
X-Received: by 2002:a5d:4708:0:b0:23a:43b7:cdcc with SMTP id
 y8-20020a5d4708000000b0023a43b7cdccmr5501780wrq.545.1667656581352; 
 Sat, 05 Nov 2022 06:56:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003cf54b77bfesm6437282wms.28.2022.11.05.06.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 06:56:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 14:56:18 +0100
Message-Id: <20221105135618.322293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rkJ1XbU5TO6OWciy5ofKecNLDDD88MZlE05bruWKGbU=;
 b=WLAUQpaipzWlZCJpKXRyXVU4WgXypIxHBL0q88iFSFO1JzVd/mCzUkM0zsjrwsa+tA
 N+kZvkJdWluPpqO5HcU9RRa7cIm5yg2yFED+UbAvmlpkt+j3Lc692AvYhaAWwBMbCnNr
 SIG21VG6T0qeXCjbKdQz6vE4SYJTScqokePAK1vBC4CEkS1aWfOzHpfhJgMl3C4ZyyXC
 hlfoI7lTYdp1LPrcnln7qR9W8C26itJw8Tejk5ElG6bSdnT69+1ytWotexRtvnERppt8
 1OFxm8B32ZT4UHXxp8cwxjfh2pv9rDQfgjyyVAo3rcmDSWXBV3czrK8YRt4npOYpSW+A
 eYVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WLAUQpai
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with wolfssl
 >= 5.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with wolfssl raised since bump to
version 5.2.0 in commit 14e0c4de719a0d63192cc5de66a608f75297f37d and
https://github.com/wolfSSL/wolfssl/commit/33cb8231481d5beb46b57511c2630aba36028256:

/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c: In function 'handle_wolfssl_asn_error':
/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:339:10: error: 'ASN_NTRU_KEY_E' undeclared (first use in this function); did you mean 'ASN_ECC_KEY_E'?
  339 |     case ASN_NTRU_KEY_E:
      |          ^~~~~~~~~~~~~~
      |          ASN_ECC_KEY_E

Fixes:
 - http://autobuild.buildroot.org/results/3261b0035c8aadd1b62538b53e03af1cd8a7b312

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-add-compatibility-for-wolfssl-5-0.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch

diff --git a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
new file mode 100644
index 0000000000..7da7199e7e
--- /dev/null
+++ b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
@@ -0,0 +1,30 @@
+From 73aa4ef762b2de67bc8c7c260bd36b34fdb91e63 Mon Sep 17 00:00:00 2001
+From: "Sergey V. Lobanov" <sergey@lobanov.in>
+Date: Mon, 3 Jan 2022 19:36:52 +0300
+Subject: [PATCH] add compatibility for wolfssl >= 5.0
+
+NTRU support has been removed in wolfssl 5.0 so it is required to
+mask NTRU specific code if wolfssl >= 5.0
+
+Signed-off-by: Sergey V. Lobanov <sergey at lobanov.in>
+[Retrieved from:
+https://github.com/zhaojh329/ssl/commit/73aa4ef762b2de67bc8c7c260bd36b34fdb91e63]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ openssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/ssl/openssl.c b/src/ssl/openssl.c
+index 5a49267..278bab5 100644
+--- a/src/ssl/openssl.c
++++ b/src/ssl/openssl.c
+@@ -336,7 +336,9 @@ static bool handle_wolfssl_asn_error(void *ssl, int r,
+     case ASN_SIG_HASH_E:
+     case ASN_SIG_KEY_E:
+     case ASN_DH_KEY_E:
++#if LIBWOLFSSL_VERSION_HEX < 0x05000000
+     case ASN_NTRU_KEY_E:
++#endif
+     case ASN_CRIT_EXT_E:
+     case ASN_ALT_NAME_E:
+     case ASN_NO_PEM_HEADER:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
