Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2157C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0261860F2E;
	Sat, 16 Jul 2022 21:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0261860F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxC_K0eLrr28; Sat, 16 Jul 2022 21:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2098160F27;
	Sat, 16 Jul 2022 21:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2098160F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B130F1BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7C160F25
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7C160F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiSeaQiHoYje for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 21:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D1F60B5A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D1F60B5A
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 21:19:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so5142993wmb.3
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28a38SYrl/yUrWr4aQTNTJjfkdrC7iJd1DiM0G9nr+A=;
 b=LASjfiwJvUGwhujRBRl0fc4zXK/pnTku8/VIgNzR7oSVKP78jtVgitjosqvO6TxZYJ
 YRmOBUiiEK/x3zu4CRAABum2ByS6vVEzHlq8owT3PIQERDHLHlzyzugIZXhnEpjL+dJ7
 b80DWJjmoiIi/CtK7TlD9IVT49wb4gZSkIp2PL1dC2KhVCqhKfduOjCjldWJ0W+y6qeB
 vozsfAfoqWFPWZHyD2oRxvpuNitA18wJ7fYnCU02DcvzA6UU6wLJbyFBGtgHdt1cUQQ4
 u2+W5kqlrisELtRpkemtiNpA7QgQsTjcsoMyzd/99i8ej9jVxSv+38Rdt09PwI0yPCqj
 Pcug==
X-Gm-Message-State: AJIora8s0kNt2dlcH6dA+mjArEaIrX3FFZ9sBs9uP7UyB+toRSJchrb9
 yYI/WNYw80L81yjkvLKOaz0NyYlOLiY=
X-Google-Smtp-Source: AGRyM1uB4d70y4uvL+01/R+gv91q86BOX3xkCvzGMWqudHFKYzrMa0LAHJARdlPwSOQ5V5JPc0JX2A==
X-Received: by 2002:a05:600c:1e1e:b0:3a3:b97:91b3 with SMTP id
 ay30-20020a05600c1e1e00b003a30b9791b3mr9642935wmb.25.1658006358814; 
 Sat, 16 Jul 2022 14:19:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adfa34a000000b00210bac248c8sm7109517wrb.11.2022.07.16.14.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 14:19:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:16:04 +0200
Message-Id: <20220716211605.1650338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28a38SYrl/yUrWr4aQTNTJjfkdrC7iJd1DiM0G9nr+A=;
 b=qxVlvIvIJGWLJMpgpwvTVIQViO/0CYczL6NhH7W1iPLovmxrWJ3C/lCh73Sr6Gg/fy
 9KQl0yYSbuvS9pGCfdTxDO3sDx3KpfnK/ETNK/He9bsyRHWGsIxiGl5XpPUnnAyMosCh
 TA9whffjnHWnw6s5YT0C7uuqpD1raMHuqQRAIAMQ+hd/fVgrb4nF4gXE+5FKgRJLQ3Mg
 8VDMJyLBvhuOyc0cUa3c3W93McIY1AZqooOlGHL0YZ9gQgsNXiZNaS67TXSuh8TLanPT
 4y3B0tBMNCn9Sou/PACzL6DBXwOJerXFqoa73Cs7GC9KYWYZegybLuWfE7VCkqZznvSX
 gK3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qxVlvIvI
Subject: [Buildroot] [PATCH 1/2] package/libwebsockets: renumber patches
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix wrong patch number added by commit
2097e1ba3904be8f7cd388fe1d16a099da83ef99

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tch => 0002-cmake-remove-duplicate-LwsCheckRequirements.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/libwebsockets/{0001-cmake-remove-duplicate-LwsCheckRequirements.patch => 0002-cmake-remove-duplicate-LwsCheckRequirements.patch} (100%)

diff --git a/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
similarity index 100%
rename from package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
rename to package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
