Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50272109023C
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF018420C;
	Thu, 19 Mar 2026 15:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqYe6X-H5evQ; Thu, 19 Mar 2026 15:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44CDB84212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932582;
	bh=cdTCcHH/bTP9mnkXdR7+0uWlPhGHx+038q/HwDG4ANE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=T1UmfBr71OFzf4lmGqHV70dmvteHWGVbvXAz6ct6JV+bSkoIlSpTJzCDgT84330nw
	 8ooPk3Xa0m7hJknVd6SnmYQtOCBAzp83/3JdhcQP3zZUx+LKFKPNj2cKPiuRJtR33M
	 LduV5Ccj/zmxiKey4aXplivtfn+tm6Oj1AiC3zkxwjXCzqd1QaIU5BKJqI9ZFC+Icf
	 WuPVhIwPQJcmYMq/Feid8ucLVNSJIFrqECfr3+iLlmCPupYsp6pGvfkCRIZ3epkqE+
	 LWAQZLLxDyQRIeZBvFaSKyIimlXejAT09mcvFBPVy3gQmJkZjSFtnDr1oUiOyrUofM
	 IE4wxydjUKXNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44CDB84212;
	Thu, 19 Mar 2026 15:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9E381AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C72578417B
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d87m-7Pu_MNO for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9445F8410B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9445F8410B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9445F8410B
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso7754755e9.2
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932574; x=1774537374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IjJQiBYt2HDl8dmNIiXXNWHXPWtdUBkrMsZhraKgCdQ=;
 b=WKQ+QV7sHvRjRLFt47Pcc0C/SnI0CnKa2dFRISAD1fa9ww1AWv91CTq2U7hYuswIH5
 NoJVhNp1GYsgpiKuJ8yRxWoaxVv/Wsdm/5mALfX/uzKHUSLSagjjYiNrCvkFJ2As2cCb
 qgBmBGZhsnb+Nv33/6j6CEg0aiRJU+HfaggicnGfYCfddW7vWOclcbKDy4S86zcLSeU1
 aUjdqHpzL5mlL8KOaNcps+r+pQXd+GLN8BkntlFUFR1MtA6G2H9IuFwAc54VpitXDagz
 4zaxTEUWj3FXPQV8Toyt6ZtbMnp6HNeGxAGnXxQG42A7q5RMqUaidBJazp30jZhOex/Q
 ZPjQ==
X-Gm-Message-State: AOJu0YyFe5/jo9RjSeNJ7BHCaceZMw+lMvkGHeqagedKjsEAn6fQUEls
 +oHErXjJtmvMuCQSPUR9mWnMZTw5/iop+h5vhw0yjal79wMdGJTugMMPaoSYpuZxEPOqnL5Cspa
 kKNWfeL4=
X-Gm-Gg: ATEYQzzPkDAXwFc93DiwqYYR8ygG93hQtkLrW413nYgkdIkjVXLM/lJgQOlBtcWt/RZ
 FJNrHIy7v0Mk3JVwPAIRne0xqhY3g2tueP0OsgYKbqwARBmGxJZ8XAdQl0EoQy4E8VwOwqiX5BN
 MxDuEImf8DOGEyZ+QCEDzCtWgDMOyDfVNlFbgFi6OxqzFXteLJFmdk0O1AdlRS0+mgMTtPVJMr6
 HF/WsnELgyGBUQVvftIjpAZOspMFJ2xWgrdpWy1VjgTTr+xzhDi+Zg0SdsuWfAn1aMOpmvL1lk5
 zpjfOxc7FmyVyezXhR9m4G7RAJO8Wugr19ne2hSGALrH2YkFGYBEpEkmXiI9p8zxKWtRJLRohGj
 +miNaUj1g438YvsIzW4en2GKIY5QestkiZwprt68TwX3EFDDd+V7VFIFBCp4m3FhtNaUDWtR+2J
 Fbt7r17mqYneyE21eHrbQ=
X-Received: by 2002:a05:600d:b:b0:486:fcc7:d6a with SMTP id
 5b1f17b1804b1-486fcc70e4bmr24733445e9.13.1773932574027; 
 Thu, 19 Mar 2026 08:02:54 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:46 +0100
Message-ID: <20260319150246.10937-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932574; x=1774537374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IjJQiBYt2HDl8dmNIiXXNWHXPWtdUBkrMsZhraKgCdQ=;
 b=EdzNFchWad0OI6URdOvuPFW+es4svk1VQlSHxMAL9aPxSmqlsLgFV0S7jY+G/Ro7zz
 H3bKLknE0KIyNdVJZF1dFsdFqObJmXG+BYE95BWsCfOYmwK6ciDJtE5WuVRTVvghAWqd
 biUX0YKMT6Zk9r9s1vC4/eOc0DIBAXxVgbm/FYGBYvb7SzVHjm9jBOXFiAVw4nY/PP5C
 7n9ODk4H2Gq18EkuSF0wBn7j2Ffhn/JDHNZMVPaV/32KKNDgasdKqzQ9nPWB0txgPAI8
 BB67PxFU/jxQbs6TyQ0ZhE0p0TGBNp1mccfL56C/NWOWG9jZgZAztEkor/hhZk2TJAlH
 TV5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EdzNFchW
Subject: [Buildroot] [PATCH 6/6] website/lts: fix typos
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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/lts.html | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index fd684ab3a9..3bfd2a4374 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -29,7 +29,7 @@
                 3-year LTS support
             </h2>
             <p class="br-lts-item-text">
-            Starting with version <code>2025.02</code> the LTS support has been extended to
+            Starting with version <code>2025.02</code>, the LTS support has been extended to
             <strong>3 years</strong>, replacing the previous 1-year cycle.
             </p>
         </div>
@@ -65,7 +65,7 @@
             <p class="br-lts-item-text">
             To ensure a consistent release cadence and maintenance
             workflow, paid LTS stewards are assigned to the weekly LTS
-            maintainance tasks.
+            maintenance tasks.
             </p>
         </div>
     </div>
@@ -96,7 +96,7 @@
     The Buildroot LTS sponsorship initiative has evolved from a more
     comprehensive understanding of the needs of our user base.
     <br/>
-    To address these requirements the release model evolves into the following.
+    To address these requirements, the release model evolves into the following.
     <br/>
     The LTS releases are now extended for a 3-year period. An LTS release
     is started every 2 years.
@@ -177,12 +177,12 @@
     </div>
 
     <p>
-    Each week the LTS stewards defines the set of commits to
-    analyze based on the previous week commits to the master branch. The
+    Each week, the LTS stewards define the set of commits to
+    analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
     branches.
     <br><br>
-    On Thursday the candidates are cherry-picked to a staging branch to be
+    On Thursday, the candidates are cherry-picked to a staging branch to be
     reviewed by the other maintainers. On Thursday evening the branch is
     synced with upstream and contributors are notified. Feedback from
     users, sponsors and autobuilders are then collected and vulnerability
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
