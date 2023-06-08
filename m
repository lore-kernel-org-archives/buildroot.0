Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E293DC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 17:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F21961514;
	Thu,  8 Jun 2023 17:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F21961514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhhJUFpK6WX1; Thu,  8 Jun 2023 17:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C269561237;
	Thu,  8 Jun 2023 17:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C269561237
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA4F21BF39C
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D12594197D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 17:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12594197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-Rd8J02GYrA for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 17:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797124114F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 797124114F
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 17:55:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f7fc9014fdso6415555e9.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 10:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686246947; x=1688838947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ph8KiQTgHAPSWpzCIWx1MmFYvWJfs3GQR+3Jdcxf9a8=;
 b=eoPnqLlYXytMiots8VvnnBXWGRLRPHAzGUSsz/jHMMnKSmyfz4De2BWYcxnMt7eah9
 5dgGZJDBtWlzRg136BNzmP29wf8ATuTrEeTPWRLHaw+EdMFdxlLqpY2CCB0cKNgVZa9C
 GTHR3KUl2T+lyd7cNQXNw0d3LMqPcn8jtUBZsS94i5dtSrNbw5sEWB9gC/D2r93KCvKe
 H9pTB1l0JFjglLOLga19t8TqL+1NauE8bbSqSJhPTjnzqrbbUElnLt4sUG/bRC4Lnxjz
 0uo/vbQxxy/+xlyd7vKOY1ZTM/vzUOZO9vrvOb/EvMDkxlbGtqeL/vUZ85l7mKx1PWdt
 YSMA==
X-Gm-Message-State: AC+VfDziw6WyF27VCDdi1pmkYBg9nb8wPu2N9iOZ2sgiCGyhX65hU1f5
 bqS4MmVQ+Bm/O+WBoFxyzMPtIlDAp/LD3/CT
X-Google-Smtp-Source: ACHHUZ5OyjWPSWNNw7nIkfDo73oxOPUslY7r6BRao+UaaNVKoQLvf7A6F/2wQMH4HusKKNj8jB+Lzw==
X-Received: by 2002:a05:600c:22c6:b0:3f7:2638:9691 with SMTP id
 6-20020a05600c22c600b003f726389691mr2056599wmg.41.1686246947175; 
 Thu, 08 Jun 2023 10:55:47 -0700 (PDT)
Received: from cuervo.lan ([78.30.22.52]) by smtp.gmail.com with ESMTPSA id
 p17-20020a1c7411000000b003f7e4639aabsm319408wmc.10.2023.06.08.10.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 10:55:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 19:55:38 +0200
Message-ID: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686246947; x=1688838947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ph8KiQTgHAPSWpzCIWx1MmFYvWJfs3GQR+3Jdcxf9a8=;
 b=ivnjG0UgCdsTtsIv8z3mO9Mjox3Q5+GeWx0+w7ELOEHvx/P/3qVvZF3364inibYwz0
 tBcZfswZ9ACHyi3Df4+xOhxXF3QQ48hM51u6tW6HNwND+fOBab3LUptdedwhLMK1p70n
 IBTRbNSZSzWmqZdwvxFcKTPKGbWbF5Jzzr0sdK3ocz77wr4e14l7+A2O54UAcARphQF8
 Z9YyOKO4hktDXAN2POWJpjLlaRP00aLPeYFIih1ziZ8Qlmuu/UD//GOao3siuzVv6f+I
 x1ho5Xc8ZVf0GOVJ17vwV+OudrP4Emgom+nljmSjgxFzwhtYWFeeL+cDbOouDpQIm8GO
 uIzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ivnjG0Ug
Subject: [Buildroot] [PATCH] package/zfs: fix autotools crosscompilations
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLm1rIHwgOCArKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5t
ayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCA5N2U5NDQyY2Y4Li5lOTk0MTNlNjExIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCkBAIC01
OCw2ICs1OCwxNCBAQCBlbHNlCiBaRlNfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1wYW0KIGVuZGlm
CiAKKyMgU2V0cyB0aGUgZW52aXJvbm1lbnQgZm9yIHRoZSBgbWFrZWAgdGhhdCB3aWxsIGJlIHJ1
biBaRlMgYXV0b3Rvb2xzIGNoZWNrcy4KK1pGU19DT05GX0VOViArPSBcCisJQVJDSD0kKEtFUk5F
TF9BUkNIKSBcCisJQ1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIgorWkZTX01BS0VfRU5W
ICs9IFwKKwlBUkNIPSQoS0VSTkVMX0FSQ0gpIFwKKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9D
Uk9TUykiCisKICMgWkZTIHVzZXJsYW5kIHRvb2xzIGFyZSB1bmZ1bmN0aW9uYWwgd2l0aG91dCB0
aGUgTGludXgga2VybmVsIG1vZHVsZXMuCiBaRlNfTU9EVUxFX1NVQkRJUlMgPSBcCiAJbW9kdWxl
L2F2bCBcCi0tIAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
