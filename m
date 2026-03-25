Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3239EFEA824
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 10:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38CB410B9;
	Wed, 25 Mar 2026 10:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ymWvaBB3l4b; Wed, 25 Mar 2026 10:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7AA4109F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774433729;
	bh=vWRBj8jqbVsLYWFFBPhc4MzWr0b9nAYq8/89QEj2hv8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=R3R0agC37vuCM0Q05anHO4i42MGVWnOwVRrM+JDRHwpxCrRIgOOqp5hzS4H0Q9zjh
	 UsqDtRPONhDQZ/3xb/2M276x3ih4+okFFhh2nXaIZssZ3iJ7f9RRzXklgavJVodjhX
	 a6I8Z2Ga4/sf3XLTXI2FH5Msj7fjv8Vp+LXXUfBSf2CJ9n2q5ZUHf4s/Qlc5yvMgHR
	 3EheX4AyjBbFIb9jUyLeL9R6mxHV1s6P0W+WGb0QdSeCpkOomMQkzIsAMBVVSqvapt
	 jVQ7neTMCIqICxeVBRntCafW0hWQYpT4FYFa03dJj5Kg7x8W0rdVmDNHhgGhc7M6LM
	 pa9NHwHGe7uFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E7AA4109F;
	Wed, 25 Mar 2026 10:15:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 683111D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E103610AA
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdcWZd9GrIeB for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 10:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6730E61037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6730E61037
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6730E61037
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so7452395e9.1
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 03:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774433722; x=1775038522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xiM8+/CJPckq8g+6zHfbb7UwNm8iZspHctTHiwxSuB4=;
 b=nM9Kf7JBCZdm+4Qo74q9BVT9kZkYvUsnHZkCkZTKb6fQeYK58gvVjT1QxktQWcdei9
 up4m/DHdUPwuTLNSSAWEB3N2+DpMGc7jchSx3O9N2ovumkhHfB06SV28EgHyzpsUrD7D
 vHiSEMSa/WcwclI4huzeNpbHIT0JAGFhSgXE8wnm/wuK0GhKGxu9sUCOA/Szxo2gav5Z
 T/nKM9DMZqUeuKFGI+/AH5TRVLqgjRNUD2YjpUTsixXv807a8YG0phSXQbi+QAXxCU/Y
 lfgPGp5Zbjt4nr0oKKhlgOGBxSxJe/d+M9cdsrykexCah7XRamLRix7PyCJ8xrU/2M7Z
 yiiA==
X-Gm-Message-State: AOJu0YzjREqISLvrfKUErmPLJoe3QE1b9JnKl9kpcY4H2Q2WkpC8uIZm
 x0esFWhoDesdxN5OpgLUMhCKKHWQzGstvUpS5C4GwZLJuyIpuBKFslv3MD61neciwFhHrZuxu0F
 hYcfZKSA=
X-Gm-Gg: ATEYQzwQk0lzGzEMgTyzwjXesiq8HSblqnGq+EGNDF57RkgR5ObfIvg6v6ru/HO6Uhe
 qKU8Q5EbvH6s0kqcWhXKmhf4BQuAuaO5wcbohurz2V2/A6IJAhQPv7V1/GaEbw+V3rrbDODPW5b
 +sSuTkeTXfIKgVldJP2QcWryLfAYqFoUyc5DuNX8pOJWKJsKdKwlprg/rG0vgx52u5wiFs6BrRT
 7bEdg1Jelq3T+9csQvw+O0jQF7FQ8ugajZZBSyXwi2hxLljM/LnIfbbBS/BUueI4nzavlHkanhy
 24ZssEcGIHuhgS1e37v2c3doX4QdKGwAyEeq+Vl1FEtKhyUqsxUMLw92jiaTrjmg5bGbzQtWbFO
 Ttt8EJ0o0H7qTP4WqzZyqxiE1BMjMrfAuoJwUXVA3CtC9LnSrL+OvcqjLhv+34LkNAXl78MF9Pn
 /jA3TGPgDgKIxxpsvu
X-Received: by 2002:a05:600c:6814:b0:485:3c11:de84 with SMTP id
 5b1f17b1804b1-487160a2589mr38499245e9.14.1774433721492; 
 Wed, 25 Mar 2026 03:15:21 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48716641406sm18326895e9.11.2026.03.25.03.15.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:15:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 11:15:17 +0100
Message-ID: <20260325101519.77626-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325101519.77626-1-thomas.perale@mind.be>
References: <20260325101519.77626-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774433722; x=1775038522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xiM8+/CJPckq8g+6zHfbb7UwNm8iZspHctTHiwxSuB4=;
 b=RgOt2TrhLvDvQ6wMMYAZMA5KMv9nvJsxEluCxbg/0nqQ8Yc5hPpB5YLFkEF/Y3ZHus
 lmszICUXx88TW2Qw881cue7dAdQSY3jPJNboDscPMPx8ZKfDP2nSp7ZjuHcQVdNSxc1W
 BiF/Y8aXhb7qUoPGtX30dLbBxjaCt90n5aB4WTGUUc85Hxupo/bTSv+SUNVGILm+uNOD
 /0DlPDm/QZe6f0hmy+qDuQUOZUL1rlrQLxZrctFNSIi55kNGtKHRN7PLBhnDYOh2Swbo
 pAswmXjAV+Ub5xnzIM8XLSL6L0KNXoulUtoE4Ww04WafiPNkobft0LqeJrI0G9bn5t9V
 M0ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RgOt2Trh
Subject: [Buildroot] [PATCH 2/4] website/sponsors.html: move sense to past
 sponsor
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

Sense is no longer sponsoring LTS for the year 2026.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/sponsors.html | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index c15802257e..f7ccbbedd5 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -43,30 +43,11 @@
 	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a>
-	    </div>
-	  </div>
-	</div>
-    </div>
-
-    </div>
-    <div class="panel-body">
-      <h3>Bronze Sponsors</h3>
-      <div class="sponsors-container">
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.sense.com">
-		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
-		</a>
-	      </div>
-	      <div class="sponsor-body">
-		<a href="https://www.sense.com">Sense Labs</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-      </div>
+
     </div>
     </div>
 
@@ -140,6 +121,23 @@
 	various companies, that we would like to thank below.</p>
 
       <div class="sponsors-container">
+
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="sponsor-title">
+		<a href="https://www.sense.com">
+		  <img class="img-responsive" src="images/sense-logo.png"/>
+		</a>
+	      </div>
+	      <div class="sponsor-body">
+		<a href="https://www.sense.com">Sense Labs</a> sponsored the
+		LTS maintenance in 2025.
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
 	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
