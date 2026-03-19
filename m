Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4373F109023B
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F05D141926;
	Thu, 19 Mar 2026 15:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gprnm6uvgvhq; Thu, 19 Mar 2026 15:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFEA1418DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932581;
	bh=XVNP+1XkO1Da905vGpx9qVVK48LnFMPG6OJDHxecRbQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=J5JiC8axGFxAmEN9hDtf+nA1nJnmRdm3ynJzcWCePH4nE1Sn7+PmX2yFWtvCdmDTj
	 4uU573ljv7XNtpxfOOZYRzuco9IqHnwkHoVdrx3SI0MgL4G3EU54sVIhjX43G74kcI
	 KOqIkboj5TGML09B+/Mb4p9rcSSU/HTNwwFADTL/ucQN+e4NX98k6B1ZU7vLrYSQzk
	 A4dZeOKoJ9nHP2+Es3KF6g2aDSEuq139mpgUxtdqaulmi5GHT5frQe9QOINYofPP2T
	 ZVenJrHjGNtzEehoRJGRUnAarOjTXnAjyMGEPZjmdX5QSUgtC7B5pkY+rEIsphKMaH
	 FLYKNwUUpl1hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEA1418DA;
	Thu, 19 Mar 2026 15:03:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2D081BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC48401D7
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXJ2e55vtocw for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4D04400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D04400F9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4D04400F9
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48374014a77so8129835e9.3
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932573; x=1774537373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qQ0phK7XHUwnVFsFddbeEC0N2YIqL0K69k9lWQLHuKs=;
 b=P689iolqR58SizmIUvrlOrPwZ300X85r36o8N2BR92DPsSIQ465RUOJznrKdj81doW
 P3HKhxMs2X2yEU+NdtKLIxaXfj0bTnYtIC8uaM3FIvVYMlt5QzpkKadr26We1iRB5U3H
 6Qn5t+gm1yQdIEAwneTlzN1GQsatyCAMyJ/JlyKG1OQ1Tp19BKjNeKZVY+QPD5O9UmRk
 jWc4r4O6Z93BaARtMDTBSlzQvDT6G6jeMy7SmYD0MlHgD3bmXEgcMx2saIC8YFbT64sS
 7uk8MFJ2LKXjrRb18wsfpLV/0vPdnlK6zkzary4hOxvKpgSNEGJLGmnCJePKlH7O4O3r
 arVw==
X-Gm-Message-State: AOJu0YzXAvwzg5qtPyHF6R61yS9lBrqv8rh71s4bsb56V2+o0mgzQ71j
 4YulX3oJJ3aCmhBO0VuuJonPF3lF3yEIv9fif8ZRz/q8AsjdSeW5q38U6y8Gex6KdKA/6W+ufgM
 PUMDHcgM=
X-Gm-Gg: ATEYQzzyhXyo8aUQ1PCjSEK46rjDazu2JD/XeXU9VZOy1yDOmZxqk0jOIeFVlkqiu6N
 57ZLP7xpOgIeOo/YOKuG1dPwvVI+NMS5P8X0HHZm+9OEb3f0rHzEaO8STfMkKNtrLCSCOfDHXZt
 PZ0K3dOXvZV4XBcUk7ViolSCkk0khyXf34LWqfldoaceT9cj+OxtkOCUJzgv+7lFVLdrJFmLNwW
 a1y49GDUMfxRAMrjKLoTDHDFb05/ygMgk4FmpFULjxidXv3HnXdzeTZASKJfgyEV3gKKn4d55S1
 xBlKQUqFa6hupeKR3xP2X6uRiMexTBp3XmR73jt1nURF5lgPJvJ1n5N/VauOIjB9GLPx35Q8evL
 dtA5FfjscqO1R0TtokZ9sT8x1Oljo6IEwEh/Xg0IJyzyJcj4iyLzgoeZYC+IUkQc417p4WlSKtO
 FfZte/1ibBnrQakyBI/dw=
X-Received: by 2002:a05:600c:3551:b0:485:40c6:f528 with SMTP id
 5b1f17b1804b1-486f447a463mr124236195e9.30.1773932573236; 
 Thu, 19 Mar 2026 08:02:53 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:45 +0100
Message-ID: <20260319150246.10937-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932573; x=1774537373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQ0phK7XHUwnVFsFddbeEC0N2YIqL0K69k9lWQLHuKs=;
 b=XbzYKiJVNAMojHFJh6l3kwlybpK/wQhpK8kCkjOK7IGIsCJiSsZAWXVSWh0dg2gbVm
 XsP756joIkBqIPXMqcBlq/wjfxOPFa5Bt0HDKuxUb2o2JqFJvyvlwIw295StQC4FwdxG
 rvF2xjblBmhMg7N/GumOeO6SFuJwEua7DSRuzSXIhrcCJxjcjO+/O0zDQEcGa/QBGtco
 I7nVGEX0ThGX24xZpfVnYgWYC5r7URvJhSNdQ5qkuO6+YRTMkpCXniTtAeEDYdInFn3W
 uMoAe4y/eTdeA8/Waz8WBMsQ5pYWZvzLZlYjLiOUfPNvJGE0OP5OaqNYapoGSg7ACWLT
 4ENQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XbzYKiJV
Subject: [Buildroot] [PATCH 5/6] website/lts: add pre-filled content to
 mailto
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

Clicking on the mailto tag will prefill the email with the following
content:

> Thanks for showing interest in the Buildroot LTS Sponsorship. We would
> appreciate if you could introduce yourself and your company by
> answering the following questions: in which products do you use
> Buildroot ? How are you using Buildroot ? How many different
> configurations do you have ? How long do you support your products ?

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/lts.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 988415482c..fd684ab3a9 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -338,14 +338,14 @@
         </div>
     </div>
 
-    <div id="sponsor" class="br-lts-section-header">
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?" id="sponsor" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsor now !</div>
         <div class="br-lts-decoration-dot"></div>
-    </div>
+    </a>
     <p>
     Interested ? Contact us at
-    <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
