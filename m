Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A9DC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F98260B46;
	Sun,  6 Nov 2022 10:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F98260B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1Sgnm111GUy; Sun,  6 Nov 2022 10:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5F960B38;
	Sun,  6 Nov 2022 10:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5F960B38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A59641BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B9681BCB
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80B9681BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMxjR6FcOIDJ for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:21:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9149181BC6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9149181BC6
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:21:49 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a5so13407608edb.11
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 02:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bure9giTHlaTvplLzDuQRK2cU2Kkj32HbMMSCY9eYU=;
 b=alzEx2eGNQz/K365Q7OCfVBEs/ERIqSx11osx0iR+2aD2mp13RowXXLoqmmOTV+zEr
 YK2XzxHc9FBX0OZ+PoWtnE0FmbSKTaJvjNnEP0XPelMzRcaj5nv6l6c/oTjQQs4V3YNq
 q70iktaDk1clfvCeEeoS/oZBWSbZTZvvdixvvbQOjSHaGywWHyYX7EbjVhx6LzmE5YGh
 yot0xqyFRHjhrzBfsq5ajytDozC9/KK1bXPUCIxM3e8Ccs+J2XPuh3hyNOv2v6WogZP0
 C5SS688qEXNSDg0ZrFPw3bsrO/ghNDBQC01l70IcduVe7DE4HZO+RjIRzb4QuSeLW0Mg
 BQcg==
X-Gm-Message-State: ACrzQf2bFeXyrgRA8rk8oVy2WLT2OWiBq4DkriPkpwyaVSmI4pzsg2+Q
 kjdGmsHsWofWvQumCaLuAearHHyCwCI=
X-Google-Smtp-Source: AMsMyM6+BfmxBgGlWmqYlNH8CqTaxo/8uOabtWLzJGhN6EKNR5WUwo70U/YCOaaFajSglgjL9dM7UQ==
X-Received: by 2002:a50:ccc2:0:b0:460:4db2:5006 with SMTP id
 b2-20020a50ccc2000000b004604db25006mr44537682edj.369.1667730107084; 
 Sun, 06 Nov 2022 02:21:47 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b0073c8d4c9f38sm1966445ejc.177.2022.11.06.02.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 02:21:46 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 11:20:50 +0100
Message-Id: <20221106102046.13138-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221106102046.13138-1-heiko.thiery@gmail.com>
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bure9giTHlaTvplLzDuQRK2cU2Kkj32HbMMSCY9eYU=;
 b=cpx4sQbqG2aw0p/0hzwS7mMzVs4e48C3+N5v9C4p5HjAzjOaJwHvHNEmBembq+C3Ag
 eESytdCb0GvQWwFWczJmXWtHC8QtukXpwHZGX+R0hnXoSAbe2FSy3FzbVX8aeHyjRFfb
 2pTQjEEa3RtOpDMgqJjKnhBV86VxtIdfU9mXECdUjqGurzKRWQgbpHS0cNZphAQA7ucV
 R43/zNO7tE8SzJtwx2YlYyrhiKcVOPitq250MFSeZWKxDsEvugQfU59T8V7P1OyHg2y0
 n1Qik9Fk9V2rrmsJVWClVEhI58B76nhCq7r4iVCRWzHEQ8peeSE5iV2W4QZpC+KGtPWe
 X0NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cpx4sQbq
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to
 configs/kontron_smarc_sal28_defconfig
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2613624f4b..9bd98da5ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1243,8 +1243,10 @@ F:	package/volk/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	board/kontron/bl-imx8mm/
+F:	board/kontron/smarc-sal28/
 F:	board/kontron/pitx-imx8m/
 F:	configs/kontron_bl_imx8mm_defconfig
+F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
 F:	package/ipmitool/
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
