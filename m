Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD19EDA685
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0EA6084F;
	Tue,  3 Mar 2026 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3CUm9hf1_sH; Tue,  3 Mar 2026 15:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F22360EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551017;
	bh=RJ15CKLAMyZomvMMfj6/9KJXn/pEWlEu+34VtGOFENY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8rvdskwPNhweahlKlqeDCX8vdZtt0F/f0+kiUaxp6iAiSkhOIA4eiDz1q0QRN/fB
	 7YOdZLD02PggCMOh5o9vm7Kqg0hH4ecKDa7TvCeAsBV9BE38RWRVkot4f85KQOIqW9
	 92nMAVeJXbv+uXXAjH0JItMRhdZalwcVLspzr/Bj1RgTMd2k0hg+hmCyWwaSZUH7Ot
	 M5eRKYuVj1bTRDadBuJcB/CpoheqPMPM7aSIfwslDEOgdb7tjMMRTrZVe0cJ51MDev
	 xstuJaGBvmMgQ2Il3TmgWseXiSyBmeiDJ5pQWhR6xBkDJCZzhz2faOTv82sJtw8EwL
	 oYmjbWAqbFznw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F22360EF8;
	Tue,  3 Mar 2026 15:16:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F3B231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48E6940281
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ir-qHee5RiWF for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B73A4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B73A4018D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B73A4018D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-480706554beso64121045e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551003; x=1773155803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oh6IoTyip+5dg9rtzFyrfeI9UnXTeG90rJCYn9Z12/w=;
 b=vDVyrpIA43/QYh+AqXNUwLOpNPI7C4UIXpY/2BqKGPMWoA4y8S9K14z5qBNRpyPvCL
 XSzMUoO0VL4dXEfnUhCxVY6J0KOAiZ4qQu8GJ9QbHap30pSRG+LUUw/2x/ZdIJg2w8+L
 qf4oUq/mvn7NLOT5DhC1KSzyi9eLwhjaWEoWkTZAV7t/CBnNDBrVDzKmpH+syEyt9HWu
 o6HG+p8rU6YvC0Z1hp8B5hvvZ0bt3FpZwP+11zCgD8Fjvueldli3jzrurw/Btnn74u+o
 od4TMhB4GhFFO6byyykjSiWFizxp1MD/1ro/A601o9FJbYVHo+FmCv9hOfTGLb1PcOZ5
 eV6Q==
X-Gm-Message-State: AOJu0YymjIK/eUlD6W97IsbC2ag1AxgdKa7IPcFQxXH8vfcXqGUrw9ck
 FLTiri9xoHeLrBr7JY0ZtXniB3I/AYxhNT9Vxr/Gvgxjk8McgY8E1T29lHNzxPU9E7Ad8+8gMqo
 gHg7t
X-Gm-Gg: ATEYQzx7jHJqDKaYmSrMw8FGcYc8WPbdcsWAB2IXoOP9r8FozKW3WmXgY1OLWkRKTm8
 DZwzNZ2kdEIGzKHOrjPpK5UTneH6LWNgz7Zv8B9YQ7kvJ6h6u2qxc/ADpbf5nvw2CMs0rdw8N7U
 f5vJP9kXWatOPEX8Oym3hE95lG4obDbfnyWq4oNrlonPyUN1SG+VP5s4F0UPz1XT6Cr7v6XrTur
 xpqR0ZEYHzNmQgrhsKwK8jxGwhsDSfX0CX4X0jbwmB5hcniZgWu7RCs7qYPfMECZDCbOCqTHD5r
 TteJPPt3qRpoNx+oNhN4A2UuvqyEMNlyEPPLQIbn/06KFctxW8jA7u0hpvZMkJoboBeBeqTCM7U
 8yxRYGhfw0SNekTIb/3Z+sXATMfd0cjYeKFvute35iSliFnJHB7h4zK616LoT640OlSW+o1iQvi
 tnE1X7yzSmhbux2KQ=
X-Received: by 2002:a05:600c:5490:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-483c9bbbdd9mr317720265e9.16.1772551003291; 
 Tue, 03 Mar 2026 07:16:43 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:32 +0100
Message-ID: <20260303151641.382820-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551003; x=1773155803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oh6IoTyip+5dg9rtzFyrfeI9UnXTeG90rJCYn9Z12/w=;
 b=WWuSfJu5p+MfSq6LcEI9o8FSSJdOML0ehP1jUMZJk1hSrdTVzIH6tVtCUAEE3NZcGK
 egC5NVkHT9FX6zzZP31RYqrWmbk5nBaQvMCumgm8zBkYMTVNeSzJ3YmuOflqapRIo9Fg
 gcbj0dQP9UZLi9FCF+ilBtsEwKJ0FF2S5ua4IH6VZKQPoKBYjbuM29/tC/tB3rctwP+C
 04qYtVQUyxTafXUjZDLrKTjfsyo9SH6phBCtUC5oND5vWnvl9ZfyBeB09DBvodLqda4K
 /F0Lt44AzLBk6RTI0me5jaeFLoT+0QWESV+GjRinuWnt++ErByxNy1ybKER7rkcN7x9M
 Nc2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WWuSfJu5
Subject: [Buildroot] [PATCH v4 0/8] Support for Cdx 1.7
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

v3 --> v4: adds the two last commits

Thomas Perale (8):
  utils/generate-cyclonedx: use tuple for version
  utils/generate-cyclonedx: move license download in a function
  utils/generate-cyclonedx: move utility function
  utils/generate-cyclonedx: encapsulate CycloneDX generation functions
  utils/generate-cyclonedx: optional bump to v1.7
  utils/generate-cyclonedx: mark host packages as external
  utils/generate-cyclonedx: add 'id' property to resolves
  utils/generate-cyclonedx: split vulnerabilities per state

 utils/generate-cyclonedx | 630 ++++++++++++++++++++++-----------------
 1 file changed, 355 insertions(+), 275 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
