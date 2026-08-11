Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D5DC5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 13:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A314F81096;
	Tue, 11 Aug 2026 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuMmbpKp4veh; Tue, 11 Aug 2026 13:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99BA80DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786455798;
	bh=k4BVPW/FGC4oKCjRr6YbHvuzQP2GUTVhrjM1RaGKb7g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MjlOSJAAgexZe30uqZazH7gWf1PMSpHRcJ4LkU8x24hHFPtIAfx7ihZ6r4/ud2fCK
	 FxfXQOvVeo2L7cjXUoXT0za928Lt3mc6r0veTMz5u66Vxffv3+DZcLAmrg3hjDmDNa
	 6sYMmvaM3VEjRKynnnzTDCGSeUe5ZekMx4EpGCRE4mLsYuDqnOohi0rPQrsJyowERW
	 5XfmL3b/NEAdY2wXp3CI9//SA2AAgdI6og9qd+DnuU84gyFPN7DeZZx6JflNUCFAPh
	 a0xytSbMrLw8ouXM/mGuHp3XdNVDLfckJMhGofeu8kaDuCCLV1aRaIvpM5xHy+Ez/j
	 k3RgcS3dRXEmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99BA80DCC;
	Tue, 11 Aug 2026 13:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A345296
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88239605ED
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86VQiOIrcsbG for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 13:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A767605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A767605AD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A767605AD
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:43:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so6502925e9.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 06:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786455794; x=1787060594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=soeTsopG98H0jo/0WIya+XWq46VF2PHU1/8ok5z/Nfg=;
 b=nJp2d+XACjPLm1Ba/hcrerFU2EO+86O6EKj+OkpG4mnN3y+l8uT/ieoXv2rjUgOxuc
 4fIZtKLjAjRjXuVuSL0kaBsc4ZPRWqpiV7FYvynh0pYOX3Ibv3zM/h8sgGFYdzdoW6hi
 CbQMAwHNHtOeVRyBG8P53UPzuDSL5907BZH9Go7cCiZiVyCo4zIRpK1AJY5id0f2dfan
 IfF7M/vCUoyeDNkOWbmol59G8IIrmk63ERVQLjYBtgofopvK89QSwwbuB/GaNYtxqITF
 86zkbXNGs//EF/BQPfg2WOzePgvwzhH1sAz/EYZbwVyBN5XHlhsspR0kFUZfVIwm6xoq
 1qJw==
X-Gm-Message-State: AOJu0YyEBGRNYKxL0ROk3ZPG0PDNPQAySfn8+kO5wnSJysAdTW1t5tsh
 jmlbpCy+gIIswPUVN463a2O9jymjYbkmsISK0B3KazbbI641GebCMT8snx2E+BYLMQN0PhgOYoS
 FpRAn
X-Gm-Gg: AR+sD13blyxkIEy17DpvukU5daitWYNr7vakM8NyDWRlvd4SlwVAy171uf7ghikYW3s
 v8i9+vz7qIMwvmSCq4wPVm0v+XLRxwy8ifnCnG1d6Ql98E38Hro+u9EHNHJRt0gXnlGBAppfC7/
 hnB15wvc8672iqB+ayCYPFlgqk7LWHCsSHiVL0WW95JvjbS4xAlJDOOwAnTVxGhVnItco5ZcNj2
 DuFjT5a6S8zeQnLLCgVKEUCjgf5DiT66axN5fnM0y+zMxlWmUZXQEPqzcpGGwt4x6vj6ONsE39b
 nJq8pfMjedFz8qf0iZxIzjrOsfDGZqQZGTaJoyffldWR41nFWK7/qLCS6Tsa26ep1x3a7Yq7o8T
 N+Ym8HHn/JfThIggGXqm6dbLYfzIZnR9X+a6+e4giy37z9wVMjqQYdZVODvoytdSRnq8cxiOMXQ
 GNktzoUZtL8eNCOE0GIHXwNCO5HSvpmqZgZ01iBARPD3MJXHM2wMmijA==
