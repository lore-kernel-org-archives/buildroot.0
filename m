Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C382C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C68260BDB;
	Sun, 11 Dec 2022 20:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C68260BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AruTsAykkhks; Sun, 11 Dec 2022 20:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F7A60A93;
	Sun, 11 Dec 2022 20:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F7A60A93
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7301BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059354051C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 059354051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sw3Dp2uss9FU for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25EC94047B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25EC94047B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:18:01 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p6so4768685iod.13
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzPQ4tq61GECmxNe9Qn7zD5yyKhchcrCThD1Oa0sV0k=;
 b=mWK40PsariPaHX031CAu1R5TXMRf0BEtmZECWgWZp9z9rZGbiaIlJHdcCSBpS51hHD
 v9pTo14g/kEnad8CeHnHZebQ94oqePOnjV38/Fy7BhEQGI2SU2pxswNV42IpakOdBgnZ
 7WeMXSSE324Kgs9R7yrPj+KajMQudJlMyQmnddylK6jT7WaDEBfbet6/lHzrQUFcvJy4
 nmkUM0b0a1LPUUwbR+bST+AOdhI6AWwTR9PAYirOU4NYSAX7578GfIWKfPaKeYei+aJ8
 +ms/MC5mWB++Fz5T9nERK8m0CJaogRuUTVfB50mlYEzAW6ZO7fTNSZz3u2XQP3suOS1j
 hoEw==
X-Gm-Message-State: ANoB5pl21CssS4HeG6yk1qU0ADhoI8CtCYidW0x7ER6oxTT2u4Y33hNP
 io8Fr5V5rRyqVTxI+nrotQTlCiXVHRWmNA==
X-Google-Smtp-Source: AA0mqf7DvNqH7Tgcfa3DN/kS3MKwxpKzNm5WRmhE7ogsvIQOfTCeeIoCKnKzYmKdMUP3VgUPOdbUpw==
X-Received: by 2002:a5d:81d4:0:b0:6da:9d71:313c with SMTP id
 t20-20020a5d81d4000000b006da9d71313cmr8005517iol.0.1670789880053; 
 Sun, 11 Dec 2022 12:18:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x17-20020a029711000000b00363ec4dcaacsm2547826jai.22.2022.12.11.12.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:17:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 13:17:57 -0700
Message-Id: <20221211201758.146018-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VzPQ4tq61GECmxNe9Qn7zD5yyKhchcrCThD1Oa0sV0k=;
 b=DGSa9BFeHT76WZo8cBhDZ+xx4Kga+wqPQs5NZWsiRO83SlU22TX+zEgZf2nrV9dAhM
 KUH0TuVP1fpkiBD4CJJtOiNtkjSDIZzq4QvFygQaI1LM2yJwsRM/3en1j+TVinzTy6Ou
 uORc0+loAvG3lwZWL5xGsyoKM7LewODLntsmd6xFv7aa03B8yGnri7fWOrt35U6QD/mq
 a44+xbeJEvEKCc9JL0/FMk8RKbH4d/IM78IkkrCjhykPoEapCTvhXbbrkXzXFeoX/SNH
 HlgrkEDfAHnVocKHg3/7I31FFunnS34N3IwUgv1ThUMJ70GHC0263akhupbgPzpjxMzV
 zQRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DGSa9BFe
Subject: [Buildroot] [PATCH 1/2] package/python-automat: drop
 host-python-m2r build dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-m2r package is no longer required to build automat.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-automat/python-automat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 675fbd2260..101197b15b 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/7a/7b/9c3d26d8a041
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
