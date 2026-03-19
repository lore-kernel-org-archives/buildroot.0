Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9389109023A
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722B784210;
	Thu, 19 Mar 2026 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFIDGpcnqbAy; Thu, 19 Mar 2026 15:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C97E8417B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932578;
	bh=SN8Kp5Pli+1YeW+z9srT8TlxSBFOBd8TLC4qR0Q/rLA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rWHj+BTJ6roPhaVixhgpENHzHi229Plajug4J4VR5mOmF/Ye4uAiWM0ZHEAwt5ULW
	 qLGxkwEgH3vm5YUXgUr1m6rl3vFGxM1MZ5jztVOTLmOQKH2kZDLABD99iZSuTlNTMj
	 KVCOtWy3lPfFs9hiCQYtNDBrAtXnX6hLCF/axxoucgl2r44bKJkCrGr9v3kGWcj+2D
	 ocgqK11LoT8jPJYbWE3f8SjT4/cLwgyUR8HeEx3hY3DpfkNMhOKNlComVZoYDvtg5K
	 oUl29moFdEc0QBOLLcbVWWw4sZ2Vqtc0bYuilcY/hYOGBkQxo/NH/MDOtoieP1fWei
	 xHsYXMt93da0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C97E8417B;
	Thu, 19 Mar 2026 15:02:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42FB61AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3426B41546
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlYjFL8LGa6g for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F4D94101C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4D94101C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F4D94101C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso8712615e9.1
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932572; x=1774537372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hgPSZH/G1UaRmxqGQZ+arbw4CC9lT5uVjRxZl7c9N10=;
 b=leJvyysZLGaOSdnPG3akhZRm+5WP27M++FeZFfHSiW0cHgFsWGiq7t6Gs3PeSg+0dm
 Wida4Tz3yBTlPH9DxfogjoW3Zcx8zEJmkwCv2c8x1yEttA4axpIAq9DNYpLYaWC5Wjwi
 g6ACGBtvootEzq7HW3lZi25yuH8abymN9JrgosvSF3UrCBePyZW6at7/vZEULvvW/5U+
 63G6vQMtTi743p9mI9FfVlUOtb9BZzfVbWLY1ptUokzqimoORmq919BehUQQD1uCJraZ
 zd8LQyJxqcIDO9fyDJI4R1SbzKSOq+a7OE4E/E0oAXWHWxVLUKiFOW750UpKfIm/dZw9
 fEfg==
X-Gm-Message-State: AOJu0YyqUcUuhbyU0b4M3E7Ok4jnF0kfqxOD4KRP6A+HkBKzHncmn+uY
 HyVR8BvsVR4Y2zStgmzg6UWv3ywE3wgAvOARIo/y6QU9AlDt+wtexJr4dKsRwcJlN+GCf7q1fK6
 wHsUYAKY=
X-Gm-Gg: ATEYQzw5KUPw1spCzhSHjJJy8V+1FIT/HgPHPUJywgX6NADlErvv3RS5gMPoD+6RQMM
 d6WIq3txlJxxNDDPP2c/09lph4ZFAS6e1SI3t9yEw8OEVoXEBXVEmcq4KwgodRF14luIhAe0fVz
 ndniPEd761ji+yPGqo4P8Qw4QdpG8Ycdr9IKlHq211+6ANK478s0ppJ2A/ThPC1509G7Mwdip52
 6UUUtllosi2NemaF262UFtJEIyzuGd0D51Q1dh0qyl6FrwfyCej+1aGjF3xr69pO+RwYWcjX4uH
 TvF43mSQvVzsZdHhA+Yh9MLl3/OBIYBXr4DkwwybTn3PZ0ngLWC7B0X2jXhA/i9tTTLtHoC+xZM
 gkckS43OBhlqjSX7Oe/J/9AqQsKKeL2twjVrKos/tlimXdWz0mvALUsFlthcQAfjjfO73TDYixZ
 HKBpJtTCWW+V1C+4ijyn4=
X-Received: by 2002:a05:600c:6749:b0:47e:e076:c7a5 with SMTP id
 5b1f17b1804b1-486f44511cbmr114129455e9.11.1773932571648; 
 Thu, 19 Mar 2026 08:02:51 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:44 +0100
Message-ID: <20260319150246.10937-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932572; x=1774537372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgPSZH/G1UaRmxqGQZ+arbw4CC9lT5uVjRxZl7c9N10=;
 b=YPNrxS/fLQRdgU+QgEHZv9d6Ban4qZbDCRmkRzWQC5mR353DmfgxD6PoXMZqdPjK4W
 QZJlroVvlw7yjrNdiCM0Hu1LRsTZ36AFbNJN+FaNJUPxpkyHiUXPEgVwRiKw+p+UV7AE
 8ArdTzfLHiLPqkXUXOo8jzyyX3PfUTJPRk36MHIPOfKCvVAeclWd6tW7qBsXffrSTEk8
 DqIro0YI95Mbd+BP/rgX02fLyoGOxNRYiruT4GjeCYX5HWOpOVADPb4FlWRqh8wWQ1ya
 0UcwEkozJPXt5ydxnee5Q1cejazlUyQ3HbNa8z/Kwy2C3PWGvvsIpfgdTY45rRZPWJEb
 jauQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YPNrxS/f
Subject: [Buildroot] [PATCH 4/6] website/lts: fix section on small screens
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

Make the section header take the whole screen size for device with a
small screen (mobile phones).

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/css/lts.css | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index 5f05288188..c1e9b198a8 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -145,6 +145,12 @@
     scroll-margin-top: 20px; /* Offset for jump to anchor */
 }
 
+@media screen and (max-width: 768px) {
+  .br-lts-section-header {
+    width: 100%;
+  }
+}
+
 .br-lts-section-header:hover {
     border: 2px solid var(--br-blue);
     box-shadow: 6px 6px 0 var(--br-blue);
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
