Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA48CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0C64276D;
	Mon,  8 Sep 2025 11:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypfj_TbPOWsc; Mon,  8 Sep 2025 11:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586E342745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 586E342745;
	Mon,  8 Sep 2025 11:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6B1CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C844414F8
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njFSlfCYtSJ3 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dimitrij.kotrev@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DC8F40098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DC8F40098
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DC8F40098
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:23:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso37755615e9.2
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 04:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757330605; x=1757935405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0slutqHQuA6GuKc50MwMoD6f0Ivo689E4YJUaEBM0Xk=;
 b=DuCFuSX3FCuW7hfoPNPw3jaCNnEVx2mew0UCqOP3MzMSSww3fzuy+o4z+mYsj3Xg+c
 ouv1ihWFd/2AaZOvFStWFYxbHHeFBCrP206MeWXbqUZp+EWg+b4gVj9xjEcmY0g9yTKo
 9sMV3kzPnd+dRkM3NX8HHOiyCucUZ3SretXR9ZMyI5NFxEdckiONk+L18HvIWrjHQEQX
 +BxzZPMghKUov9caMVDdU5vK94f50vLp+Ttq3TY/A0SepIu0CtrDegqnRfhUK8qZWsnK
 0qnVmfxfjumEQ2IKF5CzMgIlVHGw5qsuxrcI4TIyPntnZlQ/1CgPMBsMy3synOFuA+HE
 d5sQ==
X-Gm-Message-State: AOJu0Yy+SBq320Fo+bKMAdJBRjv4KhqBexlI2VdugBzNsGKOvNlaHCRO
 bLQPaQ3vAjQyXbl23gJbl0zexFvcehLfnMiQlBiv07T8DEe9xZ0UttCEqj/lrB+/
X-Gm-Gg: ASbGnctqLyaoUeAGNi31QTgA8GI5VtvMHH6bEMRXn9jcwNUwkGVSvoCYKde/G5wgrmg
 OkJR0tB4rrUmlSOvl9zh3EsOR/nESQNH+9zAXIFmZLjSIvNaSg+rQhTby3jGNSH0nUDPRgkt4tI
 x2xeRsktw6Arrcx8sT89ze1bKW1Z9sBNb2cLUWJb669BNW2GMdtBm762xg9b5Cue6kasnRXegW8
 464s7GqeIV5XGnIsYorLIQDxb2fsximOK4slFhsQ6+rad//viOZ+0/zfSJCYJhCjyqnWXo1xnN7
 L7gIaQjzR0rRGX4hAHwjqwJZvUKk0NPcgWJW4qMMyzFA2JSx8JUjM++HidYM7yhqprWJ4UVpzh4
 aAumoXC/2wNOZN90rbfQ38pjE7GmOnhrurzqwk5Ti5hTSy2oS4Gcvab4vGrYfBQ1GFYPg40bQSo
 M4jXwO8w3glMSWtMBGSjt6cHeQZ0h6u2o=
X-Google-Smtp-Source: AGHT+IEBUsRvToTTCqup6YnTKQSABtVvd3qubhV1ghN/Z1fviMbbwNnDSq7kAkQTG751YAbQSl5q1w==
X-Received: by 2002:a05:600c:4585:b0:45b:8ac2:9759 with SMTP id
 5b1f17b1804b1-45dddecf557mr64728565e9.23.1757330604704; 
 Mon, 08 Sep 2025 04:23:24 -0700 (PDT)
Received: from alpha.fritz.box
 (p200300fcdf149a00b75962a58b46df1e.dip0.t-ipconnect.de.
 [2003:fc:df14:9a00:b759:62a5:8b46:df1e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fba9fbsm41247820f8f.50.2025.09.08.04.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 04:23:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Sep 2025 13:23:20 +0200
Message-ID: <20250908112320.926300-1-dimitrij.kotrev@googlemail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1757330605; x=1757935405; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0slutqHQuA6GuKc50MwMoD6f0Ivo689E4YJUaEBM0Xk=;
 b=GsiPuj6KG/PIwq7R5urqJHinzQDiNICZ+G/tb+c6qD57C0nUJFBS+fyqXNFrVNfdzy
 mJcvFr0sZRqTjhS1zhiQycuyL0t4BE1xKW+iK8ZZAc80Kt5PNideMYNKzxsMprqtbZgh
 7vfENzYSUH4ROoWujycTb6XxEwB/jIq8ngCHsUJ8ceTSAbBETCFIuGGScQ/xlW9uG6l2
 3psaRHH+75GIMhxgHNMSjyubXIKN4hdzfSBMp/Q/3T7GqiMKcUCKNggk/xVgMcd0hPL5
 VlR/MavLQ18FrRSQrK13pBTW18I2oMFd9U/dMqC2zxMC7NZ6CxLb65NFzMCtEJ2XCo/F
 ClzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GsiPuj6K
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump version to 11.2.0
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
From: Dimitrij Kotrev via buildroot <buildroot@buildroot.org>
Reply-To: Dimitrij Kotrev <dimitrij.kotrev@googlemail.com>
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Dimitrij Kotrev <dimitrij.kotrev@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dimitrij Kotrev <dimitrij.kotrev@googlemail.com>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index aff52ccb6e..29b2b13c66 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  40fc58bebcf38c759e11a7bd8fdc163507d2423ef5058bba7f26280c5b9c5465  fmt-11.0.2.zip
+sha256  203eb4e8aa0d746c62d8f903df58e0419e3751591bb53ff971096eaa0ebd4ec3  fmt-11.2.0.zip
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 113652e911..dfb6fd3942 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 11.0.2
+FMT_VERSION = 11.2.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
