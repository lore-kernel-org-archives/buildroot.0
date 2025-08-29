Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C9C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B212341783;
	Fri, 29 Aug 2025 09:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc5gjyCfWxvl; Fri, 29 Aug 2025 09:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98C141786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98C141786;
	Fri, 29 Aug 2025 09:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 825DA69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6818884183
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syaKLsJdtsSC for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E40183D58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E40183D58
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E40183D58
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:09:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-45b7722ea37so5769435e9.1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 02:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756458541; x=1757063341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JW7i0yoB1WMjNV9czC8kGkpl0n5SpM4WIlcLKmIcXY8=;
 b=jTfU3O3x79EFJTY37n2LdixE/s/S3IDcPKVj5VsFSic2wRZfakxQHi96l6EPFi6m9e
 4WQLRoluIqhUuOBc84JU9QiEtXzLL8cde8Qir/xKvj2mbBC1L0gsP7cTD1BkDczkXDby
 4AXJupQnGEGJ0b5FojktHZhaOQf+9J4A7GvcqjwXx7UWD3nFg9zjQHFAVfm4wf1LXhiq
 jHgq4mT3rsjNLrqG59ynKU+UlkHLRhCryDtNSdCYhVgvLuzNoPD8lMa+a1kiUCTvLx4y
 SURLhtmtiYfV0P0aRKSYo/MzuWWrnNH+SchcZUEq1nJKxIwYa3dHCYdWxUGD/r0t0Lm3
 g3dQ==
X-Gm-Message-State: AOJu0Yz/7hoGrGGhOzunmG1bIK1TFhPocFYkrSLu3w2azpMFQAtMwqfh
 sExuLZZm8/Jj0VuZyAAIho+LKr4mN48EUtwv61HH/VEc7209bP50HG9t7XLO8Z5anOYyIvx99OL
 fU+BFw7KgE32IEXc=
X-Gm-Gg: ASbGncvW7fyU2eyem3p5OhQPa0vpyRzk3M1YaLr0wIaI6vKpPt7GGeMcs6E6eibhWlF
 /Tp14Igdd4YANxJR1jWDRrZzMtVoR33uRNGuecgG/3K8Y/QWVy+rOqAPSthoYIREFRGKnf5Qjfd
 lAdBlS/oVjVXEBKeUzLQ6c7qiRPr4whfiPxuVSX1ltP5lkTPuWhr79BtyQoqSZkKayjwaOt/v6B
 iti0/HJhxWWhG3TpadQhPM1VzeG3iZL8kl0Jnn4vT7hb5X1X5UdCLjOhCnZYy4zrfKN+dDO7+0D
 Phq0RiOBjlusr5GCeOZz92ohhXCXP2ShF5DFRJ9DnocSUUAlB6wJ9YpzTUAxnOGp6/cQ3UwcXJZ
 /PkUkLPmy8B+M+oUL1wr45DaAqsREuBS9vHA489JsRiq2xbC6jN6vqzIYN3KRC0+8OuA9rT85fJ
 39HuL6AA==
X-Google-Smtp-Source: AGHT+IHMDJVhrJJyKFl87nbqY8pdIJhnY7cG1F16qpYa0OWSCn4qVLnE/d+3y3NRwJMB3RNWITmJJQ==
X-Received: by 2002:a05:600c:4588:b0:45b:47e1:ef7c with SMTP id
 5b1f17b1804b1-45b68714514mr106069015e9.18.1756458540432; 
 Fri, 29 Aug 2025 02:09:00 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e92a42asm28360965e9.20.2025.08.29.02.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 02:09:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 11:08:42 +0200
Message-ID: <20250829090842.103239-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756458541; x=1757063341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JW7i0yoB1WMjNV9czC8kGkpl0n5SpM4WIlcLKmIcXY8=;
 b=PZxsmDrmu+Jv5O4kxBtLIROBhwnjsptRstVO2EkkH/4Hxqt+eEjTZ9X55THJ6V3ju3
 J04B1rbSlCph2lUeN59Aqs2LDFtgPHyB6jwyNxBThwR3Ft8zfgdHa6zCTbrZVN5uQK/M
 gQLYcMFEEGyRXXmkX/0Pk6y7cMzJUMS8DpM/ZiyRlLDhCvcO6/qFRqCk5cjnSyJKQoyc
 sclxHBpizr/zlxsutOfBxLvjA2WMj/1rOFhnZ1kim6wbMCOReBF1yM1yvK1h5NOLiETf
 spb2+XHViyrXk8y/wYk9AM4L0yv80b8kTUg/P0lSkIIdkq+8JHAtInrZ8du9810g6qL9
 d5Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PZxsmDrm
Subject: [Buildroot] [PATCH] docs/download: rework download section
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: thomas.perale@mind.be, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Display active Buildroot versions as a table, similarly to kernel.org
- Add latest release date for all version
- Add expected End of Life dates for all versions
- Add link to the changelog

This makes the section much more compact, which makes it easier for
users to compare the versions and know what to expect from them

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
This is how it now looks like: https://imgur.com/a/a3ipSiz
---
 docs/website/download.html | 190 +++++++++++++++++--------------------
 1 file changed, 88 insertions(+), 102 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index ee466e3d85..46887a0511 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,108 +7,94 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Download</div>
     <div class="panel-body">
-
-      <h3 style="text-align: center;">Latest long term support release: <b>2025.02.5</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2025.02.5.tar.gz">buildroot-2025.02.5.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.5.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.5.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.5.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.02.5.tar.xz">buildroot-2025.02.5.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.5.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
-
-      <h3 style="text-align: center;">Latest stable release: <b>2025.05.1</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2025.05.1.tar.gz">buildroot-2025.05.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05.1.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.05.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.05.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.05.1.tar.xz">buildroot-2025.05.1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05.1.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc3</b></h3>
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.gz">buildroot-2025.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.xz">buildroot-2025.08-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
+      <table class="table">
+        <tr>
+          <td></td>
+          <th>Series</th>
+          <th>End of Life</th>
+          <th>Latest release</th>
+          <th>Latest release date</th>
+          <th colspan="2">Downloads</td>
+        </tr>
+        <tr>
+          <th>Candidate</th>
+          <th>2025.08.x</th>
+          <td>December 2025</td>
+          <td>
+            2025.08-rc3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc3/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-28</td>
+          <td>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+        <tr>
+          <th>Stable</th>
+          <th>2025.05.x</th>
+          <td>September 2025</td>
+          <td>
+            2025.05.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.1/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-11</td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.1.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.1.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.1.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.1.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+        <tr>
+          <th>Long-term support</th>
+          <th>2025.02.x</th>
+          <td>March 2028</td>
+          <td>
+            2025.02.5<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.5/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-11</td>
+          <td>
+            <a href="/downloads/buildroot-2025.02.5.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.5.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.02.5.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.5.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+      </table>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