X-Received: by 2002:a05:600c:c494:b0:499:51ea:fb59 with SMTP id
 5b1f17b1804b1-4997a6f1dddmr1044895e9.4.1786455794215; 
 Tue, 11 Aug 2026 06:43:14 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49977bab2f5sm31564415e9.0.2026.08.11.06.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 06:43:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Date: Tue, 11 Aug 2026 15:43:12 +0200
Message-ID: <20260811134312.170306-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786455794; x=1787060594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=soeTsopG98H0jo/0WIya+XWq46VF2PHU1/8ok5z/Nfg=;
 b=JEapMsqdk3i446H7lDqkaJEtoElUcg9kjXG8Lx8vxkLmr0cK2Qg9B4yi95E03LYNaF
 cyDutIt8GmZ8X9OFtKFe00/7upiDH1kGfgf1+u3qtAZeOVNYZg6VIU/3KbNfiQbtZRGK
 kT8ZqRUOFbeC+tVl0RVrsl2oJBVgHtmgslNQBbfPGSxIJZ11wxqWLFDKxIAkLNPVlJKE
 pVhApYiddx2+mvpxY+RbRhC63JcInEhXXo4+FLTlQ4m6zTjcTs4XogziIm/K7fsTZw+w
 jyQ4iXYqF/2gUYEbF8w+tKIsQoAfY18BZsDI2T9+tXyy806lkj8d/nHnAHR7dxAdv/YP
 dVrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JEapMsqd
Subject: [Buildroot] [PATCH v3] docs/website: link LTS tooling documentation
 and staging branch
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

Those changes clearly explain the location and convention of the staging
branches and also link to more documentation on how to read the
annotations.

Also update the timing of the different steps to be less specific.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: took into account review from https://lore.kernel.org/r/f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de
v2 -> v3: took into account review from https://lore.kernel.org/r/8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de
---
 docs/website/lts.html | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 3bfd2a4374..8384d3a88b 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -46,7 +46,7 @@
             <p class="br-lts-item-text">
             Tracking of the vulnerabilities affecting Buildroot
             is available at
-            <a href="https://security.buildroot.org/2025.02.x/vulnerability">security.buildroot.org</a>.
+            <a href="https://security.buildroot.org/">security.buildroot.org</a>.
             <br/>
             LTS stewards ensure this data remains up-to-date by actively
             maintaining Buildroot packages metadata.
@@ -166,10 +166,6 @@
     <br/>
     <br/>
 
-    <p>
-    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
-    </p>
-
     <div id="organization" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">How we work</div>
@@ -181,12 +177,28 @@
     analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
     branches.
-    <br><br>
-    On Thursday, the candidates are cherry-picked to a staging branch to be
-    reviewed by the other maintainers. On Thursday evening the branch is
-    synced with upstream and contributors are notified. Feedback from
-    users, sponsors and autobuilders are then collected and vulnerability
-    analyses updated.
+    </p>
+
+    <p>
+    Mid-week, the candidates are cherry-picked to a staging branch hosted on
+    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
+    Every maintained branch has a staging branch, with the <code>.x</code>
+    suffix replaced by <code>.pre</code>. The staging branch allows other
+    maintainers to review the changes before they are pushed upstream.
+    </p>
+
+    <p>
+    By the end of the week, the staging branches are pushed upstream and
+    contributors are notified. Feedback from users, sponsors and
+    <a href="https://autobuild.buildroot.org/">autobuilders</a>
+    are then collected and
+    <a href="https://security.buildroot.org/">vulnerability analyses</a>
+    updated.
+    </p>
+
+    <p>
+    For more information about the development workflow, see the
+    <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
     </p>
     <br/>
 
@@ -222,13 +234,13 @@
         </div>
 
         <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Sync with upstream branch</div>
-            <div class="br-lts-bar br-lts-col-start-9"></div>
+            <div class="br-lts-chart-label">Push to upstream branch</div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-9"></div>
         </div>
 
         <div class="br-lts-chart-row br-lts-chart-row--tall">
             <div class="br-lts-chart-label">Update vulns</div>
-            <div class="br-lts-bar br-lts-col-start-10"></div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-10"></div>
         </div>
     </div>
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
