Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDA3C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 06:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70EBD81E04;
	Fri, 23 Aug 2024 06:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96C5cgRCbX95; Fri, 23 Aug 2024 06:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5E281E05
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5E281E05;
	Fri, 23 Aug 2024 06:33:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05CE41BF3D7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 06:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2DCC81E05
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 06:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WNHcsyvKxzW for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 06:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACA5981E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA5981E04
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA5981E04
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 06:33:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5bec4fc82b0so4754724a12.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 23:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724394811; x=1724999611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=erXpa9CNT+zqYWyZO748pfIaMy3/Ai10ynJ5iGA7YGE=;
 b=uD2vHIxyfUveq7fFVaGClKP0dzDbmmIDsKbEcjs0pTHf1QAxG6udqEjAtAVYF5vb9b
 bglH4FPbQi5diCK+DjfpwrXxLVj+8SmAGvIkosVxq7uA1i1PSJo4xllN1xqSRFp5MH4C
 lp8heVHo2eGp7EldoMdURmpP2zSbPk8ymLbbHlD3SNivFtsSU6QbAde/lbQVvMrjedfx
 MMDiikOfopYv79U/5MV+cbObV85EhgOBUuijnM9et/EKNW5Onvy/QBteY9mX2+OOHPGZ
 fL89hJ7GaMesEjKOAsop7i6yMVqqoyxzmPnO8+97m2kx/FICLMlHxaQsnDvuPuij1/1t
 1jlA==
X-Gm-Message-State: AOJu0YyQnAgx8Lr4mIBlxBl1MFz8rWnWDI9w6CXXariVDMsqybYnfplY
 /9c8knKoszwH2ejwTOUr2WKT/XocXiCKRZF/Cfbemoh/uxy/RT2iETbBlC3J7PFZkRSbGh/oFHm
 iZDo=
X-Google-Smtp-Source: AGHT+IH+ALFXdgVnhdVrtCuwp9Jrz2zZOeeBwGU03uZoIvjDbk+uSSa8TXqYtckDdAbOUOHKpI5GxA==
X-Received: by 2002:a05:6402:249b:b0:5c0:8d62:bc7f with SMTP id
 4fb4d7f45d1cf-5c08d62bee0mr287247a12.8.1724394811316; 
 Thu, 22 Aug 2024 23:33:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c044ddbbabsm1661617a12.3.2024.08.22.23.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 23:33:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 08:33:18 +0200
Message-ID: <20240823063318.961358-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724394811; x=1724999611;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=erXpa9CNT+zqYWyZO748pfIaMy3/Ai10ynJ5iGA7YGE=;
 b=I5e25A+HiqU/EhS9cnn4jFghumtHmnye0/1iw7uoa8zrq4jbBkcW1bPzQvPUNMbABQ
 4VpvwoiYDoBGzdc5aMqXG7ypZ+1WBd42aHBo2KoTialUYFkFLrGQJ8KhqTlPqwSzQb93
 pf2xJisLbm9LdUm3qxz7LYnQnefBGdG7BjZ+0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=I5e25A+H
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: add hash for
 enterprise-numbers.txt
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
- http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ipmitool/ipmitool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index c3b298e3ba5d..c303afa0f5e7 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
+sha256  ba2da37bd53a3c04df63c3e5dd1bed123e693ee37fdb9b834f61d2ff4df68a40  enterprise-numbers.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
