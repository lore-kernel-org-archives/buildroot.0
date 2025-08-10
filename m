Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0A8C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 09:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD0660F1A;
	Sun, 10 Aug 2025 09:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5a91mpRK3we; Sun, 10 Aug 2025 09:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCC260F1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCC260F1B;
	Sun, 10 Aug 2025 09:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B10154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1714740D7E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmLQaOCkRH-J for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 09:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.47;
 helo=mail-ej1-f47.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C74C40ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C74C40ADE
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C74C40ADE
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:54:40 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-af66d49daffso588756866b.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 02:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754819678; x=1755424478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E1sFJvd/GEvEtThKFqQdEpmWGSDV+2dZGCTDmD/lRSM=;
 b=ZURS8ZfhPyoBEaFIAeX1mgOCV3Bs1CynKF8IvMgAnvGDO+OQrmUxRNGBK05HGouPgg
 h5nU0+D2JSCtQudszIBeR8Y+OtCaatWLrXz+fSmr0A8uEeCF88dtBaF9wKZGSTYrZ5sJ
 x7OY0ct3ubByxCf0vZDjfZjxEYY2G+b4D8JG0nYcJ6JmCfUTLNi48Udr7ZQfMX4e/PbY
 Odj7AV0TGMSNM7R+czRqxoZUxoMtZ2irDdYuBb8/Hk2InWBUlD4dC4F/fIPKhzX2duYs
 sqASxjKUrTt35t6Lf0yYA38kTyhWmYt4l4wTuSqZRsdoaHqyi6iAK1AKota1YhD6xomp
 N/tA==
X-Gm-Message-State: AOJu0Yy6OxArCKf4aN1KjLV5bQjvajLAc0hvy0wN7iPBRH5y1cqYV3vB
 71jQevtzDib21+I/aagPfTiboNJDsnlHJjKXAK/e9UbQZPvko2hwzdQp4ehuYhbC
X-Gm-Gg: ASbGncvnIgPa3MLZeNLwTVhp12Xn4ijVlTu3YoHUzYKmtRqLPIA1Gue3JTMtgHrVd5j
 mx9LN/xtmyult7vPBG3WrrhHkA/ZqizdWCZv97t8syOLB21jrYkS/UpsFD9Ar2nzyEDrb2IYBnN
 dwCTF/qFTZczKbryFdr7o7if3DfhtqjLWRe/69gfXj0ILO6dfRerO4xXg0uNqQybV0hzutxcYZK
 0l6kDTXhnw2d7/ENNRrOwPpCm4xLX4ei0w3VnKujJ7qn3geU8bC7XFJ/mCnUVpnQcJTLMJWOd8Q
 l1ShIM+kuNqakURtv05PqDYZTHvjduBi25tKggxrNLm11uqpFdap+veNqs18WdMBaCi07M+8v6j
 ERdFnN5U2EdQktxAfehvi1Yug50hRbgIRaZwcrbA6QlC76N4Oux55sWlmJeCln4E=
X-Google-Smtp-Source: AGHT+IGLQ15R4UXPwaWlQBwS53gdCMVQoAlXbeEklrlFi7NL+3FyzdSekcfxUjdBD+Ftt5JaD3OxSA==
X-Received: by 2002:a17:907:3d0f:b0:ae6:a8c1:c633 with SMTP id
 a640c23a62f3a-af9c64f9025mr792110866b.34.1754819678000; 
 Sun, 10 Aug 2025 02:54:38 -0700 (PDT)
Received: from tpx1 (ltea-047-064-113-075.pools.arcor-ip.net. [47.64.113.75])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a14a0sm1828808866b.33.2025.08.10.02.54.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 02:54:37 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 11:54:25 +0200
Message-ID: <20250810095425.9828-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: [Buildroot] [PATCH] DEVELOPERS: Update email address of Thomas Huth
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since tuxfamily.org is slowly fading away, update my mail address
to something that is more future-proof.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 Note: See https://forum.tuxfamily.org/post/3399/ for the info about
       tuxfamily slowly going away

 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597af..a28f3e8d57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3238,7 +3238,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
 
-N:	Thomas Huth <huth@tuxfamily.org>
+N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
