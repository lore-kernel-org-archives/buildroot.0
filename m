Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB11090237
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3804190A;
	Thu, 19 Mar 2026 15:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxtGPu2ZAWRc; Thu, 19 Mar 2026 15:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C983418C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932579;
	bh=MBNYCKWZzshs7be5cPYAm0pM0YtdRR97p/ySoVXZ89Y=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rS8sKqsBQ9katZvpLNBhDXfdR2iOySu1aOD012D84uEZFBmLrehix2U/pqhxFSTcb
	 LvFlbEJNlHUKd6dhW1QIZA4fnLgHqiNMkUo4YM11r5dExUy2JMokkhwu3QfKxCHMam
	 6cjfdYcjMYooZsYmoTx2pQe0je7YDgFIM6Jm1S6tpWg3mDVfTlGyiRpD+leftIn1wx
	 pmGiqpFZPlaVoYlkDm97Ygo0JaUctWLdso1Xb5cTIflc9fWlh26G4tWh+yJofueQtz
	 j+vzEVQBLz5DwuIP0l9ioAJ3dBgjOeZOptm0USq6v7hr0IPE0lt2pf0Uu1O/zJZA15
	 iuMhBOXekJzIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C983418C6;
	Thu, 19 Mar 2026 15:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C424A1BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A825160B02
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kjr3Wawy06e7 for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A916560B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A916560B6E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A916560B6E
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-485392de558so6458045e9.1
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932571; x=1774537371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eUZFfq4GmLQa7zh2aqK9BULnqevDCO1SKuLNl0LR6Pc=;
 b=Artcc7qUTDOhJF7FhosqyFdtNLzYf6BvjcyDnwe5y8D+oJZUAtx7xBzppm+QDFF1tY
 FhZJS6YGxL1qK7Fvnzsm2q5ucePiwRgPWQRy82hvLFMUXs2QKrSZTZ/GPkENrp04GkoP
 zNZ4TvqPIjZ3PUdmZ3uSaNR+DI4VrQQMsQnSJrCDmKeVRrtL7yAXaodrjUJ9VUrLwmXx
 oByvmip/qpy5U6EMG70OAhIVvTv2qyt9HjLbYlLK892eXk4HUCE/p7f2Sj8QP60g9fjW
 105W8G0GsQjcmgHk+67KLHl8H2cMlMLnqewLlzK27beNZmz6pS6U/tCUPhtJK0cQN6Mo
 yAqQ==
X-Gm-Message-State: AOJu0YxSmMGNwO+px27uNbveQbu3pd75R1M7I3L+tciDMZS4Z5CMu1A8
 hBqI5W3sgGCBO9WfLYw2o81mCEEtd0ppa/J1kmCSHNc9ReVSVbrNvU811/m3gJ7mYeMhDC/KRfe
 hpI0/DiQ=
X-Gm-Gg: ATEYQzwJVNunYsbLPbsJ5ESUlzGn+N0pyqcBN9msdXOB1EBSNWlDCX1NrCIpODYFdfv
 LIGqT30JOfthQHPLtN7YYFwYdAUFI4GXDp27UJNJkfNEegdwrZhLJHnf9XvzZ7aJApXDgx5aY5P
 C17Tbx0LBcAyBhWHPAEKbeUrd0fKvUIhImOqZAPlEhxOChkLspxqLDoBRetLH4X4YCzqPGHYivR
 OMLivIJ3d0jLOxzEXARyznZrNtg6uAeQ1wJbk7I5GtiXWnoTcrthAoTKUF8bxvPBviX96ZwN6oD
 VwM5FCSBUN4Cgh2ziBVuAa+ntxH7835NhEcH+y0vWVg976y/PwojF9OK5pYcI+kP0nV+btEKLci
 +5C+hr3Gv/fW+ZbGe2Liv2ydp2P+T9erItK9gNaehLMXs/ORDNDs8MXjwXftDIePWfuCirpXQXP
 EMJj+RRgOAc3e/C8D2cO4=
X-Received: by 2002:a05:600c:4689:b0:486:fbc8:8dee with SMTP id
 5b1f17b1804b1-486fbc8928fmr35196875e9.33.1773932570452; 
 Thu, 19 Mar 2026 08:02:50 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:43 +0100
Message-ID: <20260319150246.10937-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932571; x=1774537371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUZFfq4GmLQa7zh2aqK9BULnqevDCO1SKuLNl0LR6Pc=;
 b=P3LHgBdHnXe2cI2SvPhB3ijDlICtwMTjMws5nInb6Pi1ha1/mYUo/WL/LXiIm3DFyV
 GJOOz4ELueWu6ZqluLx6ZVhIcMa3mPyHCp1ToboqAkTz+2pOiMr1T3ef/LnnxHrsKcRZ
 uK8J+ovK9NokoU/o15QMcfqo/3QqrNXdgSq3rJ/gPX7n1quJmdHchIxy4dNoO7sYWiXh
 gQR+9bP6bK6F/PttANZrTjkmkywVmQwT0m9LIFTT8Ew0cJpFDUbAVBlVn46uDuWGJ1Wy
 ccVQ4DwRCRCLT3biakU7c4+hZxWDajS7Qzid/80vllR0d3Y9xbM1bvMtoMXAKS1ZfQXV
 4QgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P3LHgBdH
Subject: [Buildroot] [PATCH 3/6] website/lts: remove the href on section
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

We have received report from people about the section pointer that makes
them want to click on the "Sponsor Now !" section.

The original idea was to be able to link sub-section but let's make this
section is not clickable instead.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/css/lts.css |  1 -
 docs/website/lts.html    | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index 76411413ce..5f05288188 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -142,7 +142,6 @@
     border: 2px solid var(--br-grid);
 
     text-decoration: none;
-    cursor: pointer;
     scroll-margin-top: 20px; /* Offset for jump to anchor */
 }
 
diff --git a/docs/website/lts.html b/docs/website/lts.html
index 7538fa72de..988415482c 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -16,11 +16,11 @@
 </header>
 
 <main class="br-lts-main">
-    <a href="#objectives" id="objectives" class="br-lts-section-header">
+    <div id="objectives" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">LTS Objectives</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
@@ -86,11 +86,11 @@
     </div>
 
 
-    <a href="#releases" id="releases" class="br-lts-section-header">
+    <div id="releases" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Releases</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <p>
     The Buildroot LTS sponsorship initiative has evolved from a more
@@ -170,11 +170,11 @@
     More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
     </p>
 
-    <a href="#organization" id="organization" class="br-lts-section-header">
+    <div id="organization" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">How we work</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <p>
     Each week the LTS stewards defines the set of commits to
@@ -232,11 +232,11 @@
         </div>
     </div>
 
-    <a href="#benefits" id="benefits" class="br-lts-section-header">
+    <div id="benefits" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsorship benefits</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
@@ -338,11 +338,11 @@
         </div>
     </div>
 
-    <a href="#sponsor" id="sponsor" class="br-lts-section-header">
+    <div id="sponsor" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsor now !</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
     <p>
     Interested ? Contact us at
     <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
