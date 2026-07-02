Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F4FC43327
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 20:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB4B830E6;
	Thu,  2 Jul 2026 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prki6D6Tl-co; Thu,  2 Jul 2026 20:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F758318C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783024227;
	bh=AVW2k+/2IAsnaGNLKQeiZoJ5qAqAs1348Ee2Z5Yrx/A=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rzXBfYtxzw/cKXkUtWyGUzEcghjc7yAXMJqstqaea2U5gZ+Cl5BZX8NaEaY3190qi
	 lPk4DSZiy+UN/SpMdeAefBKjanHmsRSYNcIyGFwm1+sEYsyPuJZCZnDm48LRbBMk/W
	 3h910qfuPgHIIRtcjmd+3Rc5ywu/vM/2S1DhmnM1O7Bx8CHBF4NtiHdWycCeQTC2s+
	 9qRMDvlTNTJMerV5PfWbbYrZuIyTadyfZIo/Bxrj5PKN+e8dDxASDZLxa0/GnUJK1j
	 HPsT1NY1BUFfQ4GoatfvRo1FL8+Unmy4MoJyQb1PcycmMKAJa1mpXoCSaVZv25yVo1
	 V6rT9zLZ7a9jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F758318C;
	Thu,  2 Jul 2026 20:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8986914F
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8C840CDE
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkXJc5SDAkJE for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 20:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 874F140CCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 874F140CCF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 874F140CCF
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:30:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-493bab44440so6402685e9.0
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783024222; x=1783629022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XzVg9M/kgkV3bzbuhuHRk4tOFZybWolwLoEcMPlJegM=;
 b=VdMiw90PWhnguF7yaoLiviQLVI2opndztBVXOEorPU9cXOVurloV6XXT01elYp16o0
 HWIf2pffh36xGR++NzviQRdwEVxOhJGw3zt7fNSPKnMYUKhoM/z80okPUJEglXnAuvQi
 XbpL+ElZOexeDx3N40BrKKuPq/Gv0/ZgWj33SEKHo/lbqvHFAaBCffAjetdrPlchClNC
 vffokdbhbdMo4w7DT+1qIKfxC3vRtuiC98DGHwL3vhEv6KmU3Ofjo2Unx5X2HkVy0u6J
 oMilqP5YzCzmMPxUB5MgziZKzO09TrObUeUGkmAppFw2LjZrbG6pMcOTL8oRGu4SNPe5
 AmmA==
X-Gm-Message-State: AOJu0YzwNISOdcny+nkctdM3Drw/EdUswNQkh3+kVcll76E3nkn3V1iU
 iVolBajZqAhuyQce6qNk/PtXrbu4J6xvjVItXs3BvZP8ceLqjndPK9fJaR0jGBlbOCDfadH6W6q
 KGUvw
X-Gm-Gg: AfdE7clOKkubXcE/fO7wfJu0hOVhdoM0V2yVDua+cXLiEMHPRrW7X7PHStSuMAoPY87
 9uv904IXN8oF4K8lm9M1qEBphTI42lw6pTZfTRlDEg0tqWfVeS7FMzAnoovdzC+GqpS3Lh7PcB+
 VAjpYiM/4hm6GG/bqc0LG4jD+SAM2L2W7/qVtEOyFUX1UGvA/xJspK882m5ekoyJkLBdhxpz8FW
 tpNtsUT12Xhpvdo0mlkuOAoadtJWhmSfhBGWagNjxfLXVCbDfBm9NjvbENjKvvmotUIiIvO3jX9
 ihdPLPpw9YKoJqY2gKBnmJKdMiScwXPEZdBOSAV/dYlNTBRnLltTgmSSUG3jYl9iQAjwb1QKL0N
 Sy7oyOwkA2zQ/9yCNQIaqt8xco5S9+QsV2zXKeQhFXOa0VMaqkEhp6QFRerdGhj/Z5T3YQB4Pi5
 qUTLqW
X-Received: by 2002:a05:600c:c0d9:b0:493:a63b:1f62 with SMTP id
 5b1f17b1804b1-493c9b78785mr14496735e9.16.1783024221211; 
 Thu, 02 Jul 2026 13:30:21 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19fd3sm12377569f8f.25.2026.07.02.13.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:30:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Date: Thu,  2 Jul 2026 22:30:20 +0200
Message-ID: <20260702203020.322896-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783024222; x=1783629022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XzVg9M/kgkV3bzbuhuHRk4tOFZybWolwLoEcMPlJegM=;
 b=gI6lj+RMVedcNoCGhYJyor1NTJWy0II3PjAj5tGRfV5a2m7yudTI/PhZmnWCAxV+gi
 m8E/8lVREpNaC6UpixM1aOi1aZe2a/dLLGX3SGDV/3EIvR9OkEK2E/DPyxWrYbia0HfU
 IeMp5ukAt0sk2AL26W+E9NNjKUH9p73zxvWNbV5m9zTU3QXhaw/F/vSBnP9q2gBX3oLb
 UwBFqU6djQKlVTCJOESDcmoMkuWVKlI17XOuFQKWgotonJXGK+VgMFJDEmumOSaY95EY
 6LiPT0tO+A/zk0wIq4SV006p/rlPBbj36Kv8x76h16v/cxFnYueycimEes1YqDJSXggp
 HkxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gI6lj+RM
Subject: [Buildroot] [PATCH 1/1] docs/website: link LTS tooling
 documentation and staging branch
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

Users asked where the notes are available and if the information are
publicly available.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/lts.html | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 3bfd2a4374..9252127a50 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -180,13 +180,17 @@
     Each week, the LTS stewards define the set of commits to
     analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
-    branches.
-    <br><br>
-    On Thursday, the candidates are cherry-picked to a staging branch to be
-    reviewed by the other maintainers. On Thursday evening the branch is
-    synced with upstream and contributors are notified. Feedback from
-    users, sponsors and autobuilders are then collected and vulnerability
-    analyses updated.
+    branches.<br>
+    For more information about the development workflow, see the
+    <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
+    </p>
+    <p>
+    On Thursday, the candidates are cherry-picked to a
+    <a href="https://gitlab.com/essensium-mind/buildroot/-/commits/2025.02.pre">staging branch</a>
+    to be reviewed by the other maintainers. On Thursday evening, the branch is
+    synced with upstream and contributors are notified. Feedbacks from users,
+    sponsors and autobuilders are then collected and vulnerability analyses
+    updated.
     </p>
     <br/>
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
