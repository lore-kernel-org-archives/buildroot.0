Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C86C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F03982086;
	Sun, 12 May 2024 20:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axQuJZI2HUWH; Sun, 12 May 2024 20:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A705E813D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A705E813D0;
	Sun, 12 May 2024 20:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49D61BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9674072F
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bysxKsqZHQgu for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D12440722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D12440722
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D12440722
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:15 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e1fa2ff499so44834501fa.0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545153; x=1716149953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1xod2PvMaNb4Y1r96kdpq3NkTrY9nOMMh/a6KuYdnk=;
 b=OyHD/BuhCb9pwWv5Qiq9URAaxUQSaS+jl1o7ti+y/pBVgcQwNSg5NUhMqCu6xlJAUe
 3b7hmfNSqLciOyRbUvZccZTiofoOaLa8zeKzJ6WiTuG4bR0NOx8a+bQABUItE0bTTbFv
 URC6UD7tN8H3iCaLjhYgN2Tos9mfcgot8lhMpw19HLB43WRgQD9scjm0eGzVetyoIKOu
 PrU/Q+Uf153WtAAAekcURilM2or+2eu9hc7rYjY9GQjh8/QtkZO8U6b/5iOZKDCS/aBB
 7g/Dbbt8AQqzHfmrzoLCj4I7rAWhoIEDSs6+S6PXRM2R4F5Z0toBNhSN/4TCuyjSUaWm
 GzXw==
X-Gm-Message-State: AOJu0YwQjmU3ysO/Hy99FyO8CF8XZarcNxAy2Olb8mEysaZ+0dhsLf9K
 eWijgDCcESKFqItjimgS2xAAsic0qvAgoO+vEVcTj3m29X1j9lD1TA16eYfS
X-Google-Smtp-Source: AGHT+IGjKhmYiO3eZXqV4BkZFDV11aSrmwoVRepjKEXhjHFpJGc8ydq/cNLQBe8o01N3dX79kLXmjA==
X-Received: by 2002:a2e:8748:0:b0:2e5:7400:18dc with SMTP id
 38308e7fff4ca-2e5740065d9mr13194461fa.16.1715545153559; 
 Sun, 12 May 2024 13:19:13 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:13 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:52 +0200
Message-ID: <20240512114617.2564569-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545153; x=1716149953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1xod2PvMaNb4Y1r96kdpq3NkTrY9nOMMh/a6KuYdnk=;
 b=a7KEM0Rs1ggvL8klQFjD6nPUngMjUOFF8oDsEy5deGhe6sfZ9KUdqCRPcq4T2BNm06
 cERhXbYThysvDduj8QXOouwu1xZtLhqzo7/eJ/mdLLQl/67tai85Z6PYI2bv5sVyV2JL
 53IEe2cJvCx2jyztTly/1fWs9/SbzAWTL1HdpWSI2VifOepun0fIgHPAfDPjnvgx/y9N
 Gy5HhI7rE4EHiupmV3vSUFkktAU3OatKewF7QA4m6U/XofOzElXQ2+0jDoNgfeEyS3Rz
 KbyaHyzvVoJ2DeNkFndTBhgEqfxQxsxrqbDMXpuaQd4H0SXWZevZm+RbDQ3wRpdHWhtH
 /vWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a7KEM0Rs
Subject: [Buildroot] [PATCH v3 05/14] package/qt6/qt6svg: allow building for
 host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
