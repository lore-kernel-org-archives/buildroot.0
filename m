Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B37760A8A;
	Sat,  4 Dec 2021 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dbv0VuizSb4S; Sat,  4 Dec 2021 21:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 942C460659;
	Sat,  4 Dec 2021 21:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC761BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6EF40630
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIGV7rpqftZD for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34809405D6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:37:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q3so13595048wru.5
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfOVr+/xAwh3GNoJEEIfSchMa0nI4hVWZJ4Si23xBkM=;
 b=bg3tMDcyKGksNMuA/Au8bq0tWnJPdY8T7oLve0bddIHUKN2ZIrsZfGXcLBOaxe2a5V
 qGW/Pbv5ImoC2NDGbWvz5HY2MlgKhQ4YWKHdlCB/4SMHEC4qX7aCfLnesatdlL2EVrP3
 h4iFfOf+mXDtxLPnhnmBCTxu65JiL3Y3xJi4LjevgKRKMDQ4ojiG0l3Z4JZRQJf1VDH8
 5RowBiu/YAsv6DMXcIwFr1z8HjhogzbpI2h/XKX12CQBrwB/4AeE2BZGf21qDAJExTGp
 YaBB/TOISe1VpFaV+t4g/a+PNJ+bt8LQPJj8bbrOfRfdHPUFU4ecil8Gv3V3CWgasCbC
 OeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfOVr+/xAwh3GNoJEEIfSchMa0nI4hVWZJ4Si23xBkM=;
 b=qwgIhncH3XoATmhrmB4ZbDFbRGr8CYmg8EVWE9acxKR2qau3y/Ywz9kl8SigjkPAzF
 Sa5nPH93nh1aw90aJneNqyMFk78UGLuHFVgcd7FAGV/H7MqIud8uG1Mw0bA1trssFXy+
 aRnuCCEneq7n605NNyMnQWCHR9INXaNBHY/oQWRdvgf4OjCoGIv05ITTHkZyaFOeLXEN
 E/5gtnl2EdRtilyhxApgcITULrQClXPmE0WV4ms/FK7ekcdZbmnZ9jiTqdte/8Ay91Ol
 F0Q8ReewnrBTJcCnKTyX8jd85dYtLSmhh41YjKtGZyTYUUzCDOE+afoeLQpSlEWTS6+K
 ohXQ==
X-Gm-Message-State: AOAM5312OzHu7U0VA8id1M09NWxL7PPJnEZP1CY20fJY00HAXqxxOxTU
 0x0J9J8+w/zcskpJwfvgTYEGivNc+ksEfA==
X-Google-Smtp-Source: ABdhPJy8ISHTkPRnON+8y194OJX66Z6R54BnudklwHg71n7LLnBkLfzApCuSgE5AW5TxdgSvgW+t/w==
X-Received: by 2002:adf:f012:: with SMTP id j18mr31200592wro.353.1638653829084; 
 Sat, 04 Dec 2021 13:37:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h15sm9822317wmq.32.2021.12.04.13.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 13:37:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 22:37:17 +0100
Message-Id: <20211204213717.2020023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: add UNIXODBC_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:unixodbc:unixodbc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunixodbc%3Aunixodbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unixodbc/unixodbc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index cdc4e69a7e..b447cf5ff0 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -10,6 +10,7 @@ UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
 UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
+UNIXODBC_CPE_ID_VENDOR = unixodbc
 
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
