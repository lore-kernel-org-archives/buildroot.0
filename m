Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB21C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD7C61294;
	Thu,  3 Jul 2025 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTJmxx6X1EL9; Thu,  3 Jul 2025 20:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 389D260814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389D260814;
	Thu,  3 Jul 2025 20:09:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D65193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF3EA83B0E
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK3LypUPpYT8 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C147B83B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C147B83B08
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C147B83B08
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso190272f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 13:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751573359; x=1752178159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M5jcGXxr4cQfoe6UypxrQ4LDLTAW/DThdjWccOJwJm8=;
 b=pdSCbQUu+3Or9qRCY4sPphuSLukSnffpJ3dBNEwC3ICn20vIeVt70/rzJc0/LnhQGQ
 8ryUi0pqOgtm/EWpgtbDmv3SVlAG8tOvRSj6u1BKZ+It37ptfWzvtGS7JlSiVzGo6DMx
 BlygVEforOpQzJYWBzJU3sNQcwthFv7CiY6sYVT/GkIAaYAiXr9m93fMsfCMLIvuQ6EX
 EXtYKoeMMOtA+bYp/Ct2iTmMRWD75P5LxdVygSnRf0PQubCvtxwLnVygbwMJJrw0uWC8
 R35VCnAPs5eooiHLfu6upLT/hwoHfx1h7dkWn1yjVh3vnVWeF3/ETHRAyn84IY1As3Wu
 ghBQ==
X-Gm-Message-State: AOJu0Yz3WRiAaqhE+EgxCx8XZ+pemSmWhlctq0z35XrruxAwYbaiyOsg
 1/EB5FyhQZ6dNVC8Cd74JwRRmP1SXEnCsvbYfzi7vod6phGQvlBaB7CbpwQ1uENouBBzHrm+wyd
 iLR7m
X-Gm-Gg: ASbGnctLISKcEcSEvqg3x1Am96iOOSwS8W/H0irmVGOE0ok6SjlSEWr99RLmpFKkXb3
 Qtu8rO7xKXZ0dRNKf9CwF8uOn1+n59Qcnl73mLCHtbIQnXDlwtaxSJ2JcCYliw82HmbqZOogK+2
 8TadQ+nrOyCbkOrr/1dUyROppdikFD5k+lx4M1A5ie1xvoRSGYO0A7tOkhRNkCMhHFSkCUYvDv5
 eByPoorbyx8uHUsbuf0jY1S8NK9EMUx9wjhh3FZPNbtu+O5EkY04uvloEL+OubZdPXYNkDL+cy+
 v81x6Jljo6jfCqOvvKFvNKCdnWTYqMrZpPXB+rQLe1x8MGWx6dHByKnmgkNiTtjOc9iD9JS631I
 +HvjMeuwbyQ==
X-Google-Smtp-Source: AGHT+IEnwrtGTDmCtqnstUWv4jvJQpfRd6YPNc6Ch+RJ1ykNL5FCUOh9Y9tLrc+tRZn3y+rxaruAgg==
X-Received: by 2002:a05:6000:2509:b0:3a4:f7ae:77ca with SMTP id
 ffacd0b85a97d-3b1fdc20aa1mr6910199f8f.3.1751573359022; 
 Thu, 03 Jul 2025 13:09:19 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a2e8sm576841f8f.75.2025.07.03.13.09.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 13:09:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 22:09:15 +0200
Message-ID: <20250703200917.4054251-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751573359; x=1752178159; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5jcGXxr4cQfoe6UypxrQ4LDLTAW/DThdjWccOJwJm8=;
 b=J/wgiAPe4al1Hg0w2DBsEakOImx27SIIE0g/T8lQXV3FmmkXqEj+W6wz7AOZL+H/Yf
 Y2H1QMoriZHe96CDZxVwL/svYBfC69vBeQ3c8ZsO90k/hR6RaTMIjEIRurYDgxyuEqiH
 joP8CFeFY2jYximzV9S7jhWsp6TRnNGaO62qwGzseAUDytzJKgehWWbjxpDCyBRbzWjr
 BoJ4Gn5JX5+7B5/dQNrCG+XyLxelyMOdYE0JXAspLAjXUyD+IFDFM3iGxsVUy3Hk4aMG
 fT4qyh28Vsx9E1sj1AZ+9JpVfTua1UtTBxgWtLWr0Yozm1bmH93Q5YjPm7NHEHwkrHMf
 bMaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J/wgiAPe
Subject: [Buildroot] [PATCH] package/fwupd: add CPE identifier
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cpe:2.3:a:fwupd:fwupd:*:*:*:*:*:*:*:* is valid for this package.

See https://nvd.nist.gov/products/cpe/detail/46E1E3C0-2F72-49BA-8374-1FBF203AE0F0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
See for instance https://nvd.nist.gov/vuln/detail/cve-2022-3287
---
 package/fwupd/fwupd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
index b35f90839f..d143740c43 100644
--- a/package/fwupd/fwupd.mk
+++ b/package/fwupd/fwupd.mk
@@ -9,6 +9,7 @@ FWUPD_SITE = https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
 FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
 FWUPD_LICENSE = LGPL-2.1+
 FWUPD_LICENSE_FILES = COPYING
+FWUPD_CPE_ID_VENDOR = fwupd
 FWUPD_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-jinja2 \
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
