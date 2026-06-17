Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F3CCD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F54E810EC;
	Wed, 17 Jun 2026 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIC-J6XsGfLg; Wed, 17 Jun 2026 16:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DEE81156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781712828;
	bh=ujeTiXKFPw/oBMzsKsLvfySmpLF/oDOeeniFYr0Nk3A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCsyukvraGI0Lsgpwe30gF+Q8iMXuyKF5Pk/3h6pDNtymTvQoyjfKrGRLlTAAZZpn
	 KlH3Ko+dXM4+blXNkMFKm3QlllhclXCsEOTNr3PhErDSkvIkZcGJX40ofgp16sOKKJ
	 bD+PhQA/lQYqCU6wBWnjIu2J67qNCiglGwYQrjR+lJO8TXRFN6PxTbawJSFcb9MfYn
	 pQhA8824M9Lg0yPP3PpZfBK2YiDpdSEfELaVE/Nr5uEFAG87+F4nhsV+eLCS9OjQyV
	 HkjUW46Vy9qLtVzbmNqdpZdUBVvrgLCFQ+J2wPrPqYo53GKrNWyjj2kSnKaN1I0LU8
	 2ixLU/SHW45ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DEE81156;
	Wed, 17 Jun 2026 16:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 704FC33C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6202742B7B
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9Xi-0SrA3Xa for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 16:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8433442A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8433442A8F
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8433442A8F
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 16:13:45 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-becfa735b9aso759297866b.1
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781712823; x=1782317623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yc5hzHHsBc0BHBgDVdHRRAVo18cRVpZUftCij6kZZ4E=;
 b=hRGEysx8v2/u0ryQ09MUdWDjexmtYlrN5xgf15jq0vZR2nfzOxfp4PGPk+JqZ/6vpf
 fdyDg6HqhpjU5TPMGdZtDY1jhGN411E5udpRvwkPwCY9lrXfeaTiJyVqsYfp91dXZhfn
 rTsOqzYeVU2lkDo14+p2it5qkYR5ZhQpvJuAcKcGUUXrUCruNmjIaH5yQtWfuiCv0e7F
 RfpsuOOuPbiyJjpEiDPNqKBhjpKrxpmTxcCHfrza5W6+KE9rN2C5xOj5FkhNCiyZnA+W
 yveixPGp8QhjFOEOqDFMmmxAc33N4niLprc/54I6cxn+v8CFudVchW+FQ9R0fodFhg1K
 e8fw==
X-Gm-Message-State: AOJu0YwcYierTt7JWuzShcVa91aP2OI4kME1pw4oQJv/BBl5pJbUFEJ2
 UJ4nLEKJy/cSvZrRtaZ+FueQpODB8zzXLVNrJOXlXJqP43lMSCpipXTw0b0o
X-Gm-Gg: Acq92OEOuu7wuowcmGSNmXXoFs4LSgROly3I2+GWh0rGKcR8tfwzHGG1Muh793sLDFb
 5XLEZWxpD8KCLviBIRo86YIfUYPFr6v9FrX1p8jxe7DOgmNmGF6S5j69g/WFKl4XgHHFzPfFWx3
 Azad+70Z8E4mWjbSsMvHOLrM1R08O1OwHqpGFOODdi8/3yK0miECcXblt9EfbXzYQiMOoZ6RbGu
 bbbKd/+0emTejzqEg43hJGvtsfCnDuZv5f88f4jafATHzIGFuCA8y2UBpp9NhUFOr3d7m/gSer3
 1+OTz9qDA4wiKzw0fcVCvM0pcjQn3gNBNRgon0pjmInxvOkG8bTMg9dAQmmO2QnK5N5cGaQlyzq
 m+pQqtEwPsy+Aq1aMseOJwfGAiqMYCLQ5lMfrP39iBBcwxYCu5bnq9mvnjwr1FLB9SCuCyuaN8G
 suagj8n+/iL3lm/0ZldajR3Cbm6ZM=
X-Received: by 2002:a17:907:d02:b0:be2:d66:eb4d with SMTP id
 a640c23a62f3a-c05a7abd063mr357817566b.44.1781712823081; 
 Wed, 17 Jun 2026 09:13:43 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-695647013acsm1099736a12.11.2026.06.17.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 09:13:42 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 17 Jun 2026 18:13:12 +0200
Message-ID: <20260617161331.141666-2-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617161331.141666-1-shirokovalexs@gmail.com>
References: <20260617161331.141666-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781712823; x=1782317623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yc5hzHHsBc0BHBgDVdHRRAVo18cRVpZUftCij6kZZ4E=;
 b=iFK1bbpxiUuC+/HigdC+fGcEnRwefxoUd0ZOy9Ym6NdkIlJnjrwrTigG4j93QF2C67
 OtbMuj2IfSGGnMkqalFBYqwCrf58jJY8nPuIAhS6aO65mn4g2FmOseUac3ZQ9fhYEiZe
 8athpbC8zXH/e+HvW5/Fy/Jt7nmZ3diWepsp4WP2kIKIZbwmj8LbDWbPp5EU0M9SygXJ
 Wzv5SREX9WUDx3lAmDh/O64+J64+42DIUbGDhxptuxJic/ibtdh/CyU72szkqsuLwF8x
 NVIH6UrQ2GIxyyj3hOgiV5GMKqp8weUDP3M/sEZqpY4qW1MbcAZBOCbIm789gEK6Vxqp
 1Fzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=iFK1bbpx
Subject: [Buildroot] [v1, 2/2] DEVELOPERS: move aichat to maintainer entry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..61a7fc4104 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/aichat/
 F:	package/broot/
 F:	package/kibi/
 F:	package/nnn/
@@ -131,9 +132,6 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
-N:	Alexander Shirokov <shirokovalexs@gmail.com>
-F:	package/aichat/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
