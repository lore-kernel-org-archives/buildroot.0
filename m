Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EF2C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D294D6084F;
	Thu, 13 Feb 2025 08:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NavGIGd2KFA; Thu, 13 Feb 2025 08:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A406119F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A406119F;
	Thu, 13 Feb 2025 08:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D820199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 456B8820CB
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO41E49zU1ix for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E66DC813D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66DC813D7
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E66DC813D7
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:06 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21f61b01630so28023745ad.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 00:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739434806; x=1740039606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eE9OrQLwpI+0UVNOLZa0v1SDJjpCYuZdOAkjxPsMsvI=;
 b=vlqNqNaYCs9RlnZI426Q6nYGsHy1gTUnDRMHUpdXMW48R3EtnStqjjdNovZhCVvzvx
 NPPD8HgEDdivNP48QX+VDt8HY+f4+Dr7wyMAsqIefMj2YF+rbs5LcHDeg4aHEEvkusf1
 t/I2MNhmbolcuIEQP67mwo8Nv9xSrDRDa91Nk9NmMKEYpFa2wFDsqBu8LC5WKDQANwDY
 MG1rdsDDtgUGjowIPZ0wefjnvNnA6KSrmM0cqeZrmSPioxNIpt48sfXkeqxhJxFUw6x6
 75uUlHfwYuVSob5MgE6eQaHaQUvABnh3x+MH3WklxlzzKrdZAbot1VQ7887F0uqYmq5r
 UeNg==
X-Gm-Message-State: AOJu0Yx3qzQtsv4EZK7CYxhfvb8N+IMQsDJrH3qfu4Vpx2zvXFRcZslr
 X/v9w26HwO9B530NvgG5DeKMYgTKEPtDir8z+oK0K2mvsYpLXngkeDDuXw==
X-Gm-Gg: ASbGnctNvpKd0ZQha2sw7rj7DCn6YZ2LAtpq3ZTQvwinc9fPcz7+M0p8Cmqpcs8LiSU
 LTqzz6c892vxX2cxtsJYrqj/p16o32ORc5abCalcN6Vom7uG9d0M35JbZer2/Fuw5JX6TaOmnH4
 gJme37FpFZ1Mu5NA7pWXXCJCE2EXSg8FDGd6iH+I5QA8W6aY/LtvITt5UxbTmiA5MLiTV+vgjLs
 VMrCnBitqXgGlsfFJjPGJ74vTTfObT7HlGBwgtpORaCP9ZeEanFZGujDfrzXLnm8Xq/yXhhcvzG
 DB2+mfxy49RSKfZ+8yv1OOdu+inXeVgWHFRVwz3Zb7r6X0JO/LNFUK0=
X-Google-Smtp-Source: AGHT+IGU7DjaHKBrpdVaeUjTAaFf+13ybSUjCnJRqXYEx5JjpV7QJZSDevkZekxiMsvpf+agUfDaLw==
X-Received: by 2002:a05:6a20:180a:b0:1ee:653e:1829 with SMTP id
 adf61e73a8af0-1ee6c6f81abmr2611043637.21.1739434805638; 
 Thu, 13 Feb 2025 00:20:05 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:7c9c:d673:9b41:c416])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb581306b7sm673327a12.17.2025.02.13.00.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 00:20:05 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 13 Feb 2025 01:19:56 -0700
Message-Id: <20250213081956.24293-2-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
References: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739434806; x=1740039606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eE9OrQLwpI+0UVNOLZa0v1SDJjpCYuZdOAkjxPsMsvI=;
 b=Lt/XtHgCDNk3X+GlC1i98A7j3ZLeHtWnoZnMLF0y3drKh/djTdVrIzdphwTDpcYCbo
 ucfDZCVmneSrpdKcu+KkW/pgtbSb3LgjosPFa7ftxdhX3ukO4oPV2sWBQ8N9yEfiK26f
 cLQXEbR2ZA2ZSqSlmWECyAWh89kLA/R3LSEAV1G/jj+1kVQTDV7y9an6zfcxv6svw0CI
 Vjf9wxo6aDJK4S1Aq3c3v7Oq64HFltQs/0fVVtbqeNJUMJ427zNVe3wQ9Lni/QwM9BHH
 btgEwsAU2AhkwxHdbF2XxcIjgf+3xDCMr5QUk4bkwRhwjUVHL3mRPAeWZ05UmmyRk1I/
 XMDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lt/XtHgC
Subject: [Buildroot] [PATCH 2/2] package/sdl2_image: bump version to 2.8 4
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

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.hash | 2 +-
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 53a887c6f9..9d5ae395cd 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
+sha256  f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
 sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 40b9e3c915..e058cd9f74 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.2
+SDL2_IMAGE_VERSION = 2.8.4
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
