Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0097C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 15:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1043361041
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 15:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1043361041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC80E60755;
	Mon, 27 Sep 2021 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwycBZJ7mD_m; Mon, 27 Sep 2021 15:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B0E60641;
	Mon, 27 Sep 2021 15:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E65801BF3D2
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 15:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5FDF60641
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 15:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ltfx8S0P5w8J for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 15:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 659D5605D9
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 15:55:36 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id j14so12090483plx.4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 08:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvSibW9+R/w+6Mm1+jU9sLRT88GCNfSbhAhsPtPrJwY=;
 b=LBoszC2UMessJH/7kE1d7GYwouzyGBbs2+K//UsUynt8vYE+QQu9Mx1jwVGkgyJ7Sg
 HhANR7g7g4HPWZxsWywFWcRK/bDBqK8fCiNGDMK5i162WQ19X3QTB4IvGDqAXPAXnZoh
 m8YcFh35LV48JwLUKvSZhlGvXfGi/a6DBChzs0i4sHlYgV7Efd0DlwcBzVqzUjR8qEsY
 9e4nevSXCGlaPvjvosxPiONW1utNYhF1rwkwVMYeiJ0iq7cQl4OGtmfapnilvbL1h3a5
 8MkBNLT1GXxvnGFdlJXp3y/IJqrEAffKqm/2rmYWIWh77AclJAvjXMVIToO/jymZ9Qr9
 X8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BvSibW9+R/w+6Mm1+jU9sLRT88GCNfSbhAhsPtPrJwY=;
 b=c9MF0gl5GEfx0l27uzljAEicLASPhwkWGJ9erX6v9GJbRI2mqspLYUcty3OMCpJ92H
 hSm9HRdoHiYRMXBOuM638uUjyJmj25rpw1sccZyWIF37TkMCmGq5EFhDRp3BpD7Y83A6
 GTRdATb+Yps/onRFh2rAIbTIWg3nXOkFpzUzbF2c39YhPam5G17HmtqwqmrhyATdCfEz
 HQk2g6N7vWcY7kaNd2nmzyw84SINvJVWjh7Ayk8rPAmIU35Mww2lHLZD47xaLiGYUS/9
 h2FedCBZQMn/bpdHBg3JdI+Axmxghdt2rY4NCo5FXK3xhEe7br2haBeoLYOvxRIKYHM3
 4Kxg==
X-Gm-Message-State: AOAM530aNqaTatSYgU2IjhxQxIm6MgYZ0LHOtMP8brTBJQ1GHsy8oVZ+
 naBf01//ASpA1RWEypWWu7CW1bSsAP0=
X-Google-Smtp-Source: ABdhPJwc+qYz+jlNyv2JjpBasBc7Xs7mk1GcwYRc2SS4/0G7tmzE0R5D2QFAXZZIdW/Yrxo5t/+PnA==
X-Received: by 2002:a17:90a:1904:: with SMTP id 4mr728287pjg.190.1632758135498; 
 Mon, 27 Sep 2021 08:55:35 -0700 (PDT)
Received: from localhost ([113.92.196.187])
 by smtp.gmail.com with ESMTPSA id t2sm20374793pje.5.2021.09.27.08.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 08:55:34 -0700 (PDT)
From: Jianhui Zhao <zhaojh329@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 15:55:31 +0000
Message-Id: <20210927155531.3793291-1-zhaojh329@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/rtty/rtty.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b2e9db2436..1b46aff47c 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
+sha256  b9c555005b76c1ad0f5af891964375bbdf50ee22b9a9f53ddd48d2cdb4e53b49  rtty-8.0.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
