Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08946C3600C
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8599340897;
	Mon, 24 Mar 2025 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9zuwk99ciyb; Mon, 24 Mar 2025 09:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FED40799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FED40799;
	Mon, 24 Mar 2025 09:17:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 128825E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC32981FA1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmciQTOeDhO1 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A4DF81F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4DF81F16
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A4DF81F16
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:16:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394a823036so41592875e9.0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742807816; x=1743412616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAR2neUkj80DTadlwlv3A7RjUjrnEQaWi8Mqfqo8S2g=;
 b=tSDhdB68r71y5m+kOZWoEYTiyl1KlL7Zm76SMj7TVM7+flj3mzwpWuC2wHR0KSr+48
 Q/cWqWTNliyWYjubgya4hDZn9RYXBnHyzNw+4azYWQdIp6IkdYacX61yxH1XYCm+/kCD
 GdRZshhnmzvgdudtw9IbhqIe2aDULBoGHOLvD8FjPUO9XPBVpd6h73tTDTQ3u3aqSO9u
 PV8gAAndSkJcSzz9GMf9GvMW2heM1NorgFWA+TGwMTPabUBaY3AM46BTRwgGzVHu29wJ
 cq/Em9nLN6PEl+FAC5qa3bHBKk/5RLjGsxcCofSQrH2phhwUe4//dKf/B/D3aTEc72lC
 KNVA==
X-Gm-Message-State: AOJu0YyNC9AMEfGB0HWm3UTu2cozGRGBJgNgjocESHFYqcbQhn+OS4zH
 1nScqREA/mGp3gUKaDpofFR1Ru9+D5l1bnAXhm5APVDi+9D9cDY6Xd5TxJQ0ZxzciesTpECdANL
 x
X-Gm-Gg: ASbGncu+FLgpDwQor6NwkSCZyMGkPprer5/KSFP6KiD3QBT7qvvsqcQDLQKEQtZE5Ca
 WcGWYs6Q0IBpNtUHjPofGlfmab5GRadPwtIj+zWbC5Z1RbnIFPIjBZ4rtB9F18qh2/Yib2uLqi7
 KDpbnjTcPUBkQ4VZmAa9L593uMlWHVEvdQ/5YeqNFt6rZxXXfFwZTKP7S3yS5n8SumKab9TY7+4
 Lu2gmjokw6/PvOKEooAakZQCtZaxnTNtM56KWnJDIGwhzzwt/rpbQ82OTwgGqkc+bfCJ6IB6Mmj
 npLy4xrKLivmZeqtmz61h0MTwzPeK0LGW54tYR/QbAGwT0d0DgGpMDYspgIhIF06iK5B/J7Y8CV
 94hk63sJW+QddsnGGEJxPGYyJ
X-Google-Smtp-Source: AGHT+IExzwoH47LhE0O3S2QNYN+cr4w/eIcKtjID7tlWkhUYADLtI7SBDjV682nBLUEqLQ/hT7Q6KQ==
X-Received: by 2002:a05:600c:b8d:b0:43b:ce08:c382 with SMTP id
 5b1f17b1804b1-43d509f6797mr117129015e9.16.1742807816124; 
 Mon, 24 Mar 2025 02:16:56 -0700 (PDT)
Received: from arnoutx1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43d7c6a5sm166356805e9.0.2025.03.24.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:16:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 10:16:52 +0100
Message-ID: <20250324091653.234226-2-arnout@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324091653.234226-1-arnout@mind.be>
References: <20250324091653.234226-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742807816; x=1743412616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAR2neUkj80DTadlwlv3A7RjUjrnEQaWi8Mqfqo8S2g=;
 b=SPN5AL1BT7i/84R16aJEj9DH/7xqdiqXLpdsJCY9BZYS48hYO7w/ZC8TsUQgdOtGj7
 vmG0KImRfniAWRn08QWIAMidRhZfVh1uu9pcQdyrPTM5L5ZY/6DHb9fkJUrOIi2zul1L
 QKymz2JOjqPrusTfG3cbxJYZq8gxwapnOV+n6t+hJO5COXTWQ3+zYOg5IXMdVQ/qbvb/
 gvlZ8sEhYzTXgi3jlEfeYd/g0Dazi4na91ReJBIWPV6wCguWjcAKx6ih5YDbq2jPWx9O
 jDik5EJfxvu4iHpXMs/L09f9biYDZvq2JL6XmXd+fRhwlE1eODhJhFlckkoDuAfydFcL
 r5Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SPN5AL1B
Subject: [Buildroot] [PATCH 2/2] docs/website: add current LTS sponsors
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the LTS sponsors who engaged already for 2025: EVS, Open Home
Foundation, and Sense Labs. There is one more sponsor but they prefer to
remain anonymous.

For Open Home Foundation, we can reuse the existing logo. For the other
two, add their logo.

Add a new class panel-lts-sponsor for sizing the panels. It is different
from panel-sponsor because there doesn't need to be space for an
explanation of what type of sponsorship is done, we just need to have
space for the company name. So the minimum height is 200px instead of
350px.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/css/main.css          |   6 +++
 docs/website/images/evs-logo.png   | Bin 0 -> 16552 bytes
 docs/website/images/sense-logo.png | Bin 0 -> 2616 bytes
 docs/website/sponsors.html         |  59 +++++++++++++++++++++++++++--
 4 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 docs/website/images/evs-logo.png
 create mode 100644 docs/website/images/sense-logo.png

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 5255531b30..81bcd2c4b6 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -168,6 +168,12 @@ i {
 	text-justify: inter-word;
 }
 
+.panel-lts-sponsor {
+	min-height: 200px;
+	text-align: justify;
+	text-justify: inter-word;
+}
+
 @media (min-width: 768px) and (max-width: 991px) {
 	.navbar-collapse.collapse {
 		display: none !important;
diff --git a/docs/website/images/evs-logo.png b/docs/website/images/evs-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..bcaabe8cb5b76922262bd161b1f3d61625a3e4df
GIT binary patch
literal 16552
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

literal 0
HcmV?d00001

diff --git a/docs/website/images/sense-logo.png b/docs/website/images/sense-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..d4cab95b82029f5a7e9584e2f1fd43419799aadc
GIT binary patch
literal 2616
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
XPvG8{)IO`+|IS&O+G48E-i&_(pQgej

literal 0
HcmV?d00001

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index e5fdbc8c88..ba11b4b081 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,11 +9,62 @@
     <div class="panel-body">
       <p>The maintenance of the Long Term Support branch of Buildroot is
          possible thanks to the sponsors of the
-         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsorship
          Program</a>.</p>
-      <p>When the Buildroot LTS Sponsoring program will be operational
-         later in 2024, those sponsors will be mentioned here.</p>
-      </div>
+    </div>
+    <div class="panel-body">
+      <h3>Gold Sponsors</h3>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://evs.com">
+		  <img class="img-responsive center-block" src="images/evs-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="http://evs.com">EVS Broadcast Equipment</a>
+	      </div>
+	    </div>
+	  </div>
+	</div>
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.openhomefoundation.org/">
+		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="https://www.openhomefoundation.org">Open Home
+		Foundation</a>
+	    </div>
+	  </div>
+	</div>
+    </div>
+
+    </div>
+    <div class="panel-body">
+      <h3>Bronze Sponsors</h3>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.sense.com">
+		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12">
+		<a href="https://www.sense.com">Sense Labs</a>
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
+    </div>
     </div>
 
     <div class="panel panel-primary">
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
