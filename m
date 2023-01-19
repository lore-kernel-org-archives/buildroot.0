Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235CDC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 13:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA7D40C7F;
	Thu, 19 Jan 2023 13:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA7D40C7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krJd2yz9-v18; Thu, 19 Jan 2023 13:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 000B740B15;
	Thu, 19 Jan 2023 13:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000B740B15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47FD01BF2E5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242C960D58
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 242C960D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IU9enHj7dy9l for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 13:29:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AA960A81
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68AA960A81
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 13:29:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e3so1835587wru.13
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 05:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dcv8vZJEr93lg3wWefHinnzhjtLdGEogs5WdyLStMng=;
 b=u8Uy1J4ZHQeh9c/mbCAGs4PEOBgp4ZYnLQyS8JgZgFRjZKFB/qDVLMOgD1IwZjTRDL
 ggnPNslLYblhw1gtSaH39WBoTWa9OSWjlvF4bsibxueepJX3jHyZdoz86rConOHqDkLw
 G91Acyo775u422h6Q27B6Z4SgObSu4DiUP6e9W9bT99lgWeLUbpD4+qTR1ILSKTwLBIo
 GNotXf8ZFOXSArQnDqZViDuVnYEjI+wCk1tHLuI5R9wv5bYt/7YMQR/9irA+owMR81TY
 tLwZ1U1U+rrPwPgGLN7grYzjTW3fQnuM7wOmBvb9VfWdf/lqoQ7mIxzHQusJ2fnZs2jH
 YoBA==
X-Gm-Message-State: AFqh2kpofefy1Wuu8sw3vvZS1NnG5EfHSH7F/5n0ht/wI7EBv5uSz3A8
 WlWPuP0VUd1kHUTkdRoMH7QxrQHFL/dFuQ==
X-Google-Smtp-Source: AMrXdXuhJW/C4D2SNlHaio05JHMStapCyQC/iFjrGOG+oKfWFCTDmcA3DyVEKqJxoJ3KQuoAfi68bA==
X-Received: by 2002:adf:f406:0:b0:26c:aa9d:93f1 with SMTP id
 g6-20020adff406000000b0026caa9d93f1mr8045602wro.25.1674134967208; 
 Thu, 19 Jan 2023 05:29:27 -0800 (PST)
Received: from ncarrier.spectracom.local
 (2a02-8428-7321-aa01-1304-3364-4203-42ea.rev.sfr.net.
 [2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm22011320wru.79.2023.01.19.05.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:29:26 -0800 (PST)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 14:28:54 +0100
Message-Id: <20230119132856.1801425-2-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dcv8vZJEr93lg3wWefHinnzhjtLdGEogs5WdyLStMng=;
 b=Bp/rtgME9OWam8gqQImXZfX+PTCoxg2T9jP2qOAY0/5WHDDrRafjXUFeS0PV/RM3Gp
 nXcMa99fnUtJaOZjIYNraRQO7bab0mbKlR9vxir4fG45sQoMF6dJ/YDfab6qMHsWnRDq
 s6P5sLNxA1ntGvzSg2h68F3Fxx6jxiRvY0CF2imdCnP0OCb2EifoAhNTjIKy9kYWyawy
 ddp7MSf5GJDD98O590r6uUNmCP/EziV7OiOZNqvj1xZ+cM9gAznhEB8iyv2D/+j2TBRt
 0X0JtQhZJsHxJ/gPkBLwyrZYvopx5kmrWMXo5tTNOsWRZpVEj8IJa4hP3ItK174mBkzv
 djVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bp/rtgME
Subject: [Buildroot] [PATCH 1/3] package/oniguruma/oniguruma.mk: add a host
 package
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
 Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <carrier.nicolas0@gmail.com>

This is needed for the creation of an host-php package

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
---
 package/oniguruma/oniguruma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index f5ac810c10..e81190c0c6 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -14,3 +14,4 @@ ONIGURUMA_CPE_ID_VENDOR = oniguruma_project
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
