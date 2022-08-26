Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACACBECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DCB141A2D;
	Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DCB141A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLK-1JezLDbX; Fri, 26 Aug 2022 13:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1695D41A10;
	Fri, 26 Aug 2022 13:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1695D41A10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAD801BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8429C82FA9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8429C82FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZPSgBWkgC5m for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A154A83EF9
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A154A83EF9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u6so2177122eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Xx4kvnnbEUGesnupoTu80viu9ga6D31KQ5I5mDpLpYM=;
 b=VgInZVWxt1ZXzwNYBxdr23KKUXBao9KDthShFdGbOejYND20UK8SSiD6lMu5Fqs5wt
 OAnxr3blMJezQsFD0TE5WUu5debwNzaRUph5Px9KgKtDybPwMhqAQ6pU/qrm8RjLR/F7
 GjxGo5CFbcusDWf0qXnoEY1wDsZu7sCSiLEX9mjcD3odH9UbAVhOojEPNdqo+BPl1e7o
 zPqTrEzYvaDQztH2IYa1Rze7Dou8OAmTOvWbBqxAFlutlAaKTvzQRWO39uoEPxs7XpiR
 BaAfYl+3XGnlVurE0RXM+D9MzPduK98xlu+Pu/vCaU+BYohPmdAC1Y7Mm7DIix5CTf1b
 IWqA==
X-Gm-Message-State: ACgBeo2VwaSTwJv6EJ7VsEYw6cCQjIPGnb79rHbmar64XftAjx1O5UiP
 A6/15QYoq6P2OHv1mliUN1TJR8/Rrfo8+4c8
X-Google-Smtp-Source: AA6agR4wZOsgC5mV2wZnyexGfHrTUNmHtnt1SLwIkEohTYfadjEvxxa6oG3SdBSHmnPEqCOLKqX89w==
X-Received: by 2002:a05:6402:1956:b0:448:19f:3ade with SMTP id
 f22-20020a056402195600b00448019f3ademr1230232edz.26.1661522107564; 
 Fri, 26 Aug 2022 06:55:07 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:06 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:35 +0200
Message-Id: <20220826135503.20612-2-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Xx4kvnnbEUGesnupoTu80viu9ga6D31KQ5I5mDpLpYM=;
 b=kQZlbGzJg4mPHetr8RKJI1X0F7ZpjrYqtmJ39IBQ700+b7PioCKQbwZ7OS6hGFFkpf
 m9BXQU94k6w8mEv7d4+SIiTqyVxgqbuS3or2vWatkdBdLD831ZkwFntJCmIHmo1Zjruw
 sM4eE5EB830IENpD1wQiae+XpHymTRka+KonrUCdWwUALtLyQTwX7YnDSyzUoSjtEb+a
 PlgnWsr/0P9CP1TvGOfKcZ2erPDy7TVUx0LSsRzjW9Pf3ppC8OIAe3cfjwsw1mHiGBF4
 vj8jQRKDQy882uptHaHZaD6y3TNWOD7J2feeWEmJKDmLbQ9X1swXlsjooLtchNBiCw3h
 EV+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kQZlbGzJ
Subject: [Buildroot] [PATCH v4 01/29] package/qt6/qt6base: Add qt6base hash
 file
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hash file with just the qt6base tarball hash

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qt6/qt6base/qt6base.hash

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
new file mode 100644
index 0000000000..31ed2494af
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.hash
@@ -0,0 +1,2 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
+sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
