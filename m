Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C4FC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0951060AEA;
	Tue,  9 Aug 2022 07:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0951060AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiI9GPwaBzgb; Tue,  9 Aug 2022 07:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC956061B;
	Tue,  9 Aug 2022 07:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC956061B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 755CD1BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CED3408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CED3408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y54DoPgIKNi8 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574B64085F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 574B64085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i14so20816470ejg.6
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MM5LSnkgUzbTpxN20PRzF09wTxlH6r2tARHJ/3ZPles=;
 b=Dt5d3p8aPTQP4BQmnWctmIFRxqrFJoUjMpFy9xIy+cAS+2BDAd/dJU1IJkegoUOnfT
 GFymsZn5oSrdg/fjxHfGQpWKbRMU7wcijEzEl68pRFYnjS5yMsTFT4z5xvCfHx+U6kDi
 cVyw0dDFQMqLEAy8a4etoLyd4Pidj/NMNhdt1WV2wpJx2ArW9aun6QO3qJEn4tvYTukU
 z60BHC3RFubS32YE6ZL3E26+Km++8ml+nLPAyonjn7X2JG3XHHBITdaGBUdG9HBXs3La
 /NNlwigHDNiaHF+jePQxn2qbtfiYd482Va3wp8CqQ86/kQSUMcaXknwSFMicSv3CYutG
 a27A==
X-Gm-Message-State: ACgBeo32lELXfx7yYq/FlVOscm/U7zrQkUoo0COgb3bInxAuhk54S/fl
 r4cgyKd1GMcSUnAYT0SuMf9mryZ+tq4=
X-Google-Smtp-Source: AA6agR7Euwp3hPffmEzGoJyieTfE0t1GK7y0N/wv/Fp5LFmSVqdCIR1ieDzeUrWShyU2j7RQj2EKRA==
X-Received: by 2002:a17:907:75d5:b0:730:8baf:b314 with SMTP id
 jl21-20020a17090775d500b007308bafb314mr15922235ejc.587.1660031852629; 
 Tue, 09 Aug 2022 00:57:32 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:32 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:57:01 +0300
Message-Id: <20220809075704.86472-11-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MM5LSnkgUzbTpxN20PRzF09wTxlH6r2tARHJ/3ZPles=;
 b=jMmEKDyR7uFuEu6BHkJI752FA/JKf4C3c8wUJmdwlOGoChEJGElMEIbnHH4h/6dGa9
 3A8KpGp17Se+WOjX2Ya304Rc4GIlwmLp40vjyrEnHvC+bdC/r/fQVAw9yecHlhBcLv7s
 G/fRKmS1UZhmTDUCyI1by3e3m4+q5+0U5T+9vFBYBHOjSMcutZi8rrQF901Fl6ZX8sB6
 ZjE2LrX6b8VH9XEobmZblkOn+C2TI1La5/8X9f+S7wxFqf8bsRvmGIezwQP6TJypp2CK
 hLhrKxQEjkmMjtQa0xvrAsA0X8WaXZMWdR/t6qSewhfM+8HMe3kMhblDN+seNDTetZq7
 Zi9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jMmEKDyR
Subject: [Buildroot] [PATCH 10/13] package/nodejs: add host-zlib depedency
 to target package
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required by some of the host-side tools when cross-compiling.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7ffbdcf790..3cbae8cb61 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -12,6 +12,7 @@ NODEJS_DEPENDENCIES = \
 	host-c-ares \
 	host-libuv \
 	host-nghttp2 \
+	host-zlib \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
