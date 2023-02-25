Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B89C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 10:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D98460BBF;
	Sat, 25 Feb 2023 10:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D98460BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkeL5lcsIAfd; Sat, 25 Feb 2023 10:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C5C060BB1;
	Sat, 25 Feb 2023 10:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5C060BB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588E31BF82C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F05441688
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F05441688
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUXPOHceFaJg for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 10:57:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362C441687
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 362C441687
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 10:57:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bw19so1625203wrb.13
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 02:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uOQvLkoafkT7ThDNbE+Pctnp4BDsi90RSqawYtlSfG0=;
 b=NYAK/J8wTLeAK5w4mCeKKzWktydBOjC5CGvilb3k6tpyZnKjUGwdKRvI4tcFp+7bIX
 GfMyPietkGZIEXSP9xzMyx1lMu5xujzSqzWKo+Lke/QbfWsZu7lsH0lmiElUPfc9DDv8
 ZJ4D+7yX7WPDJY0+Pp5VKrj0pkNzZgFNcRIe4xiRa7i7szRZZ3ALjaAkfGfu3rqqVe6J
 1iPRqLXmgyI2HwKV478r5t8iZz8TK1vWx9Uj4gkumuxSMwD5Cy/4Knz9l8RCrK5hOvzy
 jHjSBdxXA53XV4ybu/xmm73G9LYKJML4K8Mx27MSPuoxKd6EIyACZl8GIqPkiCZa4Mre
 kSVA==
X-Gm-Message-State: AO0yUKXTiRE3qnExzKNN+8ZWNR1QBLH90rNvvBYqHPxMxs1oiW+ao9px
 6lbAi3Y2rCuli/Q19+f654e6Yd9v2ys=
X-Google-Smtp-Source: AK7set+KbgGIqGPH6igJxzjLs9Aal34wPVX7R4cKCVkvf/mpBld/eIwJMXACBx+lujOpEBsgq8F/2A==
X-Received: by 2002:a5d:58f5:0:b0:2c3:f8b8:87 with SMTP id
 f21-20020a5d58f5000000b002c3f8b80087mr14922083wrd.25.1677322640906; 
 Sat, 25 Feb 2023 02:57:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b002c7163660a9sm1450144wrs.105.2023.02.25.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 02:57:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 11:57:15 +0100
Message-Id: <20230225105715.1265130-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uOQvLkoafkT7ThDNbE+Pctnp4BDsi90RSqawYtlSfG0=;
 b=clW8WPU0jMTpGW/mx1Uj72ql/PMPWC5M6tYAosdO4pKuKPR8uD+uVYGrdCTB/0MGTz
 x+vcYlWzP0PCZxxYvPY8TnGD2xsjAAbVaMRYMoKf7REkmZi+u928PlLEJA5h4Bl03gIt
 yc/nQ15u7vtKzABG9HvpQ4av6LQsyvH2vI3M0b8Ng04RN9MALjJgAoM4GDzG4T6zUdqp
 E4ftbCn+q6fSPvoNLHb0Rq1dwXl3zPqX5vFeOvTbbGaXbviq0IHAaH38VYWMCJqYjUlk
 TuO166JQzLr7c+UAFvd03USv3RaWACcQF9JuEDVx/wt98nhyDDWcilVPs6NGSe7teHdi
 mZHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=clW8WPU0
Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix second patch
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix patch added by commit 7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd:

0x300000fL -> 0x3050000fL

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
index 7e32ad5745..acb5cfc9a6 100644
--- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -61,7 +61,7 @@ index 54ab0a6ef4..bd4075b3e4 100644
 -#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
 -/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
 +#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
-+	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x300000fL
++	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
 +/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL (before 3.5.0) */
  
  /* mutexes for multi-threaded OpenSSL (see "man 3ssl threads" and example in crypto/threads/mttest.c) */
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
