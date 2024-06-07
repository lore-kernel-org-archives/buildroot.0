Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389BFC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 13:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA5E404DF;
	Fri,  7 Jun 2024 13:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iqTwU2uss3g; Fri,  7 Jun 2024 13:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08AE404E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08AE404E3;
	Fri,  7 Jun 2024 13:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F20CA1BF215
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA921606BF
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNLh_ESF4jz4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 13:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5F056061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F056061E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5F056061E
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 13:48:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35dc7d0387cso2501582f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 06:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717768130; x=1718372930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJNh48sqWHkJIVPa/TEh3us1qs3w303CkNIy9I88Apw=;
 b=KWOOAExtN/dKi4j99/jNS2OjyLHPxQqYrviqsJbDarNUWxsFe7YNTKdVT1gdeHd/X0
 ISOXTk/Ht4T7gFVqTRFtuQP6kkjrUU4079IrhndbA+2f6J9EgsfZU6VeopTL9oQ2xCH5
 UppHVaF8Me7/Fxq1Oh7wEkuZ5y6eAUzv9XtKQ3mWB+i8UfB20qVv7iMpxLiRyj0DJ7Er
 M0/jGVZTlvb3kMGOtcTnEuceJ18OeGBCaqhIARd38dCq1PybthAqSBSjflZxGNQC4cQB
 1iEwqgZxf8D+oUW2KV0F1KKgodZhxJ423iHcrfoM/GCI7sXxcvSp77PlmhkbH2idbhbc
 qoEA==
X-Gm-Message-State: AOJu0YwJhCIk1ctSkmz7t+1XXZqM7nD1e10A9ZiE+ETUQaCBUUuesKeL
 B80rPxcPX2zz/wlFo3yRiOAUVVvmk6uUZK2V1XD5F1LlGXmQwcsRLXeo3g==
X-Google-Smtp-Source: AGHT+IHUvmhRq/SuCL2Bs+hho/A8V47gnjD4h21LrRYFEMqYUMzGeMmFOAANUaPSqjqy/JRLFT6yGw==
X-Received: by 2002:a05:6000:1755:b0:354:fcbf:f3c0 with SMTP id
 ffacd0b85a97d-35efed1618fmr2134548f8f.4.1717768129815; 
 Fri, 07 Jun 2024 06:48:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc3197sm4051627f8f.101.2024.06.07.06.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:48:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 15:48:47 +0200
Message-ID: <20240607134848.2974069-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717768130; x=1718372930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=zJNh48sqWHkJIVPa/TEh3us1qs3w303CkNIy9I88Apw=;
 b=XaiuL+xXfRjMSBdiz5/K0PXGDA+x7If/1eStUcOi6IgSb46t/W1dzjfwlAx3veDEST
 +M1x0Yx9lp6wYEou7o00gSeVZymA+7rG2PybHaICCi4sQKowoqbSaTAX6OnTu/30uCIP
 FaiW3W/HndvN7XvxtBF1WKbKKd+U3J4q8WQEIu/RFS3FwXKQkn/Ofx/3oQQ5nqfLQOl6
 cv1seEs3E2HOvxO4AfcWOc4oWOMhvf3Jda6aVp/+8+AvcUX2aNucO9flVgAy0aB4amtO
 fgQBSoqfxMzVg+sSgG6+qKJfplta7wcdMrNKHppsA3UTd2q8Cqmfj9HJO0Ts03JmFe99
 LJUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XaiuL+xX
Subject: [Buildroot] [PATCH v2 1/2] utils/checkpackagelib: really check
 variable name
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when a package defines an unscopped variable, but its value
contains a properly scopped expansion (or even just the name of a
variable, there is not error reported (e.g. with the recently fixed
composer issue):

    BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar

The reason is that he check is done on the whole line, rather than on
the variable that is being set.

We fix that by really looking at the variable we found, instead of the
looking in the whole line.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index ce2ab5157c..831a8afe61 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -312,7 +312,7 @@ class TypoInPackageVariable(_CheckFunction):
 
         if self.ALLOWED.match(variable):
             return
-        if self.REGEX.search(text) is None:
+        if self.REGEX.search(variable) is None:
             return ["{}:{}: possible typo: {} -> *{}*"
                     .format(self.filename, lineno, variable, self.package),
                     text]
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
