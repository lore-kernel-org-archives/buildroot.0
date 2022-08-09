Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65FBC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BAB040558;
	Tue,  9 Aug 2022 07:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAB040558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j51C7wfukE3P; Tue,  9 Aug 2022 07:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B0A840566;
	Tue,  9 Aug 2022 07:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0A840566
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1CE1BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11EF6818A7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11EF6818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9xW2Q3L3qLf for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0DB818A2
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0DB818A2
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y13so20738120ejp.13
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vF1s2DBQcIcbhwFFn1WPGmPLx91R+BT4jk+9UfikUkM=;
 b=k8BBcwLMiOj7dmi1GazxIq8dgRyF7AcGZpyPADtdRxVDXIUUfR6w/nF9asofh6tpCz
 dKlvwll1Za3jJ1MM3JopyUz1bmHxU1Ot+ENTeBFOMhBE+ksRCxbs0NMwsHm2iUMjXYWo
 yx1B2XARWiQH8pD+SLoTgiRl/bg2yury/EVWUXtUvG5RLxIZZS4S2dwvGkrk1mWSlgMS
 mIMYWGS3igWzmIO/XyE8qealTlz2+njWTsq9AV3Xlgowp1Z7hFRzqtfVFu2Pnw4qZJLM
 PC4KwDSNGIGxDTvBqAlUgWJcB8sElkONz/qyeslw7vVlKlwCcbGZIh4ZNRLgBgiLqU5L
 b/Sw==
X-Gm-Message-State: ACgBeo2iFytYttxkxci6jabjw7HaHcrLuQgz5buQB3BdIM02WoerdjQn
 UtIAQTNk8vrBGtBCyvhyLUGPKY9DdDs=
X-Google-Smtp-Source: AA6agR7YEc9ZIPo2srOtAkFHk18rbyCQJNqjfx3nCpl8iJ7ynTzPl+2CJLgFTBNNPGRcbjJ6/MG+Hw==
X-Received: by 2002:a17:907:9707:b0:731:51df:c094 with SMTP id
 jg7-20020a170907970700b0073151dfc094mr6489361ejc.695.1660031841833; 
 Tue, 09 Aug 2022 00:57:21 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:21 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:53 +0300
Message-Id: <20220809075704.86472-3-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vF1s2DBQcIcbhwFFn1WPGmPLx91R+BT4jk+9UfikUkM=;
 b=Bot90GIFvM4h7ubQ5S6zZEFCBUoYEQgOpgvmqHYlNYq9Q0SM9fBNpHL8BwkJVRHQHn
 Z1XfsR1yOEkrIffXLwid58g8N8Csuu73BQJJ0koANRyWyIDgrtOqDgB1uPWNcYDG3mVy
 qpG8gP1ESDwubjvD+Q2CANWaTm3rpZ5v/J5Sv/lHAqybKigceG5KkW4JU6yGLqVahnJ0
 remE9eGYW0B0qBHYMsVMRoRHwUEtrLchcZ26Qd5Jpr5B8PyVbvjPO/v5tijYIkOQMt1y
 XaSp/cxNEqlEuSZjKb0dFBPt2dvhBhsy2SK2gz0S7Nd05DFMjx9LYfqhBP94x6/2cKcD
 Cc3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bot90GIF
Subject: [Buildroot] [PATCH 02/13] package/nghttp2: add host-build
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

Useful for nodejs cross-building to build some of the host-tools of nodejs.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nghttp2/nghttp2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 9190fa30d6..5f46f24431 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -21,3 +21,4 @@ endef
 NGHTTP2_POST_INSTALL_TARGET_HOOKS += NGHTTP2_INSTALL_CLEAN_HOOK
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
