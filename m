Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5555AC71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCAA6415A3;
	Mon, 28 Aug 2023 12:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCAA6415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pb_oB2eXEsJY; Mon, 28 Aug 2023 12:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13D5411C6;
	Mon, 28 Aug 2023 12:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13D5411C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F69C1BF410
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 12:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 689B081F36
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 12:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689B081F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqBWrGWOx1Dl for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 12:01:58 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69DEB81E11
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 12:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69DEB81E11
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5009969be25so4936152e87.3
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 05:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693224116; x=1693828916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQhHl2943H1tfWA0XcTVUy0ALVno6Goe2tRZ7eweT6U=;
 b=hANEDPXhWnHvTaV3s0oylUOMvzUilJH+DUnBLnaHteJ2ADUyhJAavcAEFJdRaBhRFZ
 sncilImkW4Ay0sg85Mya692ZfZPrfQ/pHWLMYPgKttxvzcv7pFiKeCYrWU66Wb8uNHBb
 2PN9baL+zqPJK5NttwvIQxqIggEIjF3KZp1PZWJu9uMNIj9qbq6eXkVhYmWLchuEIl0g
 qMYu03GCO1bvsoojZ3FyhIUZobJeosw2M4L/gB8NfnTDOk90NaFxGKJ0HX1UoyLuwiU5
 tAAHRrNK6E9YPPRVMYnmV0oeZ21b74bPN4a5IiyB6oxGxrpzx2WC1MgboH+kI6OkabJ0
 auPw==
X-Gm-Message-State: AOJu0YxOzw0/RtPh4oP19YkAmR4Cmj/GHaDn9iH7RSBYiEsKHMrnjyaP
 dVti5lN34UwxqDXt7Y/d0PcgfH5d8kdr0A==
X-Google-Smtp-Source: AGHT+IFLotX5GlSoQAmTKPW5BgLzw8DcAd/PaslmujhzLSM3rizLL1ESKpZDLTs2AfZSFxaJDKtwQw==
X-Received: by 2002:a05:6512:3056:b0:500:bd75:77cf with SMTP id
 b22-20020a056512305600b00500bd7577cfmr897182lfb.17.1693224115417; 
 Mon, 28 Aug 2023 05:01:55 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm1555753lfb.140.2023.08.28.05.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 05:01:54 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 14:04:19 +0200
Message-ID: <20230828120419.3297803-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693224116; x=1693828916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AQhHl2943H1tfWA0XcTVUy0ALVno6Goe2tRZ7eweT6U=;
 b=bKzBmW695Jm45Nj6EtDfPzXxZv8C50OcR/MBeSttI7wk3/0DP/DY+MFz9NItaMvxlZ
 Q66ybwD9XivAn02rGfM9kn/yc6lbp2ZX9RT+EzNEmfVvkOxVwii6Syrexb81rBXxilfw
 QiKLxHJkrOAPd2i1YPPqTRaVWWmV55CbmUjY+b5+WOev1QmTB2HxwKjKLAAXpd6cW03A
 M8mJAGvI6FBF3QrT2Ph7j0AzVORk7/0iSbalq4GL65L1xszzb0t/iT52bgztRgqC8nm3
 MCD/XiIYl8M6o5qANEgRo0DflqA6+yA1iqtZB02qQoJRvBu6hp6lNiQ3ghPgErWdfw7J
 3RnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bKzBmW69
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.6
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 3b88b8200f..d122fee86e 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bc593afb31fe1ac3d50419f917fafe321a0a3561d7bb2ba498a83740fe3adb14  libostree-2023.5.tar.xz
+sha256  b43c4a373799681989bae12b3a1b94f453068dece6540b8e05a23b834c1037e2  libostree-2023.6.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index c61c1d1508..15093f4b7a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.5
+LIBOSTREE_VERSION = 2023.6
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
